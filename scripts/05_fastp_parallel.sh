#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=4 ## Change this
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=05_fastp.err
#SBATCH --output=05_fastp.out

## This script is to run fastp on your data
## It shows you how to run scripts in parallel (i.e. several samples at the same time)
## Read the 05 document for more info

############################################
## Load module
############################################

module load fastp

############################################
## User-defined variables (EDIT THESE)
############################################

## Path to your working directory
DATA="/mnt/scratch/[USERNAME]/"

############################################
## Run fastp
############################################

## BEFORE YOU RUN THIS
## 1. Make sure that you have edited the number of tasks in the header to represent the below tasks you are trying to run
## 2. Update the sample ID's with your own IDS - we recommend that you do this in a good text editor!
## 2a. Recommended: Keep a list of your IDs and paste as a column (ask if not sure) to aviod typos!

srun --exclusive -n 1 fastp -i ${DATA}/Example_data1_R1.fastq.gz -I ${DATA}/Example_data1_R2.fastq.gz -p -c --merge --merged_out=${DATA}Example_data1_merged.fastq.gz -o ${DATA}Example_data1_1_un.fastq.gz -O ${DATA}Example_data1_2_un.fastq.gz  ${DATA}Example_data1_log_report.html -j ${DATA}Example_data1.json -R 'Example_data1_params.report' -w 1  2> ${DATA}Example_data1.log &
srun --exclusive -n 1 fastp -i ${DATA}/Example_data2_R1.fastq.gz -I ${DATA}/Example_data2_R2.fastq.gz -p -c --merge --merged_out=${DATA}Example_data2_merged.fastq.gz -o ${DATA}Example_data2_1_un.fastq.gz -O ${DATA}Example_data2_2_un.fastq.gz  ${DATA}Example_data2_log_report.html -j ${DATA}Example_data2.json -R 'Example_data2_params.report' -w 1  2> ${DATA}Example_data2.log &
srun --exclusive -n 1 fastp -i ${DATA}/Example_data3_R1.fastq.gz -I ${DATA}/Example_data3_R2.fastq.gz -p -c --merge --merged_out=${DATA}Example_data3_merged.fastq.gz -o ${DATA}Example_data3_1_un.fastq.gz -O ${DATA}Example_data3_2_un.fastq.gz  ${DATA}Example_data3_log_report.html -j ${DATA}Example_data3.json -R 'Example_data3_params.report' -w 1  2> ${DATA}Example_data3.log &
srun --exclusive -n 1 fastp -i ${DATA}/Example_data4_R1.fastq.gz -I ${DATA}/Example_data4_R2.fastq.gz -p -c --merge --merged_out=${DATA}Example_data4_merged.fastq.gz -o ${DATA}Example_data4_1_un.fastq.gz -O ${DATA}Example_data4_2_un.fastq.gz  ${DATA}Example_data4_log_report.html -j ${DATA}Example_data4.json -R 'Example_data4_params.report' -w 1  2> ${DATA}Example_data4.log &
wait
