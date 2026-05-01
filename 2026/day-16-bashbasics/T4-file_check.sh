#!/bin/bash

# Input file name from user
read -p "Enter the file name: " file

if [ -f "$file" ]; then
    echo "File Found"
else
    echo "File Does not Exist"
fi