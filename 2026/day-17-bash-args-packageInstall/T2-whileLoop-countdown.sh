#!/bin/bash

read -p "Enter a countdown Number: " num
 while [ "$num" -gt 0 ]
 do
    echo "$num"
    ((num--))   # better than num=$((num-1))
 done