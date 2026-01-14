#!/bin/bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000
#SBATCH --error=06_MapToMultiMito.err
#SBATCH --output=06_MapToMultiMito.out

## This script maps merged reads to a panel of mitochondrial genomes
## Mapping to mitochondrial DNA can help you estimate:
## 1. How much usable DNA is present in your sample(s)
## 2. Which species the DNA is most closely related to
##
## IMPORTANT:
## - YOU NEED TO MAKE SURE THAT IDs AND LOCATIONS CORRESPOND TO YOUR DATA
## - This only considers mitochondrial DNA
## - It provides no information about nuclear DNA content
## - Results depend entirely on the reference database used
## - If your species is not present, reads may map to the closest related species

############################################
## Load required modules
############################################

module load bwa
module load samtools

############################################
## User-defined variables (EDIT THESE)
############################################

## Path to mitochondrial reference FASTA
REF="/mnt/scratch/FYP24-25_IMR_FH_DS/refs/0_mitogenome_panel_250113.fasta"

## Path to your working directory
DIR="/mnt/scratch/[USERNAME]/"

## Sample name (do not include file extension)
SAMPLE="YOURSAMPLE"

############################################
## Map reads to mitochondrial reference
############################################

## This uses bwa aln/samse for short-read alignment
## Output is a sorted BAM file

bwa aln -l 16500 -n 0.01 -o 2 -t 1 ${REF} ${DIR}/[YOUR_SAMPLE1]_merged.fq.gz | bwa samse ${REF} - ${DIR}/[YOUR_SAMPLE1]_merged.fq.gz | samtools sort - > ${DIR}/[YOUR_SAMPLE1].mito.bam
