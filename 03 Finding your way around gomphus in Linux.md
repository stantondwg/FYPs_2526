
# First Steps and Running Commands on Gomphus  
### Practical Guide for Biological Sciences Students

This guide walks you through **logging in, exploring the system, copying data, editing scripts, and running jobs** on the Gomphus cluster.  
You are expected to try these commands yourself.

---

## 1. Getting Access Tools

### Windows Users
You will need **MobaXterm**, which provides:
- A secure SSH connection
- A Linux-style terminal
- Easy file transfer

Download here:  
https://mobaxterm.mobatek.net/

---

### macOS Users
macOS already includes a terminal.

Open **Terminal** via:
- Applications → Utilities → Terminal  
- Or search “Terminal” with Spotlight

---

## 2. This Guide Applies to Gomphus Only

All commands below are for use **on the Gomphus server** after you have logged in via SSH.

Remember:
- You must be connected to the **University VPN** if off campus
- Use your standard university username and password

---

## 3. Checking Where You Are

Once logged in, check your current location:

```bash
pwd
```

This prints your **present working directory**.

---

## 4. Listing Files and Folders

To see what files and folders are in your current directory:

```bash
ls
```

For a more detailed view (sizes, dates):

```bash
ls -lh
```

---

## 5. Navigate to Your Own Analysis Folder and create a directory (in your user's data directory)

Move to directory.

```bash
cd /mnt/clusters/gomphus/data/[username]/
```

Create a directory for data and one for scripts in the "long term storage" part of gomphus:

```bash
mkdir /mnt/clusters/gomphus/data/[username]/data
mkdir /mnt/clusters/gomphus/data/[username]/scripts
```
These directories are stable, and you should keep anything in here that can't be easily repeated

Create an analysis folder in "scratch" space:

```bash
mkdir /mnt/scratch/[username]/
```
Scratch is not backed up, but has more space and analysis runs quicker here. Keep intermediate files here that you are working on, and periodically copy important ones to the above "data" directory.

---

## 6. Where to find your project data

### Main Dataset Location

```text
/mnt/scratch/FYPs_2526/
```

***TASK*** Using the above commands - what data is in this folder? Which of it is yours? How many files do you have? Why this number?

---

## 7. Copying Data to Your Analysis Folder

You should **never analyse shared data directly**.
Instead, copy it to your own directory.

### Copy to Your Data and scratch Directories

```bash
cp /mnt/scratch/FYPs_2526/[your_data] /mnt/scratch/[username]/
cp /mnt/scratch/FYPs_2526/[your_data] /mnt/scratch/[username]/
```
---

## 8. Checking File Sizes

To check how large your files are (MB / GB):

```bash
ls -lh
```

Or for a directory summary:

```bash
du -sh *
```

---

## 9. Thinking About Your Data

Before running analyses, consider:

* How large are the files?
* How many sequencing reads are present?
* What computational resources might be needed?

This helps prevent wasted compute time.

---

## 10. Editing Analysis Scripts

You will be provided with **template scripts** from the scripts folder in this GitHub repo.

### Your Tasks

* Edit the scripts **on your own computer first**
* Update file paths and filenames to match **your directories**
* Create new script files on Gomphus

Scripts can be stored in:

* Your **home directory**
* Or in the dedicated `scripts` folder we created above:

```text
/mnt/clusters/gomphus/data/[username]/scripts
```

---

## 11. Creating or Editing Files on Gomphus

Use a text editor on the server.

### Recommended for Beginners: `nano`

```bash
nano NAME_OF_NEW_FILE.sh
```

Basic controls:

* Save: `Ctrl + O`
* Exit: `Ctrl + X`
* Confirm save: press `Y`, then `Enter`

---

## 12. Running Your Script (Submitting a Job)

You must submit scripts using **Slurm**:

```bash
sbatch your_script_name.sh
```

Do **not** run scripts directly using `./script.sh`.

---

## 13. Checking Job Status

To see your running or queued jobs:

```bash
squeue
```

You will see:

* Job ID
* Job name
* Job state (running, pending, etc.)

---

## 14. Important Rules

* **ONLY RUN ONE JOB AT A TIME**
* Wait for a job to finish **successfully** before submitting the next
* This prevents overloading the cluster and wasting resources

---

## 15. Cancelling a Job

If something goes wrong, cancel your job using its Job ID.

Example:

```bash
scancel 232434
```

---

## Summary

By the end of this exercise, you should be able to:

* Navigate the Gomphus filesystem
* Copy data safely to your own workspace
* Edit scripts using a Linux editor
* Submit and monitor jobs using Slurm

These are core skills for computational biology and research projects — take your time and experiment carefully.

```
