Output
======

`nevermore_profiler` generates read count-based profiles for various eggnog mapper categories. The latest eggNOG database (emapper version v2.1.2-v2.1.8) has the following categories:

* eggNOG_OGs
* COG_cat --> these are profiled as two separate categories, "normal" (splitting composite COG_categories into individual categories) and "composite" (treating composite categories as individual categories)
* GOs
* EC
* KEGG_ko
* KEGG_Pathway
* KEGG_Module
* KEGG_Reaction
* KEGG_rclass
* BRITE
* KEGG_TC
* CAZy
* BiGG_Reaction

For each sample, one count table for each of the above categories will be generated. In addition, count tables will be collated for each category across all input samples (using the `combined_scaled` and `unique_scaled` count columns (s. [gffquant documentation](https://github.com/cschu/gff_quantifier)).)






