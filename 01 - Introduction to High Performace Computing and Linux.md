# Introduction to Computing Clusters & Linux  - PART I
### For Biological Sciences Year 3 Research Projects (Cardiff University)

---

## What is a Computing Cluster?

A **computing cluster** (often called **High Performance Computing – HPC**) is a collection of many connected computers (called *nodes*) that work together as a single system. Clusters allow researchers to run analyses that are:

- Too computationally intensive for a personal laptop
- Too large in terms of data size
- Required to be run many times (e.g. simulations, pipelines)

Clusters are commonly used in **bioinformatics, genomics, transcriptomics, proteomics, modelling, and machine learning**.

---

## Cardiff University – Biocomputing Hub

The **Biocomputing Hub** is the School of Biosciences’ computing infrastructure for research. It provides:

- High-performance computing clusters
- Large-scale data storage
- Secure research environments
- Support for computational biology and bioinformatics workflows

It is designed to support projects such as genome assembly, RNA-seq analysis, metagenomics, structural modelling, and large-scale statistical analyses.

**Relevant links:**
- Biocomputing Hub overview:  
  https://www.cardiff.ac.uk/biosciences/research/technology-research-hubs/biocomputing

---

## Why Do Clusters Use Linux?

Almost all research computing clusters run **Linux** rather than Windows or macOS. This is because Linux is:

- **Open-source** – no licensing costs for thousands of nodes
- **Highly customisable** – can be optimised for scientific workloads
- **Stable and efficient** – ideal for long jobs running for days or weeks
- **Well supported by scientific software** (e.g. BLAST, GATK, R, Python, Conda)
- **Designed for automation and reproducibility**, which is essential for research

Linux also integrates seamlessly with **job schedulers** (such as Slurm), which manage how jobs are queued and run on the cluster.

---

## How You Interact With a Cluster

Clusters are usually accessed via a **command-line terminal** (not a graphical desktop). You log in remotely (typically using SSH), prepare scripts, and submit jobs to the scheduler.

This means basic Linux skills are essential.

---

## Basic Linux Commands You Should Know

### Navigating the File System

| Command | What it does |
|------|-------------|
| `pwd` | Shows your current directory |
| `ls` | Lists files and folders |
| `ls -lh` | Lists files with sizes in readable format |
| `cd directory_name` | Move into a directory |
| `cd ..` | Move up one directory |

---

### Managing Files and Folders

| Command | What it does |
|------|-------------|
| `mkdir project` | Create a new directory |
| `cp file1 file2` | Copy a file |
| `mv old new` | Rename or move a file |
| `rm file` | Delete a file (use carefully) |
| `rm -r folder` | Delete a folder and contents |

---

### Viewing and Searching Files

| Command | What it does |
|------|-------------|
| `less file.txt` | View a text file page by page |
| `head file.txt` | View first 10 lines |
| `tail file.txt` | View last 10 lines |
| `grep "pattern" file.txt` | Search for text inside a file |

---

### Permissions and Scripts

| Command | What it does |
|------|-------------|
| `chmod u+x script.sh` | Make a script executable |
| `./script.sh` | Run a script |

---

## Job Scheduling (Very Briefly)

On clusters you **do not usually run heavy analyses directly**. Instead, you submit jobs to a scheduler (e.g. **Slurm**) which decides when and where your job runs.

Common commands you may encounter later:

- `sbatch` – submit a job
- `squeue` – check job status
- `scancel` – cancel a job

---

## Typical Workflow for a Student Project

1. Log into the cluster using SSH  
2. Navigate to your project directory  
3. Prepare scripts and input files  
4. Submit jobs to the scheduler  
5. Download and interpret results  

---

## Summary

- Computing clusters provide the power needed for modern biological research
- Cardiff’s **Biocomputing Hub** supports bioscience research and student projects
- Linux is used because it is powerful, flexible, and research-friendly
- Learning basic Linux commands will make your project work much smoother

---

If you are new to Linux or HPC, don’t worry — these skills are learned through practice and are highly valuable beyond your degree.
