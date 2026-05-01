#!/bin/bash

echo "args 1 passed name - $1"
echo "args 2 passed name - $2"
# -z returns true if the string is empty

if [ -z $1 ] && [ -z $2 ]; then
        echo "string passed is empty"
else
        echo "Hello $1 and $2, Good Morning!"
fi

# To test it ./T3-Args-greet.sh Devedra jatin