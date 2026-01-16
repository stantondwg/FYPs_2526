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
- Want to extract a single mito genome from this file? A pragmatic way to do it would be to run the above code, which should give you something like this:

```bash
>Accipiter_gentilis_AP010797 mitochondrial DNA, complete genome
>Alces_alces_JN632595 isolate Kazakhstan mitochondrion, complete genome
>Alectoris_chukar_FJ752426 mitochondrion, complete genome
>Alytes_obstetricans_AY585337 pertinax mitochondrion, complete genome
>Anas_platyrhynchos_EU009397 mitochondrion, complete genome
>Anguilla_anguilla_AP007233 mitochondrial DNA, complete genome
>Apis_mellifera_KJ601784 scutellata mitochondrion, complete genome
>Apodemus_agrarius_JN629047 mitochondrion, complete genome
```

- Then to just extract one of those, grep for the relevant one, and several hundred lines after, to get the whole sequence (and likely into the next one in the list):

```bash
grep -A 300 "Alytes_obstetricans_AY585337" /mnt/scratch/FYPs_2526/0_mitogenomes_ref.260107.fasta
```

- Then you can just copy the mito genome you want
- Be careful not to copy into the next one in the list - e.g. here you ***wouldn't*** want the line starting with ">Anas_platyrhynchos_EU009397":

```bash
TATTTGGCCCTGGACTTACTGCTTATACTTTTAACTAACCCCACGTGTATCTTGCGCGTATATATACGCA
TATTTATAATAATCCATATATTTGGCCCTGGACTTACTACTAAAACTTTCGACCGGTCAA

>Anas_platyrhynchos_EU009397 mitochondrion, complete genome
AGCTAGAATAGCCTAATAATGCTCTCAGGACCCCCCCCCCCTTCCCCCCCCAGGGGTTGCGGGGTTATTT
GGTTATGCATATCGTGCATACATTTATATTCCCCATATATTAACCTATGGTCCCGGTAATAAACACTATT

```

- Alternatively, you can search for mito genomes on GenBank:

```text
https://www.ncbi.nlm.nih.gov/genbank/
```
- Download the genome in a fasta format

## Creating a new reference mitochondrial genome
- You can simply paste the sequence into a new file with a .fasta extension
- Give it an informative name (e.g. the name that it had in the Multi_Mito.fasta file

```bash
nano Alytes_obstetricans_AY585337.fasta
```

## Index the fasta file
- You need to create an index so that bwa can access the file
- All mapping and indexing is done with **bwa**. Load the module with:

```bash
module load bwa
```

- Index it like this:

```bash
bwa index Alytes_obstetricans_AY585337.fasta
```

- You should now see all the index files:

```bash
[sbi4dws@gomphus FYPs_2526]$ ls -lh
-rw-r--r--. 1 sbi4dws biosi 1.3M Jan 14 09:54 Alytes_obstetricans_AY585337.fasta
-rw-r--r--. 1 sbi4dws biosi 2.8K Jan 14 09:54 Alytes_obstetricans_AY585337.fasta.amb
-rw-r--r--. 1 sbi4dws biosi 5.7K Jan 14 09:54 Alytes_obstetricans_AY585337.fasta.ann
-rw-r--r--. 1 sbi4dws biosi 1.2M Jan 14 09:54 Alytes_obstetricans_AY585337.fasta.bwt
-rw-r--r--. 1 sbi4dws biosi 307K Jan 14 09:54 Alytes_obstetricans_AY585337.fasta.pac
-rw-r--r--. 1 sbi4dws biosi 613K Jan 14 09:54 Alytes_obstetricans_AY585337.fasta.sa
```

## What next?

- You can now use this file instead of the Multi_mito fasta file for your mapping (script 08)

