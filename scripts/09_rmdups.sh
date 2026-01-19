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

############################################
## Load required modules
############################################

module load samtools

############################################
## User-defined variables (EDIT THESE)
############################################

## Path to your data directory & the location of the "samremovedup.py" script, which is the script we use to remove duplicates
## Update these to point towards your data (keep the one for samremovedup.py the same)
## TO MAKE THIS AS STRAIGHTFORWARD AS POSSIBLE:
## - COPY AND PASTE THE OUTPUT LOCATION FROM YOUR PREVIOUS SCRIPT (08...) TO THE INPUT LOCATION OF THIS ONE

DIR="/mnt/scratch/[USERNAME]/"
RMDUP="/mnt/scratch/FYPs_2526/scripts/samremovedup.py"

#############################################################
## Extract only the reads that have mapped to the mito genome
#############################################################

## The rationale for this step is given in the "07 - Viewing and processing BAM files.md" file

samtools view -q 20 ${DIR}/[YOUR_SAMPLE1].single.mito.bam -O BAM -o ${DIR}/[YOUR_SAMPLE1].single.mito.mapped.q20.bam

## Questions:
# What does the -q 20 flag do?
# Why this value? What are the implications?

####################
## Run rmdup
####################

## Input your mitochondrial mapped file
## Output a version without duplicates

samtools view -h ${DIR}[YOUR_SAMPLE1].single.mito.mapped.q20.bam | python ${RMDUP} | samtools view -bS - > ${DIR}[YOUR_SAMPLE1].single.mito.mapped.q20.rmdup.bam

