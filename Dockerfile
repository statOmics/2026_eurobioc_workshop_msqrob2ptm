FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"

RUN mkdir -p /opt/fileCache && \
    chmod -R 777 /opt/fileCache

    
RUN Rscript -e "library('BiocFileCache');bfc <- BiocFileCache('/opt/fileCache');psmFile <- bfcrpath(bfc,'https://github.com/statOmics/msqrob2data/raw/refs/heads/main/dda/phospho/evidence_phospho_enriched.txt.zip');annotFile <- bfcrpath(bfc,'https://github.com/statOmics/msqrob2data/raw/refs/heads/main/dda/phospho/expDesign.csv');psmFileNE <- bfcrpath(bfc,'https://github.com/statOmics/msqrob2data/raw/refs/heads/main/dda/phospho/evidence_nonenriched.txt.zip');annotFileNE <- bfcrpath(bfc,'https://github.com/statOmics/msqrob2data/raw/refs/heads/main/dda/phospho/expDesignNonEnriched.csv');precursorFile <- bfcrpath(bfc,'https://zenodo.org/records/20414816/files/WholeProteome_DIANNreport.parquet?download=1');precursorFilePTM <- bfcrpath(bfc,'https://zenodo.org/records/20414816/files/Phosphoproteome_DIANNreport.parquet?download=1')"