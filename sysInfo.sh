#!/usr/bin/env bash

#OS_SYS_NAME=$(uname -s)
HOSTNAME=$(hostname)
DATE=$(date)
UP_SINCE=$(uptime -s)
KERNEL_VER=$(uname -r)
#CPU_CORES=$(grep '^cpu cores' /proc/cpuinfo | uniq | tr '\t' ' ')
CPU_THREADS=$(grep -c "model name" /proc/cpuinfo)
CPU_MODEL=$(grep 'model name' /proc/cpuinfo | uniq | tr '\t' ' ')
MEM_TOTAL=$(free -m | grep Mem: | awk '{print $2}')
FILESYS=$(df -h | grep -vE "{tmpfs|udev}")

showInfo() {
    echo "============================================================="
    echo "Info of the machine: $HOSTNAME"
    echo "Date/Rime: $DATE"
    echo "============================================================="
    echo ""
    echo "Machine on since: $UP_SINCE"
    echo ""
    echo "Kernel Version: $KERNEL_VER"
    echo ""
    echo "CPUs: "
    printf "Num of Threads: %s\n" "$CPU_THREADS"
    printf "%s\n" "$CPU_MODEL"
    echo ""
    echo "Total Memory: $MEM_TOTAL MB"
    echo ""
    echo "Partitions: "
    printf "%s\n" "$FILESYS"
}

showInfo
