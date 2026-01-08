# First Steps and Running Commands on Gomphus  - PART II
### Practical Guide for Biological Sciences Students

This guide walks you through **editing scripts, and running jobs** on the Gomphus cluster.  
You are expected to try these commands yourself.

---

## 10. Editing Analysis Scripts

You have been provided with **template scripts** from the scripts folder in this GitHub repo.

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

* Edit scripts using a Linux editor
* Submit and monitor jobs using Slurm

These are core skills for computational biology and research projects — take your time and experiment carefully.

```
