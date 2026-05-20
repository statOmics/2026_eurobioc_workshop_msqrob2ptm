# msqrob2PTM: prioritizing differentially abundant and differentially used post translational modifications in mass spectrometry-based proteomics

Authors:
    Lieven Clement^[UGent],
    Nina Demeulemeester^[UGent],
    Luca De Corso^[UGent],
    Lucas Beerland^[UGent]
    <br/>
Last modified: May 20, 2026.

## Overview

### Description

Mass spectrometry–based proteomics allows the identification and quantification 
of a myriad of posttranslational modifications (PTMs), which reveal additional 
complexity and diversity of the proteome. Indeed, PTMs greatly extend the number 
of different forms of a protein, i.e. proteoforms, that can be found. More 
importantly, these PTMs can impact protein functions as they often act as key 
switches in many cellular pathways that play vital roles in e.g. cell 
proliferation, metastasis and ageing. 

Novel multiple open-modification search engines that were developed in the 
proteomics community boost the identification of post-translational 
modifications (PTMs) with mass spectrometry (MS) based technologies. 
However, despite the advances in PTM identification, statistical methods for 
sensitive PTM-level quantification and differential analysis are lagging behind, 
and many researchers continue to rely on ad-hoc analysis workflows due to a 
lack of clear guidelines, which can lead to violations of key statistical 
assumptions. 

In this workshop, we will offer a hands-on introduction to PTM analysis in the 
msqrob2 package, which provides a set of rigorously validated and benchmarked 
statistical workflows for MS-based proteomics. We will begin by a data 
exploration to highlight that (1) peptides can contain multiple PTMs so we refer 
to a peptide with all its modifications as peptidoforms, (2) inferring on 
individual PTMs requires one to summarise all peptidoforms that carry a 
particular PTM into one PTM expression value, and show that it remains important 
to evaluate and visualize all peptidoforms that contribute to a PTM to rule out 
reporting differential PTMs that only stem from a subset of differential 
peptidoforms carrying another PTM; and that (3) parent proteins on which PTMs 
occur can also change in abundance regardless of their PTMs. Hence, any changes 
in the abundance of a PTM are then confounded with changes in protein abundance. 

We therefore introduce the concepts Differential Peptidoform/PTM Abundance (DPA) 
as well as Differential Peptidoform/PTM Usage (DPU) to enable a clear distinction 
between directly assessing DA of peptidoforms/PTMs (DPA), and differences in the 
relative usage of peptidoforms/PTMs corrected for changes in overall abundance 
of the corresponding protein (DPU). Next, we walk the participants through the 
minimal data processing steps required prior to statistical modelling, 
explaining when and why each step is necessary. Next, we introduce all steps 
required to perform DPA and DPU. 

For the DPU analyses, we will consider two different experimental designs. 
We illustrate the entire workflow when the peptidoform and protein-level 
abundance are acquired on the same sample (paired design). 
Thereafter we show how the analysis differs when peptidoform and protein-level 
abundances are quantified in independent samples (unpaired design). 
Finally, we will demonstrate how to translate biological questions into 
hypothesis tests and how to prioritise, report and visualise peptidoforms as 
well as PTMs that are differentially abundant / differentially used across 
treatment groups or upon stimulation. 

### Pre-requisites

* Basic knowledge of R syntax
* Familiarity with the `SummarizedExperiment` class
* Familiarity with MS-based proteomics data analysis
* Familiarity with statistical analysis (t-tests, design of experiment)

If you don't have at least two out of the four prerequisites, you are
still welcome to follow the workshop, but we advise to not try to run
the analysis yourself during the lecture. You should rather focus on
the explanations. You could also read the first chapter in our msqrob2book 
https://statomics.github.io/msqrob2book/

Relevant background reading for the workshop:

* VDemeulemeester, N., Gébelin, M., Caldi Gomes, L., Lingor, P., Carapito, C., 
  Martens, L., & Clement, L. (2024). msqrob2PTM: Differential Abundance and 
  Differential Usage Analysis of MS-Based Proteomics Data at the 
  Posttranslational Modification and Peptidoform Level. Molecular & Cellular 
  Proteomics, 23(2), 100708. https://doi.org/10.1016/j.mcpro.2023.100708

* The [`QFeatures` introduction vignette](https://rformassspectrometry.github.io/QFeatures/articles/QFeatures.html)

* Goeminne LJE, Gevaert K, Clement L. Peptide-level Robust Ridge 
  Regression Improves Estimation, Sensitivity, and Specificity in 
  Data-dependent Quantitative Label-free Shotgun Proteomics. Mol Cell
  Proteomics. 2016;15(2):657-668.
  [Link to paper](https://doi.org/10.1074/mcp.M115.055897);

### Participation

This workshop is designed for proteomics 
researchers who want to learn how to conduct differential PTM analyses using 
reproducible and statistically sound workflows, as well as for omics data 
analysts interested in expanding their skill set to include proteomics.

The workshop will introduce participants to important concepts 
regarding the statistical analysis of PTMs in MS-based proteomics and how the
underlying modelling assumption relate to the experimental data
characteristics. The concepts will be embedded in a real-life
analysis, demonstrating the code to carry out each step from the input
data up to the biological interpretation. Participants can follow the
workshop by running along the analysis on their local computers, but
you are not requested to as the code will be live demonstrated. We did
not include exercise to allocate time for questions and interactivity
with the audience.

### _R_ / _Bioconductor_ packages used
- msqrob2    
- QFeatures  
- dplyr
- tidyr
- ggplot2
- stringr
- ExploreModelMatrix
- kableExtra
- ComplexHeatmap
- scater
- patchwork
- seqinr
- data.table
- BiocFileCache
- purrr

### Time outline

| Activity                       | Time |
|--------------------------------|------|
| Introduction and setup         | 10m  |
| The `QFeatures` data class     | 5m  |
| Data preprocessing             | 15m  |
| Break                          | 15m  |
| Modelling sources of variation | 10m  |
| Hypothesis testing             | 10m  |
| Wrap up                        |  5m  |


### Learning goals

* Get an overview of the main challenges and artefacts in proteomics 
  data analysis, and how a well-justified data processing workflow can
  overcome these issues.
* Get a feeling on how the experimental design influences the main
  sources of variability, and hence the modelling strategy. 
* Understand why peptidoform differential abundance analysis, peptidoform usage 
analysis, PTM-level DA and PTM-level usage are important in the context of PTM 
data analysis. 

### Learning objectives

* Use `QFeatures` to manipulate and visualize proteomics data
* Use `msqrob2` to answer biological questions from processed data
* Learn how to translate these biological questions into model-related
  parameter combinations.