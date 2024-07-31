# nevermore profiler
<table>
  <tr width="100%">
    <td width="150px">
      <a href="https://www.bork.embl.de/"><img src="https://www.bork.embl.de/assets/img/normal_version.png" alt="Bork Group Logo" width="150px" height="auto"></a>
    </td>
    <td width="425px" align="center">
      <b>Developed by the <a href="https://www.bork.embl.de/">Bork Group</a></b><br>
      Raise an <a href="https://github.com/grp-bork/nevermore_profiler/issues">issue</a> or <a href="mailto:N4M@embl.de">contact us</a><br><br>
      See our <a href="https://www.bork.embl.de/services.html">other Software & Services</a>
    </td>
    <td width="500px">
      Contributors:<br>
      <ul>
        <li>
          <a href="https://github.com/cschu/">Christian Schudoma</a> <a href="https://orcid.org/0000-0003-1157-1354"><img src="https://orcid.org/assets/vectors/orcid.logo.icon.svg" alt="ORCID icon" width="20px" height="20px"></a><br>
        </li>
        <li>
          <a href="https://github.com/danielpodlesny/">Daniel Podlesny</a> <a href="https://orcid.org/0000-0002-5685-0915"><img src="https://orcid.org/assets/vectors/orcid.logo.icon.svg" alt="ORCID icon" width="20px" height="20px"></a><br>
        </li>
      </ul>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center">The development of this workflow was supported by <a href="https://www.nfdi4microbiota.de/">NFDI4Microbiota <img src="https://github.com/user-attachments/assets/1e78f65e-9828-46c0-834c-0ed12ca9d5ed" alt="NFDI4Microbiota icon" width="20px" height="20px"></a> 
</td>
  </tr>
</table>

---
#### Description
The `nevermore_profiler` is a workflow optimised for alignment-based, functional profiling of public metagenomic/-transcriptomic short read data sets against large metagenomic gene catalogues (e.g. [GMGC](https://gmgc.embl.de) or [proGenomes](https://progenomes.embl.de).) It makes use of the [nevermore](https://github.com/cschu/nevermore) workflow library.

Input data sets are profiled with [gffquant](https://github.com/cschu/gff_quantifier). `gffquant` aligns the input reads using `BWA-mem` (or `minimap2` for larger catalogues) against a reference catalogue and distributes the resulting gene counts to functional categories obtained from `eggnog-mapper` annotations of the reference catalogue, generating readcount-based functional profiles. The nevermore profiler workflow, nevermore library, as well as the gffquant software were/are being developed in the Bork and Zeller labs at EMBL Heidelberg. In 2023, maintenance and development was supported by [NFDI4Microbiota](https://nfdi4microbiota.de/)

#### Citation
This workflow: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.13143233.svg)](https://doi.org/10.5281/zenodo.13143233)

---
# Overview
![nevermore_workflow](https://raw.githubusercontent.com/grp-bork/nevermore_profiler/main/docs/nevermore.svg)

---
# Requirements

---
# Usage
## Cloud-based Workflow Manager (CloWM)
This workflow will be available on the CloWM platform (coming soon).

## Command-Line Interface (CLI)
## Input files
Fastq files are supported and can be either uncompressed (but shouldn't be!) or compressed with `gzip` or `bzip2`. Sample data must be arranged in one directory per sample.

### Per-sample input directories
All files in a sample directory will be associated with the name of the sample folder. Paired-end mate files need to have matching prefixes. Mates 1 and 2 can be specified with suffixes `_[12]`, `_R[12]`, `.[12]`, `.R[12]`. Lane IDs or other read id modifiers have to precede the mate identifier. Files with names not containing either of those patterns will be assigned to be single-ended. Samples consisting of both single and paired end files are assumed to be paired end with all single end files being orphans (quality control survivors). 
