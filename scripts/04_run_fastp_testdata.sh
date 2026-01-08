#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2000
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
## 3. Replace ALL text inside square brackets [] below
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

## Sample ID (do NOT include _R1 or _R2)
SAMPLE="[SAMPLE_ID]"

############################################
## Input FASTQ files
############################################

R1="${DATA}${SAMPLE}_R1.fastq.gz"
R2="${DATA}${SAMPLE}_R2.fastq.gz"

############################################
## Output directory and files
############################################

## fastp output directory (will be created if it does not exist)
OUTDIR="${DATA}fastp_output/"

mkdir -p ${OUTDIR}

############################################
## Run fastp
############################################

echo "Running fastp on sample: ${SAMPLE}"
echo "Input R1: ${R1}"
echo "Input R2: ${R2}"

fastp \
  --in1 ${R1} \
  --in2 ${R2} \
  --out1 ${OUTDIR}${SAMPLE}_R1_trimmed.fastq.gz \
  --out2 ${OUTDIR}${SAMPLE}_R2_trimmed.fastq.gz \
  --html ${OUTDIR}${SAMPLE}_fastp_report.html \
  --json ${OUTDIR}${SAMPLE}_fastp_report.json \
  --thread 4

############################################
## Finish message
############################################

echo "fastp has finished running."
echo "Trimmed FASTQ files are in: ${OUTDIR}"
echo "Open the HTML report in a web browser to view QC results."
