#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=07_summarising_multi_mito_bam.err
#SBATCH --output=07_summarising_multi_mito_bam.sh.out

## This script uses linux commands to summarise the output of the "Multi Mito" alignment (bam file)
## Intended to be run on slurm, with extra info/context given in: 07 - Viewing and processing BAM files

############################################
## Load required modules
############################################

module load bwa
module load samtools

############################################
## User-defined variables (EDIT THESE)
############################################

## Path to your working directory
DIR="/mnt/scratch/[USERNAME]/"

############################################
## Map reads to mitochondrial reference
############################################

## This uses bwa aln/samse for short-read alignment
## Output is a sorted BAM file
## HERE IF YOU HAVE LOTS OF FILES - YOU COULD:
## 1. Submit them all in parallel (as per previous scripts)
## 2. Loop through your files with a simple "bash loop" and output the results into a single output file

samtools view [YOUR_FILE].bam | awk '{print $3}' | sort | uniq -c | sort -k1,1 -nr > [YOUR_FILE]_MultiMito.out
samtools view -q 20 [YOUR_FILE].bam | awk '{print $3}' | sort | uniq -c | sort -k1,1 -nr > [YOUR_FILE]_MultiMito_q20.out

## NOTES
# "samtools" program for viewing/summarising bam/sam files
# "-q 20 " this is a "flag" to modify what samtools does - Q: What does this do??
# "|" this symbol is a "pipe" this means that the output of samtools is being redirected into another command (awk)
# "awk '{print $3}' " awk is a basic program for viewing editing files, "print $3" means only print the 3rd column
# "sort" sort the output
# "uniq -c" only give unique values, and count (-c) each occurrance
# "sort -k1,1 -nr" sort again by column 1 (-k1,1), as reverse numeric (-nr)
# ">" direct output into a file (called "[YOUR_FILE]_MultiMito_q20.out")

## QUESTIONS
# What does this output tell you?
# What is the difference between the two versions (-q20 used/not used)?
# What are the limitations of this method?
