# Usage

## CLI
```
nextflow run /path/to/nevermore_profiler --input_dir </path/to/read_files> --output_dir </path/to/output_dir> --gq_database <path/to/database> [PARAMETERS]
```
## Input
* Fastq files need to be ordered into a sample-per-folder structure (s. tree below).
* Supported file endings are `.fastq,.fq,.fastq.gz,.fq.gz,.fastq.bz2,.fq.bz2`
* Files in sample-specific folders will automatically be assigned to a sample labeled with the folder name.
* Filenames for paired-end data need to share a common prefix terminated by `_R?[12]` in order to be automatically matched. 
* Suffixes following the `_R?[12]` pattern, such as `_001` from newer Illumina machines need to be removed.
* In case of paired-end data with additional unpaired reads (e.g. as obtained from preprocessed ENA datasets), the unpaired files can be automatically picked up from the same folder but should be labeled as `<sample_prefix>.single(s).<fastq-suffix>`. 

In the following example, the path to the input dataset needs to be set as `--input_dir /path/to/read_files`. `nevermore_profiler` will then automatically detect the sample-specific folders within that directory.

```
/path/to/read_files
└── sample1
  ├── sample1_R1.fastq.gz
  └── sample2_R2.fastq.gz
```

## Databases
Databases consist of a BWA index of a gene catalogue as well as an sqlite database containing eggnog-mapper annotations of the catalogue.
The initial clowm-deployment of `nevermore_profiler` includes the GMGC 1.0 human-gut database filtered at 95% nr and 0.5% prevalence.

## Parameters

* `min_identity [0.97]`: Sequence identity cutoff for alignments to be considered as a match.
* `min_alignment_length [45]`: Alignment length cutoff for alignments to be considered as a match.
* `single_end_library [false]`: The count model assumes read pairs, assigning 0.5 counts to each mate. Unpaired input is by default treated as deriving from a paired-end library (i.e., as orphaned reads). Setting this parameter to true marks the input data set as single end, causing unpaired reads to receive a full count.
* `run_preprocessing [true]`: Run preprocessing (quality control, [human] host removal, rRNA removal.)
* `remove_host [true]`: Run host removal.
* `drop_orphans [false]`: Drop paired-end reads whose mate did not survive quality processing.
* `qc_minlen [45]`: Drop reads shorter than `qc_minlen` base pairs.
* `qc_params_shotgun ["qtrim=rl trimq=3 maq=25 ktrim=r k=23 mink=11 hdist=1 ftm=5 entropy=0.5 entropywindow=50 entropyk=5 tpe tbo"]`: bbduk parameter string
* `remove_host_kraken2_db`: Path to a kraken2 database for host removal
* `kraken2_min_hit_groups [10]`: kraken2 sensitivity cutoff
