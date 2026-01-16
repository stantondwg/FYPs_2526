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

bwa aln -l 16500 -n 0.01 -o 2 -t 1 ${REF} ${DIR}[YOUR_SAMPLE1]_merged.fq.gz | bwa samse ${REF} - ${DIR}/[YOUR_SAMPLE1]_merged.fq.gz | samtools sort - > ${DIR}/[YOUR_SAMPLE1].single.mito.bam
