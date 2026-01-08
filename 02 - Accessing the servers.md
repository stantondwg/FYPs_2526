# Logging in to the Gomphus Computing Cluster  
### Cardiff University Biocomputing Hub – Student Guide

You should have received a **welcome email** from the Biocomputing Hub with your access details.  
The information below explains how to use those details to log in successfully and what everything means.

---

## Before You Start: What You Need

### 1. University VPN (Essential)
All Biocomputing Hub servers are **firewalled from off-campus access**.

This means:
- If you are **not physically on campus**, you **must connect to the Cardiff University VPN first**
- If you are off campus and do not use the VPN, your login will fail

👉 Connect to the University VPN **before** trying to log in.

---

### 2. An SSH Client (How You Connect)

The cluster is accessed using **SSH (Secure Shell)**.  
SSH allows you to securely open a command-line connection to a remote computer.

What you use depends on your operating system:

#### macOS (and Linux)
- Use the built-in **Terminal** application
- No extra software is required

You can find Terminal via:
- Applications → Utilities → Terminal  
- Or by searching “Terminal” with Spotlight

#### Windows
- Windows does not include a full SSH terminal by default
- You should use **MobaXterm**, a free SSH client

Download MobaXterm:
```text
https://mobaxterm.mobatek.net/
```

MobaXterm provides:
- An SSH terminal
- File transfer via drag-and-drop
- A Linux-like environment on Windows

---

## Logging In to Gomphus

Once you are:
- Connected to the **University VPN**
- Using **Terminal (macOS)** or **MobaXterm (Windows)**

You can log in as follows:

#### Mac
Go to your terminal and type:
ssh [username]@gomphus.bios.cf.ac.uk
You should then be prompted for your university password
NOTE: You will not see any characters as you type (not even *'s or o's) - just type it correctly and press enter

#### Windows
Follow the steps shown in the video in the "Demo" tab here: https://mobaxterm.mobatek.net/
In the remote host box type: gomphus.bios.cf.ac.uk
In the user name box type your University user name (NOTE: case sensitive!) then press "OK"


