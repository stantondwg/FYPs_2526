
# First Steps and Running Commands on Gomphus  
### Practical Guide for Cardiff Biological Sciences Students

This guide walks you through **logging in, exploring the system and copying data** on the Gomphus cluster.  
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

## Summary

By the end of this exercise, you should be able to:

* Navigate the Gomphus filesystem
* Copy data safely to your own workspace
* Edit scripts using a Linux editor
* Submit and monitor jobs using Slurm

These are core skills for computational biology and research projects — take your time and experiment carefully.

```
