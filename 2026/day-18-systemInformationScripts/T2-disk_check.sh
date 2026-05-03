#!/bin/bash

check_disk()
{
    df -h | awk 'NR>=1 && NR<=2 {print $1 "\t" $4}'
}

disk=$(check_disk)

check_memory()
{
    free -h
}
mem=$(check_memory)

echo "=========System Utilization========="

echo "=========Disk Utilizaiton==========="
echo "$disk"

echo "=========Memmory Utilization========"
echo "$mem"