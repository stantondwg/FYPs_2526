# Mapping to a single mito genome

## Brief description
- The below gives a brief description of how and why you map to 1 mito genome, rather than the panel that you did previously
- This is intended to give extra context for the "08_mapping_to_single_mito_genome.sh" script
- Here, you index the mitochondrial genome directly on the head node because it is small, and doesn't use much processing power
- For anything larger, you should do that using a slurm script

## Finding the reference genome
- The choice of reference genome depends on your particular project/study system **and** what data is available
- Many mito genomes are already found in the "Multi Mito" file that you have worked on previously
- You can view those in the file, like this:

```bash
less /mnt/scratch/FYPs_2526/0_mitogenomes_ref.260107.fasta
```

- To check all the mito genomes that are present in that file, you can use a program called "grep" to search all the sequence IDs
- All those IDs start with a ">" in a fasta file, so doing this will print them all out

```bash
grep ">" /mnt/scratch/FYPs_2526/0_mitogenomes_ref.260107.fasta
```


 
## Loading Required Software
All mapping and indexing is done with **bwa**. Load the module with:

```bash
module load bwa
```

You can also include this line in your Slurm scripts if you are processing BAM files in a job.

---

## Quick Viewing Examples - these commands can be run directly on the terminal

### View top lines of a BAM file
```bash
samtools view /your/file/location/your_file_name.bam | head
```
