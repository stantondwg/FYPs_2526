# Mapping Reads to Multiple Mitochondrial Genomes – Notes & Things to Think About

## Overview
This script maps **merged sequencing reads** to a panel of mitochondrial genomes to help estimate:

1. How much **usable DNA** is present in your sample(s)  
2. Which **species** the DNA is most closely related to

> **Important:** This is only mitochondrial DNA. It **does not provide any information about nuclear DNA content**, and results are limited by the reference database used.

---

## Key Features of the Script
- **Single-task Slurm job** (one CPU, one node)
- IF YOU WANT TO ANALYSE MULTIPLE FILES AT THE SAME YOU NEED TO MAKE IT PARALLEL (see prev. scripts) 
- Uses **bwa aln/samse** for alignment of short reads  
- Sorts the output into a **BAM file** using `samtools sort`  
- File paths / locations are **user-defined** in variables at the top of the script  

---

## User-defined Variables (Things You Must Edit)
- `REF` – Path to your **mitochondrial reference FASTA**  
- `DIR` – Path to your **working directory**  
- `[YOUR_SAMPLE1]` – The specific sample ID you want to map  

> ⚠️ Make sure the sample names and paths correspond to your actual files, otherwise the script will fail.

---

## Things to Think About / Questions
- **Reference coverage:** Is your mitogenome panel comprehensive enough to include your species?  
- **Resource allocation:** This script is single-threaded (`-t 1`). If you want to map **many samples simultaneously**, consider running multiple jobs in parallel using Slurm (`--ntasks=N` with backgrounded `srun`)  

---

## Reminder of General Notes on Using Gomphus
- Submit the script with:

```bash
sbatch 06_MapToMultiMito.sh
```

- View job status:

```bash
squeue -u <username>
```

- Cancel if needed:

```bash
scancel <jobid>
```

- Check logs in the same directory:

```text
06_MapToMultiMito.out
06_MapToMultiMito.err
```

---

## Things to Keep in Mind
- Each Slurm job is **single-threaded** here. If mapping many samples, either submit multiple jobs or modify for **parallel tasks**  
- Always check **file paths, sample IDs, and references** before submitting  
- Mitochondrial mapping only tells you about **mtDNA**. Nuclear DNA content requires a separate approach  
- Consider **database completeness**: missing species will map to the closest available genome

