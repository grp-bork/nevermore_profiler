nevermore_profiler
==================


The `nevermore_profiler` is a workflow optimised for alignment-based, functional profiling of public metagenomic/-transcriptomic short read data sets against large metagenomic gene catalogues (e.g. [GMGC](https://gmgc.embl.de) or [proGenomes](https://progenomes.embl.de).) It makes use of the [nevermore](https://github.com/cschu/nevermore) workflow library.

Input data sets are profiled with [gffquant](https://github.com/cschu/gff_quantifier). `gffquant` aligns the input reads using BWA-mem (or minimap2 for larger catalogues) against a reference catalogue and distributes the resulting gene counts to functional categories obtained from eggnog-mapper annotations of the reference catalogue, generating readcount-based functional profiles. The nevermore profiler workflow, nevermore library, as well as the gffquant software were/are being developed in the Bork and Zeller labs at EMBL Heidelberg. In 2023, maintenance and development was supported by [NFDI4Microbiota](https://nfdi4microbiota.de/)

![nevermore_workflow](docs/nevermore.svg)







