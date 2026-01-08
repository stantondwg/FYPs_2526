#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=01_cat_echo.err
#SBATCH --output=01_cat_echo.out

DATA="/mnt/scratch/FYPs_2526/"

echo "Hello, world!"
cat ${DATA}Test_file.txt
