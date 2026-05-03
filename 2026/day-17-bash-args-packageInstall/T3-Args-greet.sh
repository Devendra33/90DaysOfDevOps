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