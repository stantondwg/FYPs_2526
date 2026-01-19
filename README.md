# FYPs_2526 — Final Year Projects (2025–2026) — HPC & Linux Guidance

This repository contains short guides and example scripts to help Final Year Project students get started with High Performance Computing (HPC) and Linux on the university servers for 2025–2026.

Contents (very brief summaries + main aims of corresponding scripts)
- 01 - Introduction to High Performace Computing and Linux.md  
  A short overview of what an HPC cluster is, why clusters use Linux, and essential Linux commands you should know.  
  Related script(s): `scripts/01_echo_cat.sh` — tiny demo script to show basic shell commands (`echo`, `cat`) and how to run simple scripts locally.

- 02 - Accessing the servers.md  
  Practical instructions for connecting to the Gomphus cluster (VPN requirement, SSH clients for macOS/Windows).  
  Related script(s): none required — this doc explains connection and client setup.

- 03 - Finding your way around gomphus in Linux.md  
  Walkthrough of standard paths on Gomphus, where to store data vs. scratch, and common file-system commands (copying, checking sizes). Helps you prepare your project folders.  
  Related script(s): `scripts/03_count_fastq_lines.sh` — utility to count lines/reads in FASTQ files so you can inspect dataset sizes before analysis.

- 04 - Editing and submitting scripts.md  
  Guidance on editing scripts on the server (nano etc.), best practices for keeping scripts in your project folders, and how to submit jobs with Slurm (`sbatch`).  
  Related script(s):
    - `scripts/01_echo_cat.sh` — run locally as an edit/run example.
    - `scripts/02_echo_cat-slurm.sh` — simple Slurm job template showing `#SBATCH` headers and how to submit/monitor jobs.

- 05 - Gomphus_Info_and_running_scripts_in_parallel.md  
  Cluster details (nodes, partitions, modules) and recommended patterns for running many independent tasks in parallel within a single Slurm job (backgrounding with `&` + `wait`). Covers when to use this vs. threaded/MPI jobs.  
  Related script(s):
    - `scripts/04_run_fastp_testdata.sh` — example showing a single-sample `fastp` run (useful for testing and learning).
    - `scripts/05_fastp_parallel.sh` — example showing how to run multiple `fastp` jobs in parallel inside one Slurm allocation (embarrassingly-parallel pattern).

- 06 - Mapping to Multi Mito file.md  
  Notes and considerations for mapping sequencing reads against a panel of mitochondrial reference genomes to estimate mtDNA content and likely species matches. Emphasises limitations (mtDNA only) and single‑threaded mapping approach.  
  Related script(s): `scripts/06_map_to_multi-mito.sh` — performs BWA alignment (aln/samse), samtools sort → BAM; variables at top for reference, sample and directories.

- 07 - Viewing and processing BAM files.md  
  Instructions for inspecting and summarising BAM files (samtools view/index/flagstat, plotting summaries) and how to extract useful metrics from alignment outputs.  
  Related script(s): `scripts/07_summarising_multi_mito_bam.sh` — produces summaries from multi-mito BAMs (counts, coverage, basic QC) and writes human-readable result files.

- 08 - Mapping to single mito genome.md  
  Guide for remapping reads to a single mitochondrial genome (e.g., after selecting the best matching reference) and rationale for doing a focused mapping pass.  
  Related script(s): `scripts/08_mapping_to_single_mito_genome.sh` — mapping pipeline for a single mito reference, producing sorted/indexed BAMs for downstream processing.

- 09 - Removing duplicates and extracting the mitochondrial reads.md  
  Steps to mark/remove PCR duplicates, isolate mitochondrial-mapped reads, and prepare cleaned BAMs for analysis (variant calling, consensus building).  
  Related script(s): `scripts/09_rmdups.sh` — marks/removes duplicates (samtools/picard-like workflows) and extracts mito reads into a separate BAM for analysis.

How to use these materials
- Read the guides in order if you're new to Linux and HPC.
- Copy or adapt the example scripts in your own project directories — do not edit shared files in the repo directly unless instructed.
- Update file paths and sample IDs at the top of each script before submitting on Gomphus.
- For parallel processing of many samples, prefer the parallel examples in `05_fastp_parallel.sh` (or submit multiple single-sample jobs) rather than running many heavyweight threaded jobs in the same allocation.

Scripts location
- All example scripts live in the `scripts/` directory (01–09). Use them as templates: change `REF`, `DIR`, sample IDs and resource requests before running.

Contributing / Questions
- If you spot an error or have a suggestion, open an issue or submit a pull request on this repository.
- For direct help, contact the repository owner: [stantondwg](https://github.com/stantondwg).

Notes
- These are introductory/example materials; they are not exhaustive tutorials.
- Always check file paths, sample names and resource settings before submitting jobs to Gomphus.

License
- Scripts and code in this repository are licensed under the MIT License: see <a>LICENSE</a>.
- Documentation and other non-code materials (Markdown files, text content) are licensed under Creative Commons Attribution 4.0 International (CC BY 4.0): see <a>LICENSE-CC-BY-4.0.md</a>.

---
Prepared for 2025–2026 Final Year Project students.
