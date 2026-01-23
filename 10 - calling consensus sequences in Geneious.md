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

## Consensus fasta files

- You should now have a/some consensus fasta files exported locally to your computer
- The next step is to combine these into a single file, with any other sequences that you want to analyse them alongside (taht you have retrieved e.g. from Genbank)
- A fasta file is really just a "plain text" file with a particular format and the .fasta extension
- You can therefore just combine these files in your text editor (Notepad++ or BBEdit - format it so that the sequences are all on a single line [1 line for ID, 1 line for sequence]):

```text
>Your_sample_1
ACRGTCGATCGATGCTGACTGATCGATCGACTGACTGCATGACTCATACATCGATGCTGTGCTGGACTGAATCAT
>Your_sample_2
ACGGTCSATCGATGCTGACTGATCGATCGACTGACTGCATGACTCATACATCGATGCTGTGCTGGACTGAATCAT
>GenBank_sample_1
ACGGTCGATCGATGCTYACTGATCGATCGACTGACTGCATGACTCATACATCGATGCTGTGCTGGACTGAATCAT
```
You will be aligning these sequences and creating phylogenies/networks etc.
When doing this step, you must therefore consider:
- Do I need an outgroup included?
- Am I comparing the same gene/region in the sequences that I am including?
- Have I got all the relevent available data?
- Have I got any sequences in here that are not necessary/relevent?

## Final processing
- Before you align, there is one last step.
- Your sequences likely contain a number of "ambiguity codes"
- These are bases other than AGTC, representing the consensus caller's uncertainty about which is the correct base call 
- For example, the 3rd base in the above sequence "Your_sample_1" is an R, corresponding to either a an A or G (puRine)
- We don't want these, so we can change them to "N" (totally unknown) with a single line of code:

```bash
awk 'NR % 2 == 0 { gsub(/[^AGTC]/, "N") } 1' file.fasta > file.Ns.fasta
```
- You can run this on your terminal (if you use a mac)
- If on windows, a pragmatic way to do it (there are other options) would be to:
  1. Copy the file onto gomphus
  2. Run the above command directly into the terminal
  3. Copy the file back

## Aligning

Your file can now be aligned. Details about this step to follow (let me know if you get here and are stuck), but briefly:

- Your fasta can be aligned using ClustalOmega (other options are available):
https://www.ebi.ac.uk/jdispatcher/msa/clustalo
- Choose "fasta" as the output format
- Put the alignment back into geneious and manually inspect it
- Do you have any large gaps/mis-alignements? These may need manual editing
- Do you have uneven sequence lengths (you will!)? These should be trimmed. You can do these things in Geneious
- Once you have a clean alignment you can use that as an input for a phylogeny
