# Day 17 – Bash Scripting Tasks

## Task 1: For Loop
**Scripts:** `T1-count.sh`, `T1-for_loop.sh`

### Notes
- Create the scripts: `touch T1-count.sh T1-for_loop.sh`
- Make them executable: `chmod u+x T1-count.sh T1-for_loop.sh`

### Output

```bash
#!/bin/bash

for i in {1..10}
do 
    echo "$i"
done

```

- `T1-count.sh` output shown below \
![alt text](image.png)

```bash
#!/bin/bash

fruits=("apple" "banana" "cherry" "date" "elderberry")
for i in "${fruits[@]}"
do
    echo "$i"
done

<<comment 
Using Indexing Method
fruits=("apple" "banana" "cherry" "date" "elderberry")
for i in "${!fruits[@]}"      Note - ! is used to get the index of the array
do
    echo "At index $i, the value ${fruits[$i]}"
done
comment
```

- `T1-for_loop.sh` output shown below \
![alt text](image-1.png)

---

## Task 2: While Loop
**Script:** `T2-whileLoop-countdown.sh`

### Notes
- Create the script: `touch T2-whileLoop-countdown.sh`
- Make it executable: `chmod u+x T2-whileLoop-countdown.sh`

```bash
#!/bin/bash

read -p "Enter a countdown Number: " num
 while [ "$num" -gt 0 ]
 do
    echo "$num"
    ((num--))   # better than num=$((num-1))
 done

```

### Output 
![alt text](image-2.png)

---

## Task 3: Command-Line Arguments
**Scripts:** `T3-Args-greet.sh`, `T3-args_demo.sh`

### Notes
- Create the scripts: `touch T3-Args-greet.sh T3-args_demo.sh`
- Make them executable: `chmod u+x T3-Args-greet.sh T3-args_demo.sh`

### Output
- `T3-Args-greet.sh` output shown below

```bash
#!/bin/bash

<<usage
call the the script by ./T3-Args-greet.sh <name1> <name2>
usage

if [ -z $1 ] || [ -z $2 ]; then
        echo "string passed is empty. Please pass 2 names as arguments to the script"
        echo "Usage: ./T3-Args-greet.sh <name1> <name2>"
        exit 1
fi

echo "args 1 passed name - $1"
echo "args 2 passed name - $2"
# -z returns true if the string is empty

if [ -z $1 ] && [ -z $2 ]; then
        echo "string passed is empty"
else
        echo "Hello $1 and $2, Good Morning!"
fi

# To test it ./T3-Args-greet.sh Devedra jatin
```

![alt text](image-3.png)

- `T3-args_demo.sh` output shown below

```bash
#!/bin/bash

# Demo of special characters for arguments $@, $#, $0
# $@ - prints all the arguments passed in the script
# $# - print the count of total number of arguments passed
# $0 - prints the script name

echo "Name of all the Arguments passed - $@"
echo "Count of Total arguments - $#"
echo "Script Name - $0"

# To run the script, use the command: bash T3-args_demo.sh arg1 arg2 arg3

```

![alt text](image-4.png)

---

## Task 4: Install Packages via Script
**Script:** `T4-install_packages.sh`

### Notes
- Create the script: `touch T4-install_packages.sh`
- Make it executable: `chmod u+x T4-install_packages.sh`

```bash
#!/bin/bash

# Defining list of packages need to be installed [by default]

package=("docker.io")

# Check if script is running as root user or not
if [ $USER = "root" ]; then
        echo "Running as Root user"
        echo "Update all the dependencies before installing the packages"
        apt-get update
else
        echo "EXITED!!...Current user is $USER. Run as Root user to move forward"
        exit 1
fi

# Adding argument package in list [use for loop with $@]
for i in "$@"
do

if [ -n $i ]; then             # -n returns true if the string is not empty
        package+=("$i")
fi

done 

# Print list of all 

for i in "${package[@]}"
do
        if dpkg -s "$i" &> /dev/null; then    # if the command run successfully then it is treated as success. if it gives error then it is treated like failure
                echo "$i is installed Already. with Current Status: $flag"
                echo "Note - its status may be false positive."
                systemctl is-active "$i"
        else
                echo "$i is Not installed, preparing for installation"
                apt-get install "$i" -y        # -y is used to automatically answer yes to all prompts and run non-interactively

        fi
done

```

### Output
![alt text](image-5.png)

---

## Task 5: Error Handling
**Script:** `T5-safe_script.sh`

### Notes
- Create the script: `touch T5-safe_script.sh`
- Make it executable: `chmod u+x T5-safe_script.sh`

```bash
#!/bin/bash

set -e # immediately exit the script if any command fails

mkdir -p /home/ubuntu/myfolder || { echo "failed to create the direcorty"; exit 1; }

touch /home/ubuntu/myfolder/testfile.txt || { echo "failed to create the file"; exit 1; }

echo "All Steps completed Successfully"

```

### Output
![alt text](image-6.png)


