#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=03_count_fastq_lines.err
#SBATCH --output=03_count_fastq_lines.out

## This script counts the number of lines in a gzipped FASTQ file
## Copy the data from here:
## /mnt/scratch/FYPs_2526/Example_data_R1.fastq
## /mnt/scratch/FYPs_2526/Example_data_R2.fastq
## To your analysis folder:
## /mnt/scratch/[USERNAME]/
## Replace the text in square brackets and submit to slurm

DATA="/mnt/scratch/[USERNAME]/"
FASTQ="[SAMPLE_ID].fastq.gz"

echo "Counting lines in ${FASTQ}"

zcat ${DATA}${FASTQ} | wc -l > fastq_line_count.txt

echo "Done. Output written to fastq_line_count.txt"
