#!/bin/bash

# Take input from user
read -p "Enter the Number: " num

# Check the number
if [ "$num" -gt 0 ]; then
    echo "Positive Number"
elif [ "$num" -eq 0 ]; then
    echo "Zero"
else
    echo "Negative Number"
fi