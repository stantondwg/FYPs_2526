#!/bin/bash

# awk code to remove abiguity codes from a fasta file

awk 'NR % 2 == 0 { gsub(/[^AGTC]/, "N") } 1' file.fasta > file.Ns.fasta
