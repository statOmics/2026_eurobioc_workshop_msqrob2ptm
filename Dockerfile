FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN mkdir -p /opt/fileCache

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"

RUN chmod -R 777 /opt/fileCache
