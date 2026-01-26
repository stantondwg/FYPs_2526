# Mapping to a Nuclear Genome – Notes and Tips

## Overview
This script maps sequencing reads to a nuclear genome for your species of interest. It uses the **BWA aln** tool for alignment and outputs sorted BAM files.

---

## Finding and Downloading a Nuclear Genome
The nuclear genome you use must match your project requirements and species. Common sources for nuclear genome FASTA files include:

1. **NCBI Genome Database**:  
   Search and download from the NCBI Assembly or GenBank portals:  
   [https://www.ncbi.nlm.nih.gov/genome/](https://www.ncbi.nlm.nih.gov/genome/)

   Example for downloading a FASTA file to the cluster:
   ```bash
   wget https://ftp.ncbi.nlm.nih.gov/genomes/refseq/some_species/some_genome.fasta
   ```

2. **Ensembl Genome Browser**:  
   A comprehensive source for vertebrate and model organism genomes:  
   [https://www.ensembl.org/](https://www.ensembl.org/)

   After selecting your species, navigate to the **Downloads** section to get the primary assembly FASTA.

3. **UCSC Genome Browser**:  
   Another database for downloading reference assemblies:  
   [http://genome.ucsc.edu/](http://genome.ucsc.edu/)

   UCSC’s "Genome Downloads" section provides curated genomes in FASTA format.

4. **Species-Specific Databases**:  
   Many research communities maintain dedicated databases. For example:
   - FlyBase for Drosophila
   - WormBase for C. elegans
   - Phytozome for plant genomes

---

## User-defined Variables (Things You Must Edit)
- `REF` – Path to the nuclear genome FASTA file you downloaded.
- `DIR` – Path to your input/iutput data.

Ensure all paths are fully specified, and filenames match your dataset.

---

## Submitting the Script on Gomphus
To submit your job, use:
```bash
sbatch 11_map_to_nuc.sh
```

Check the output and error logs for any issues:
- `11_map_to_nuc.out`
- `11_map_to_nuc.err`

---

## Things to Keep in Mind
1. **Reference Accuracy**  
   Verify the nuclear genome reference matches your species or study system to avoid misalignments.

2. **Annotation Files**  
   Some reference sources (like NCBI or Ensembl) also provide annotation GTF/GFF files — consider downloading these if you need to interpret alignment results later.

3. **File Size Limits**  
   Large reference genomes may take significant time to process; ensure sufficient computational resources are allocated when running the script.

4. **Updating Reference Indexing**  
   If the genome file changes or you add additional sequences, you’ll need to recreate the BWA index:
   ```bash
   bwa index /path/to/reference.fasta
   ```

--- 
