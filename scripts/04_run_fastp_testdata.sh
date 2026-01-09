#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=04_fastp.err
#SBATCH --output=04_fastp.out

## This script runs fastp to perform basic quality control and trimming
## on paired-end FASTQ files.
##
## BEFORE YOU RUN THIS SCRIPT:
##
## 1. Copy the example data from:
##    /mnt/scratch/FYPs_2526/Example_data_R1.fastq.gz
##    /mnt/scratch/FYPs_2526/Example_data_R2.fastq.gz
##
## 2. Into your own analysis directory:
##    /mnt/scratch/[USERNAME]/
##
## 3. Replace ALL text inside square brackets [] (including the backets) below
##    with your own username and sample ID.
##
## QUESTIONS TO THINK ABOUT:
## - What does fastp do to the reads?
## - How many reads go in vs come out?
## - What information is in the HTML report?

############################################
## User-defined variables (EDIT THESE)
############################################

## Path to your working directory
DATA="/mnt/scratch/[USERNAME]/"

############################################
## Run fastp
############################################

fastp -i ${DATA}Example_data/Example_data_R1.fastq.gz -I ${DATA}Example_data/Example_data_R2.fastq.gz -p -c --merge --merged_out=${DATA}Example_data_merged.fastq.gz -o ${DATA}Example_data_1_un.fastq.gz -O ${DATA}Example_data_2_un.fastq.gz  ${DATA}Example_data_log_report.html -j ${DATA}Example_data.json -R 'Example_data_params.report' -w 1  2> ${DATA}Example_data.log

