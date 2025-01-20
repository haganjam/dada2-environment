# dada2-environment

DADA2 is an amplicon sequencing pipeline. This repository describes the development of a Docker container which hosts R along with the dada2 package and its dependencies. Moreover, the container allows users to use this containerised environment via an RStudio IDE that is run through the browser.

The container was created from a recent version of the the rocker/verse image (rocker/verse:4) (see https://rocker-project.org/images/ for details). This image was adapted to run linux/amd64 via emulation and the relevant packages were installed that are required to run the dada2 pipeline.

I plan to use this container for a set of upcoming bioinformatic analyses in order to maintain reproducibility.
