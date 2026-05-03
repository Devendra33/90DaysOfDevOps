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