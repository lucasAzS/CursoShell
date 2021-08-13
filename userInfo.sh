#!/usr/bin/env bash

ls /home/"$1" >/dev/null 2>&1 || {
    echo "User don't exist."
    exit 1
}

USER_ID=$(id -u "$1")
DESC=$(grep "$1" /etc/passwd | cut -d: -f5 | tr -d ,)
DISK_USED=$(du -sh /home/"$1" | cut -f1)

clear

echo "================================================="
echo "User: $1"
echo
echo "UID: $USER_ID"
echo "Name or Desc: $DESC"
echo
echo "Home Disk used: $DISK_USED"
echo "Last Login:"
lastlog -u "$1"
echo "================================================"
exit 0
