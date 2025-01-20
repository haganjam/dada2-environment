# dada2-environment

DADA2 is an amplicon sequencing pipeline. This repository describes the development of a Docker container which hosts R along with the dada2 package and its dependencies. Moreover, the container allows users to use this containerised environment via an RStudio IDE that is run through the browser.

The container was created from a recent version of the the rocker/verse image (rocker/r-ver:4.4.2) (see https://rocker-project.org/images/ for details). This image was adapted to run linux/amd64 via emulation and the relevant packages were installed that are required to run the dada2 pipeline.

I plan to use this container for a set of upcoming bioinformatic analyses in order to maintain reproducibility.

## Using the container

If you want to use this container, you will have to build the image on your own computer and store it your local set of docker. To do this, you can clone this repository, navigate to this repository and run:

+ docker build --build-arg TARGETPLATFORM=linux/arm64 -t my-username/my-image .

If the image is successfully built, you can spin up the container using the following:

+ docker run --rm -p 8787:8787 -v /path/to/volume:/home/rstudio/ my-username/my-image

### Host site for Rstudio

To access the RStudio IDE associated with this container via your browser, you can go to the following link:

+ http://localhost:8787

It should ask for a username (rstudio) and password (specified in the terminal where the container is initialised from).

## Example

Build the image on my local computer:

+ docker build --build-arg TARGETPLATFORM=linux/arm64 -t haganjam/dada2-env:v1 .

Create a container instance:

+ docker run --rm -p 8787:8787 -v /path/to/repository:/home/rstudio/ --platform linux/amd64 haganjam/dada2-env:v1




