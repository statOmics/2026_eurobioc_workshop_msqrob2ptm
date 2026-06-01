FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

# Set environment FIRST
ENV XDG_CACHE_HOME=/opt/fileCache
ENV BFC_CACHE=/opt/fileCache
ENV BFC_DISABLE_LOCKING=true

# Create cache directory FIRST
RUN mkdir -p /opt/fileCache && chmod -R 777 /opt/fileCache

# Force BiocFileCache to use correct path 
RUN echo "options(BiocFileCache.cache = '/opt/fileCache')" >> /usr/local/lib/R/etc/Rprofile.site

# Install packages
RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"


# Install packages FIRST
RUN Rscript -e "options(repos = BiocManager::repositories());BiocManager::install(c('BiocFileCache','devtools'), ask=FALSE)"

# Pre-download data INTO the cache
RUN Rscript -e "\
library(BiocFileCache); \
bfc <- BiocFileCache('/opt/fileCache'); \
bfcrpath(bfc,'https://zenodo.org/records/20414816/files/WholeProteome_DIANNreport.parquet?download=1'); \
bfcrpath(bfc,'https://zenodo.org/records/20414816/files/Phosphoproteome_DIANNreport.parquet?download=1'); \
bfcrpath(bfc,'https://rest.uniprot.org/uniprotkb/stream?compressed=true&download=true&format=fasta&query=((proteome:UP000002311)+AND+reviewed=true)')"

# Build vignettes LAST
RUN Rscript -e "devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"