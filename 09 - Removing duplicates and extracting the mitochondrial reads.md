# 09 - Removing duplicates and extracting the mitochondrial reads

This document describes what PCR duplicates are, why we remove them, and the approach used here to remove duplicates and extract mitochondrial reads from our mapped BAM.

## Objective
Explain what PCR duplicates are and remove them from the mitochondrial-mapped BAM, producing a filtered BAM for downstream analyses.

## Background — what are PCR duplicates?
PCR duplicates are multiple sequencing reads that originate from the same original DNA fragment but were amplified multiple times during PCR library preparation. They have identical (or near-identical) mapping coordinates and sequences. If not removed, PCR duplicates can bias estimates of coverage and variant allele frequencies.

Why remove PCR duplicates:
- Prevent over-counting the same original DNA molecule.
- Reduce false-positive variant calls and biased coverage estimates.
- Important for ancient DNA or low-input samples where PCR duplication rates can be high.

## Tools and approach used here
We use:
- `samtools` (to stream SAM/BAM and preserve headers)
- a lightweight Python dedup script: `scripts/samremovedup.py`

The pipeline step (as used in the job script) is:

```bash
samtools view -h /path/file.mapped.bam \
  | python /path/scripts/samremovedup.py \
  | samtools view -bS - > /path/file.mapped.rmdup.bam
```

- `samtools view -h` streams the SAM (including header).
- `samremovedup.py` reads SAM from stdin, emits header lines, and removes PCR duplicates.
- The filtered SAM is converted back to BAM by `samtools view -bS -`.

# Next steps

## Run the scripts
- Copy the "09_rmdups.sh" script in the scripts section of the repo
- Update with your sample IDs and paths
- Run on your data: This should create an output for each of your ("mito genome mapped") samples where duplicates have been removed

## Extract your data
- Download your mapped, duplicates removed bam file(s)
- **Before you do this** make sure that the file sizes are not too large!
- On a mac:
```bash
scp sbi4dws@gomphus.bios.cf.ac.uk:/path/to/your/file/name_of_file.bam /path/on/local/computer/
```
- If you are using MobaXterm - you should be able to use the file browser on the left to download
- Download the reference mito genome that you mapped to (to the same folder
- (as above) 

Next: Download this software onto your laptop:
```text
https://www.geneious.com/
```
- Do not pay for this!! Just use the free trial (even if this runs out, you can still use the features we need on the demo version)
- Locally on your laptop, drag the bam files into geneious

## Next steps
- Spend some time interpreting your bam file in geneious
- What "coverage" do you have (Depth / breadth)?
- **From this point, if your project is focussing on mitochondrial genomes:** You will be creating a consensus sequence from this bam file for each of your samples
- Take some time to pause at this step and think what the results mean for your analysis going forward
- How this file(s) looks will likely determine many of your next steps

  - `samtools flagstat OtterOnly_mapped.rmdup.bam`
  - `samtools depth -a OtterOnly_mapped.rmdup.bam | awk '{sum+=$3}END{print "mean depth:", sum/NR}'`
- Proceed to variant calling or coverage summaries using the deduplicated BAM.
