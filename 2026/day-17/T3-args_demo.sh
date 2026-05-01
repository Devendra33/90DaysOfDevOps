#!/bin/bash

# Demo of special characters for arguments $@, $#, $0
# $@ - prints all the arguments passed in the script
# $# - print the count of total number of arguments passed
# $0 - prints the script name

echo "Name of all the Arguments passed - $@"
echo "Count of Total arguments - $#"
echo "Script Name - $0"

# To run the script, use the command: bash T3-args_demo.sh arg1 arg2 arg3