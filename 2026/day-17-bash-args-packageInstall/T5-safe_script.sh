#!/bin/bash

set -e # immediately exit the script if any command fails

mkdir -p /home/ubuntu/myfolder || { echo "failed to create the direcorty"; exit 1; }

touch /home/ubuntu/myfolder/testfile.txt || { echo "failed to create the file"; exit 1; }

echo "All Steps completed Successfully"