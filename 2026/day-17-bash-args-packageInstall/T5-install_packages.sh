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
                apt-get install "$i"

        fi
done