#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=08_mapping_to_single_mito_genome.err
#SBATCH --output=08_mapping_to_single_mito_genome.out

## This script uses bwa to map to a single mitochondrial genome, rather than the "Multi Mito" alignment (bam file)
## Intended to be run on slurm, with extra info/context given in: "08 - Mapping to single mito genome.md"
## Note - you will need to create and index that mito genome before you can map to it. See details in: "08 - Mapping to single mito genome.md"

############################################
## Load required modules
############################################

module load bwa
module load samtools

############################################
## User-defined variables (EDIT THESE)
############################################

## Path to your working directory
## Update these to point towards your data and the genome you want to map to
DIR="/mnt/scratch/[USERNAME]/"
REF="/mnt/scratch/[USERNAME]/[YOUR_MITO_GENOME].fasta"

############################################
## Map reads to mitochondrial reference
############################################

## This uses bwa aln/samse for short-read alignment
## Output is a sorted BAM file
## HERE IF YOU HAVE LOTS OF FILES - YOU COULD:
## 1. Submit them all in parallel (as per previous scripts)
## 2. Loop through your files with a simple "bash loop" and output the results into a single output file

samtools view -q 20 ${DIR}[YOUR_FILE].bam | awk '{print $3}' | sort | uniq -c | sort -k1,1 -nr > [YOUR_FILE]_MultiMito_q20.out

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
