FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"

RUN Rscript -e "library('BiocFileCache');bfc <- BiocFileCache();psmFile <- bfcrpath(bfc,'https://github.com/statOmics/msqrob2data/raw/refs/heads/main/dda/phospho/evidence_phospho_enriched.txt.zip')"
"