#!/bin/bash

set -eou pipefail

os()
{
        echo "==========hostname and OS info==========="
        host=$( hostname )
        echo "Hostname: $host"
        os=$(cat /etc/os-release | awk 'NR==2')
        echo "OS Version: $os"
}

up()
{
        echo "==================uptime================="
        uptime
}

disk_usage()
{
        echo "=================disk usage=============="
        echo "Top 5 disk usage"
        df -h | sort -k5 -r | awk 'NR>=1 && NR<=6 {print $1 "\t" $5}'
        # sort -k5 means sort according to 5th column, -r means in reverse order
}


mem_usage()
{
        echo "==================memory usage==========="
        free -h
}

cpu()
{
        echo "==========top 5 CPU-consuming processes=="
        ps aux | sort -k3 -r | awk 'NR>=1 && NR<=6 {print $1 "\t" $2 "\t" $3 "\t" $11}'
}

main(){
os
up
disk_usage
mem_usage
cpu
}

main