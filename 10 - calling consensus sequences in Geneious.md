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
  - With the alignment open (reads mapped to the reference), choose Tools → Generate Consensus Sequence.
  - Goodecommended choices:
  - Consensus method:
      - Majority (simple majority) — produces the base observed at >50% frequency.
      - Use IUPAC ambiguity codes — useful if you want to represent mixed bases (heteroplasmy) rather than forcing a single base.
Minimum base frequency (if available): set the threshold for calling an alternate base. Typical choices:
For exploratory/species ID use: Majority threshold = 50% (0.5).
For more conservative calls (publication-quality): use a higher threshold (e.g. 75%).
Minimum coverage / depth: set to mask low coverage positions. Common choices:
Low-coverage screening / exploratory: min coverage = 3
Conservative / high-confidence: min coverage = 5–10
Replace positions with N if coverage < X: check this and set X equal to the chosen minimum coverage (so very low coverage positions become N).
Use ambiguity codes when multiple bases exceed a lower threshold (optional) — include this if you want to retain heteroplasmic sites with IUPAC codes instead of Ns or a single base.
Trim ends / restrict consensus to reference coordinates if required.
Click OK / Generate.
Inspect and validate the consensus
Open the generated consensus sequence and compare it to the coverage track and read pileup.
Run Tools → Find Variations/SNPs (or Variant Calling in Geneious) on the alignment to list variants, allele frequencies, and support for each site.
Manually inspect positions with low coverage, indels, or conflicting base calls — Geneious’ read view helps you verify strand support and read quality.
Export the consensus
Once you’re satisfied, select the consensus sequence and export as FASTA:
Right-click → Export → Selected sequences → FASTA.
Use a clear filename/header with sample ID, reference used, minimum coverage and threshold parameters, and date. Example FASTA header:
sampleID_consensus_ref=MyRef_minCov=5_threshold=0.75_2026-01-22Generating a consensus sequence in Geneious
Below are step-by-step instructions you can paste into your lab notebook. Geneious menu names vary slightly between versions, so treat the names below as the common locations rather than verbatim labels.

Prepare files locally

Ensure you have:
The duplicates-removed BAM file(s) exported from Gomphus
The reference mitogenome FASTA you mapped to (same reference used on Gomphus)
Place both files in a folder and drag them into a Geneious project.
Import into Geneious

Drag-and-drop the FASTA and BAM files into the Geneious window (or use File → Import).
Geneious should recognise the BAM as an alignment to your reference (if the BAM contains reference/coordinate information).
Check alignment / map reads if necessary

If the reads are not already aligned to the reference inside Geneious, run: Actions → Map to Reference (or the equivalent)
Recommended mapper settings (reasonable defaults):
Sensitivity: Medium / Default
Allow gaps: yes
Reporting: report all alignments (or best) depending on your data
This step will produce an alignment view with reads stacked against the reference.
Inspect coverage and quality

Open the alignment and check the coverage track shown at the top of the alignment viewer.
Look for low-coverage regions, obvious gaps near the ends, or regions with many mismatches.
If you see adapter/primer artefacts or very low-quality regions at the ends, consider trimming these before making the consensus.
Generate the consensus sequence

Select the alignment (the reference + mapped reads) in Geneious.
Choose Actions → Create Consensus Sequence (or Sequence → Generate Consensus / Consensus from Alignment).
Important parameters to set:
Minimum coverage (depth) to call a base: commonly 3–5x for moderate confidence; set higher if you require stronger evidence.
Consensus calling threshold (majority): the proportion of reads that must agree to call a base. Typical values:
0.50 (majority) — calls the base seen in >50% of reads
0.75 — more conservative, reduces the chance of calling sequencing errors
Ambiguous base handling: choose whether to use IUPAC ambiguity codes for mixed sites (heteroplasmy) or to call 'N' / reference.
Low-coverage handling: replace positions below the minimum coverage with 'N' (recommended) so downstream analyses are aware of uncertain bases.
Trim ends: optionally trim a small number of bases at each end if coverage/quality drops off.
Run the consensus builder; Geneious will produce a consensus sequence object in the project.
Inspect the consensus and variants

Open the consensus sequence and visually scan problematic sites in the alignment viewer.
Use the Find Variants / SNPs function to list positions where reads disagree with the consensus or reference.
For positions with mixed bases, decide whether to keep IUPAC codes, call the majority base, or set to 'N' based on your experimental aims.
Export the consensus

Right-click the consensus sequence → Export → Export Selected Sequences.
Choose FASTA format and save the file (e.g., Sample01_consensus.fasta).
Record coverage and provenance

Save a screenshot or write down the mean and per-base coverage values (Actions → Calculate Coverage or use the coverage track summary) and the consensus settings used.
This metadata is important for reporting and reproducibility.
Notes and tips

Threshold choices matter: Lower minimum coverage and lower majority thresholds will produce longer-looking sequences but increase the risk of errors. Be conservative if you need high-confidence consensus sequences for downstream phylogenetics or species identification.
Heteroplasmy: mitochondrial DNA can be heteroplasmic. If you expect genuine mixed sites, use IUPAC ambiguity codes or keep a separate VCF/variant list rather than forcing a single-base consensus.
Masking low-coverage regions with 'N' is preferred to avoid spurious calls.
If you routinely generate many consensuses, consider an automated command-line approach (e.g., samtools mpileup + bcftools + vcfutils.pl) for reproducibility. Geneious is convenient for manual inspection and small numbers of samples.
Geneious licence: the steps above work in the trial/demo version for the features described; menu names differ slightly between versions.
If you want, I can make the consensus instructions shorter, add screenshots, or provide an equivalent command-line recipe (samtools/bcftools) for batch processing.
