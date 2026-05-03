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