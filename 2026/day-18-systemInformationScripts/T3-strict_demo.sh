#!/bin/bash

set -euo pipefail

<<note
To make the script in production level use this setting to avoid failure

set e - exit immediately if Any Running a failing command
set u - exit immediately if Any undefined variable found in the script
set -o pipefail - exit immediately if Any starting pipeline commands fail so it will not execute next command in the pipeline
example cat file.txt | grep - "level"  if cat commands get failed then grep will not execute

note

echo "print the undefine variable: $myvar" || echo "Caught undefined variable error"

cd /wrong_dir || echo "Caught command failure"

cat file.txt | grep -i "level" || echo "Caught pipe failure"

echo "Script Completed successfully"