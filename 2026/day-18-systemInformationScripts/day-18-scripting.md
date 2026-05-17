# Day 18 – System Information Scripts

## Task 1: Basic Functions
**Script:** `T1-functions.sh`

### Notes
- Create the script and make it executable: `touch T1-functions.sh && chmod u+x T1-functions.sh`
- Execute the script to see basic function usage.

```bash
#!/bin/bash

# function defination
greet() 
{
        echo "Hello $1"    # will be treated as local arguments
}

# Function calling
greet Devendra

add () 
{
        sum=$(($1+$2))     # will be treated as local arguments
        echo "Sum of 2 Numbers is: $sum" 
}

add 5 6
```

### Output
![alt text](image.png)

---

## Task 2: Functions with Return Values
**Script:** `T2-disk_check.sh`

### Notes
- Create the script and make it executable: `touch T2-disk_check.sh && chmod u+x T2-disk_check.sh`
- Run the script to verify return values and disk checks.

```bash
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
```

### Output
![alt text](image-1.png)

---

## Task 3: Strict Mode — `set -euo pipefail`
**Script:** `T3-strict_demo.sh`

### Notes
- Create the script and make it executable: `touch T3-strict_demo.sh && chmod u+x T3-strict_demo.sh`
- The script demonstrates safer execution using strict mode.

```bash
#!/bin/bash

set -euo pipefail

<<note
To make the script in production level use this setting to avoid failure

set e - exit immediately if Any Running a failing command
set u - exit immediately if Any undefined variable found in the script
set -o pipefail - exit immediately if Any starting pipeline commands fail so it will not execute next command in the pipeline
example cat file.txt | grep - "level"  if cat commands get failed then grep will not execute

note

echo "print the undefine variable: $myvar" || echo "Caught undefined variable error"

cd /wrong_dir || echo "Caught command failure"

cat file.txt | grep -i "level" || echo "Caught pipe failure"

echo "Script Completed successfully"
```

### Output
![alt text](image-2.png)

---

## Task 4: Local Variables
**Script:** `T4-local_demo.sh`

### Notes
- Create the script and make it executable: `touch T4-local_demo.sh && chmod u+x T4-local_demo.sh`
- Run it to see how local variable scope works inside functions.

```bash
#!/bin/bash

<<usage
call the the script by ./local_demo.sh <value>

usage


echo "This value is passed to through while running the script: $1"

myfun()
{
        echo "This my local value passed to the function: $1"
}

myfun Devendra
```

### Output
![alt text](image-3.png)

---

## Task 5: Build a Script — System Info Reporter
**Script:** `T5-system_info.sh`

### Notes
- Create the script and make it executable: `touch T5-system_info.sh && chmod u+x T5-system_info.sh`
- This script combines functions and system checks to produce a summary report.

```bash
#!/bin/bash

set -eou pipefail

os()
{
        echo "==========hostname and OS info==========="
        host=$( hostname )          # we can save output any linux command in variable using $() syntax.
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
```

### Output
![alt text](image-4.png)

