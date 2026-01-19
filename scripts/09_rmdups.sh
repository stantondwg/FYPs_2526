#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=09_rmdups.err
#SBATCH --output=09_rmdups.out

## This script uses samtools to keep only one copy of any duplicated reads
## Intended to be run on slurm, with extra info/context given in: "09 - Removing duplicates and extracting the mitochondrial reads.md"
## You need to copy this script and modify it to contain your own data and locations


