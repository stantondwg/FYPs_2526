# Viewing and Processing BAM Files – Quick Guide for Gomphus

## Brief description
- The below gives a brief description of what bam files are, and how to look at them
- This is intended to give extra context for the "07_summarising_multi_mito_bam.sh" script
- It contains simple commands that can be pasted directly into the terminal to help you interpret that script

## Overview
**BAM files** are binary versions of SAM files and contain information on how/where sequencing reads have "aligned" or "mapped" to a reference genome. They can tell you:
- Which reads mapped to a reference sequence
- The quality of the mapping
- Which reference each read mapped to
- Read lengths and other metadata

> BAM files **cannot tell you** about unsequenced regions, overall genome completeness, or biological interpretation beyond the alignment.

---

## Loading Required Software
All BAM operations use **samtools**. Load the module with:

```bash
module load samtools
```

You can also include this line in your Slurm scripts if you are processing BAM files in a job.

---

## Quick Viewing Examples - these commands can be run directly on the terminal

### View top lines of a BAM file
```bash
samtools view /your/file/location/your_file_name.bam | head
```
- `| head` limits output to first few lines to avoid printing the entire file.

### View only **mapped reads**
```bash
samtools view -F 4 /your/file/location/your_file_name.bam | head
```

### View only **unmapped reads**
```bash
samtools view -f 4 /your/file/location/your_file_name.bam | head
```

### Count mapped/unmapped reads
```bash
samtools view -F 4 your_file.bam | wc -l   # mapped reads
samtools view -f 4 your_file.bam | wc -l   # unmapped reads
```

---

## Filtering by Mapping Quality
- BAM files contain a **mapping quality (MAPQ)** value per read.
- Example: view reads with MAPQ >= 20
```bash
samtools view -q 20 /your/file/location/your_file_name.bam | head
```

---

## Read Lengths
- Extract a particular column (replace `XXXX` with the correct column number for sequence):
```bash
samtools view /your/file/location/your_file_name.bam | awk '{print $XXXX}' | awk '{print length}' | head
```

---

## Counting Reads per Reference
- If mapping to a mitochondrial genome panel:
```bash
samtools view /your/file/location/your_file_name.bam | awk '{print $3}' | sort | uniq -c
```
- Column 3 identifies which reference each read maps to.

### Questions to consider
- How many reads map to each species?  
- Do you need to update your reference database to capture more species?  

---

## Updating Reference Databases
- Add extra sequences to your FASTA reference:

```text
>sequence1_ID
CAGTGACTCATGCTTG
GCTAGTCTGCTACGTG

>sequence2_ID
CAGTGACTCATGCTTG
GCTAGTCTGCTACGTG
```

- Re-index the reference after editing:
```bash
bwa index /my/new/reference/file.fasta
```

- Re-map reads to the updated reference and repeat counts as above.

---

## Notes
- Always give new references a distinct filename to avoid confusion with previous indexes.  
- Use `samtools` and basic Linux commands (`awk`, `sort`, `uniq`, `wc -l`) to quickly inspect BAM content.  
- Understanding mapping quality, read length, and reference coverage helps interpret results more accurately.  
- Keep in mind that BAM files only describe **alignment information**, not biological interpretation.  

