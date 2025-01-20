# Use a base image with the required R version (4.42)
FROM rocker/r-ver:4.4.2

LABEL project="dada2"
LABEL application="RStudioIDE"

# Install system dependencies for R packages and Bioconductor
RUN apt-get update && apt-get install -y \
    gdebi-core \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libgit2-dev \
    && apt-get clean

# Install Bioconductor and the specific version of dada2
RUN R -e "install.packages('BiocManager'); \
    BiocManager::install('dada2', version = '3.17', ask = FALSE); \
    if (packageVersion('dada2') != '1.26.0') stop('Failed to install the specified version of dada2')"

# Verify the installed version of dada2
RUN R -e "packageVersion('dada2')"

# Expose RStudio server port
EXPOSE 8787

# Automatically link a shared volume for Kitematic users
VOLUME /home/rstudio/kitematic

# Set the default command to initialize the container
CMD ["/init"]
