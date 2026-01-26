# Mapping to a Nuclear Genome – Purpose and Workflow Notes

## Overview
This script is designed to map sequencing reads to a nuclear genome reference. It ensures a systematic approach to evaluating nuclear DNA assembly quality and identifying potential contamination or misalignments. The script provides flexibility by allowing users to define paths for input files and output storage.

---

## Key Features of the Script
- Maps reads using the **BWA mem** alignment tool for genomic-scale references.
- Outputs sorted BAM files using `samtools`.
- Allows custom configuration for:
  - Reference genome file path.
  - Input sample data.
  - Scratch space or working directory locations.

---

## User-defined Variables (Things You Need to Edit)
Before running the script, ensure you modify the following variables as required for your dataset:
- `REF_NUCLEOME` – Path to the nuclear genome reference FASTA file.
- `DIR_IN` – Path where your raw sequencing files are stored.
- `DIR_OUT` – Path for sorted alignment output (should be a scratch or project data directory).
- `SAMPLE` – Define the sample file name you’re working with.

Ensure all file paths are **absolute paths** to prevent errors during job execution.

---

## Workflow Steps and Example Usage
### Step 1: Prepare Your Environment
- Ensure the appropriate modules (e.g., `bwa`, `samtools`) are loaded using the `module load` command.

```bash
module load bwa
module load samtools
```

### Step 2: Submit the Job to Gomphus via Slurm
Submit the script for processing using Slurm:

```bash
sbatch 10_map_to_nuc.sh
```

### Example Logging and Error Files:
Check the `*.out` and `*.err` files in the same directory for job progress and potential errors:
```text
10_map_to_nuc.out
10_map_to_nuc.err
```

---

## Considerations and Questions to Address Before Running
1. **Reference Genome Selection**:
   - Have you chosen the correct nuclear genome for your species? 
   - A mismatched genome can lead to significant alignment errors.
   
2. **Alignment Quality**:
   - Does `BWA mem` perform adequately for the read lengths and quality of your dataset?

3. **Resource Allocation**:
   - This script is optimized for **single-task execution**. If aligning multiple samples, consider adjusting the script for parallel submission.

---

## General Notes for Job Execution on Gomphus
- Always confirm software dependencies are loaded.
- Use the `squeue` command to monitor your job status:
```bash
squeue -u <username>
```
- Use `scancel` to cancel jobs if needed:
```bash
scancel <jobid>
```

--- 
