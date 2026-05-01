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