#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=01_cat_echo.err
#SBATCH --output=01_cat_echo.out

DATA="/mnt/scratch/FYPs_2526/"

### This is a "slurm script" - gomphus will recognise it as such due to the header (note the difference to the last script)
### Slurm is a job scheduler - it uses a queuing system to manage jobs on the cluster
### Details of this are given in "04 - Editing and submitting scripts"
### You submit these scripts to the queue by typing: sbatch script.sh

echo "Hello, world!"
cat ${DATA}Test_file.txt
