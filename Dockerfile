FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"

USER rstudio

RUN Rscript -e "library('BiocFileCache');bfc <- BiocFileCache();precursorFile <- bfcrpath(bfc,'https://zenodo.org/records/20414816/files/WholeProteome_DIANNreport.parquet?download=1');precursorFilePTM <- bfcrpath(bfc,'https://zenodo.org/records/20414816/files/Phosphoproteome_DIANNreport.parquet?download=1');fastaFile <- bfcrpath(bfc,'https://rest.uniprot.org/uniprotkb/stream?compressed=true&download=true&format=fasta&query=%28%28proteome%3AUP000002311%29+AND+reviewed%3Dtrue%29')"