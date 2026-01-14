# Gomphus HPC Cluster – Quick Summary

## Overview
**Gomphus** is a small High-Performance Computing (HPC) cluster designed for training users in HPC methodologies.  
It consists of:
- **1 head node** (`gomphus`) – access point only (no jobs should run here)
- **4 compute nodes** (`gomphus[1-4]`) – where jobs are executed

The cluster uses the **Slurm** workload manager.

---

## Accessing Gomphus
- You must be **on campus** or connected via the **University VPN**
- Access via SSH to the head node:

```bash
ssh <username>@gomphus.bios.cf.ac.uk
```

---

## Storage
- **Home directory** (not for data storage):
  ```
  /home/<username>
  ```
- **Data directory** (quota-managed, for all work and data):
  ```
  /mnt/clusters/gomphus/data/<username>
  ```

---

## Slurm Scheduler
Slurm manages job submission and resource allocation (CPUs, memory, nodes).

### Partitions (Queues)
Gomphus currently has **one queue**:

| Partition | Status | Max Time | Nodes |
|----------|--------|----------|-------|
| `defq`*  | up     | 3 days   | 3     |

> **Note:** Maximum runtime for any job is **3 days**.

---

## Checking Available Resources
Use `sinfo` to view cluster resources:

```bash
sinfo -o "%24N %.5D %9P %11T %.4c %.8z %.8m %.8d %.6w %8f %15C %20E"
```

Example output shows:
- 3 compute nodes (`gomphus[1-3]`)
- 64 CPUs per node
- ~128 GB RAM per node
- All resources idle when unused

### Easier Alternative
A wrapper script is provided:

```bash
gomphus.node_availability.sh
```

---

## Software
- Software is managed using **Environment Modules**
- Load software with:
  ```bash
  module load <software-name>
  ```
- Request new software if needed

---

## Submitting Jobs
Jobs are submitted using **job scripts** and the `sbatch` command.

### Basic Job Submission
```bash
sbatch submit.sh
```

### Key `SBATCH` Options
| Option | Description |
|------|-------------|
| `--partition` | Queue to run on |
| `--nodes` | Number of nodes |
| `--ntasks` / `--ntasks-per-node` | Number of processes |
| `--cpus-per-task` | CPUs per task (for threading) |
| `--mem` / `--mem-per-cpu` | Memory allocation |
| `--output` | Stdout file |
| `--error` | Stderr file |

---

## Running Tasks in Parallel (Simple Method)

For **embarrassingly parallel workloads** (multiple independent commands), you can run several tasks at once within a single Slurm job by:
1. Requesting multiple CPUs
2. Running commands in the background using `&`
3. Synchronising with `wait`

### Example
Request 4 CPUs and run 4 independent commands in parallel:

```bash
#SBATCH --cpus-per-task=4
```

```bash
command1 &
command2 &
command3 &
command4 &
wait
```

### IMPLEMENTING THIS 
- Make the above edits in the 05script.sh in the "scripts" folder
- Edit the file names and locations and "cpus-per-task" to work for your files

### Important Notes
- The **number of background tasks must not exceed the CPUs requested**
- Each background command should use **one CPU only**
- `wait` ensures the job does not exit before all tasks complete

### When to Use This
- Running many small, independent analyses
- Parameter sweeps
- Batch processing of files

### When *Not* to Use This
- Multi-threaded applications (use `--cpus-per-task` without `&`)
- MPI jobs (use `srun` / `mpirun` instead)

---

## Parallel Jobs (Other Models)
Supported parallelisation methods:
- **MPI** (multi-process, multi-node)
- **Multi-threading** (OpenMP/pthreads, single node)
- **Multiple independent tasks**

---

## Monitoring and Managing Jobs
- View queue:
  ```bash
  squeue
  ```
- Cancel job:
  ```bash
  scancel <jobid>
  ```
- Job logs:
  ```
  <jobid>.out
  <jobid>.err
  ```

---

## Interactive Jobs
For testing and debugging:

```bash
srun -c 4 --mem=2G --pty bash -i
```

---

## Help
For issues or questions, contact the **Biocomputing Hub** via the provided support contacts.
