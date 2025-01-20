# Use a base image with the required R version (4.42)
FROM --platform=linux/arm64 rocker/r-ver:4.4.2

# Install Bioconductor and the specific version of dada2
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) {install.packages('BiocManager')}; \
          BiocManager::install('ShortRead', version = '3.20'); \
          install.packages('devtools'); \
          library('devtools'); \
          devtools::install_github('benjjneb/dada2', ref='v1.16')"

