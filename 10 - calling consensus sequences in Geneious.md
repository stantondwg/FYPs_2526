# Calling consensuses in Geneious

## Rationale

- You should have created a mapping (bam) file for each of your samples - you now need to decide what the consensus sequence is for that individual's mitochondrial genome

## Prerequisites

- A mapped BAM for each sample (duplicates already removed is ideal: e.g. sample.mapped.rmdup.bam)
- The reference mitochondrial FASTA you used for mapping.
- Geneious installed (the demo/free trial is sufficient for this workflow).
- Record the Geneious version and all parameter choices so results are reproducible.

## Import files
- Open Geneious and import your reference FASTA and your mapped BAM(s).
- Drag-and-drop the files into the Geneious window or use File → Import → From File.
- Ensure a BAM index (.bai) is present. If not, either create one with samtools (samtools index sample.bam) before importing or re-map the reads inside Geneious.
- Inspect the alignment / coverage
- Check the coverage graph and read pileup across the mitochondrial genome.
- Look for low-coverage regions, obvious mis-mappings, or high-frequency mixed bases that need manual inspection.
- Generate the consensus sequence
  - With the alignment open (reads mapped to the reference), right click → Generate Consensus Sequence.
  - Recommended initial choice:
    - Threshold: 75%
    - Call "N" if coverage <3
      - This is very project/sample dependent - make sure to consider what these thresholds mean for your particular sample
      - Discuss this choice with your classmates and supervisor!

```text
Threshold choices matter: Lower minimum coverage and lower majority thresholds will produce longer-looking sequences but increase the risk of errors. Be conservative if you need high-confidence consensus sequences for downstream phylogenetics or species identification.

Masking low-coverage regions with 'N' is generally preferred to avoid spurious calls.
```

- Right-click the consensus sequence → Export → Export Selected Sequences.
- Choose FASTA format and save the file (e.g., Sample01_consensus.fasta).
Record coverage ("breadth" and "depth"), number of reads, and any other information you believe might be relevant


