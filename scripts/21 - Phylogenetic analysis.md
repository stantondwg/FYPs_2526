# Phylogenetic Tree Inference and Visualization

## Summary

- Some basic notes on creating an alignment from a fasta file, and software available for phyogenetic analyses
- This follows on from "10 - calling consensus sequences..." and requires you to have a fasta file with multiple consensus sequences

## Aligning

Your file can now be aligned. Details about this step to follow (let me know if you get here and are stuck), but briefly:

- Your fasta can be aligned using ClustalOmega (other options are available):
https://www.ebi.ac.uk/jdispatcher/msa/clustalo
- Choose "fasta" as the output format
- Put the alignment back into geneious and manually inspect it
- Do you have any large gaps/mis-alignements? These may need manual editing
- Do you have uneven sequence lengths (you will!)? These should be trimmed. You can do these things in Geneious
- Once you have a clean alignment you can use that as an input for a phylogeny

## IQ-Tree

[IQ-Tree](http://iqtree.cibiv.univie.ac.at/) is a web-server that facilitates relatively fast Maximum Likelihood (ML) tree inference. Based on experience, it tends to be faster and more reliable than ML in MEGA.

### Key Features:
1. **Alignment File Format Compatibility**  
   IQ-Tree accepts a variety of alignment file formats, including:
   - Phylip
   - Fasta
   - Nexus
   - Clustal

2. **Automatic DNA Substitution Model Selection**  
   You can set the substitution model to `auto`, and IQ-Tree will automatically determine the most suitable DNA substitution model for your alignment.

3. **Confidence Estimate with Ultrafast Bootstrap**  
   It is recommended to use the **"ultrafast bootstrap"** option to generate branch confidence estimates for your phylogenetic tree.

For more detailed information, you can refer to the help file and the original paper describing IQ-Tree. 

---

## Tree Visualization

### FigTree

[FigTree](https://github.com/rambaut/figtree/releases) is a program that enables you to enhance the visual presentation of your phylogenetic trees, surpassing the visualization options directly available in IQ-Tree.

### Using the *.tre File

The output from IQ-Tree is a tree in **Newick format** (*.tre). This file can be opened with FigTree or other phylogenetic tree visualization programs.

### Alternative Software for Tree Viewing

If you prefer not to use FigTree, there are other software options that can also open the *.tre file. These include:
- [MEGA](https://www.megasoftware.net/) 
- A wide variety of tree viewer software listed on [Wikipedia](https://en.wikipedia.org/wiki/List_of_phylogenetic_tree_visualization_software).

```
