#!/bin/bash

### To run this script you must first type this into the command line:
### chmod 700 01_echo_cat.sh
### Then run it by typing ./01_echo_cat.sh

DATA="/mnt/scratch/FYPs_2526/"

echo "Hello, world!"

cat ${DATA}Test_file.txt
