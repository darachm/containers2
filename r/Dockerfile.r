FROM ubuntu:20.04

#    # Got the below from somewhere else, opening up the sources list
#RUN sed -i 's/main/main restricted universe/g' /etc/apt/sources.list
    #ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get install -y \
    apt-transport-https software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb [arch=amd64,i386] https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
RUN apt-get update && apt-get install -y \
    r-base r-base-dev

RUN apt-get update && apt-get install -y \
    vim gnupg2 git wget g++ gcc \
    libxml2-dev libssl-dev \
    curl libcurl4-openssl-dev pandoc \
    libfontconfig1-dev libgit2-dev

RUN apt upgrade -y

RUN Rscript -e 'install.packages("tidyverse",dependencies=T);'
RUN Rscript -e 'install.packages("magrittr",dependencies=T);'
RUN Rscript -e 'install.packages("devtools",dependencies=T);'

RUN Rscript -e 'install.packages("hash",dependencies=T);'
RUN Rscript -e 'install.packages("stringdist",dependencies=T);'

RUN Rscript -e 'install.packages("DBI",dependencies=T);'
RUN Rscript -e 'install.packages("RSQLite",dependencies=T);'
RUN Rscript -e 'install.packages("jsonlite",dependencies=T);'

RUN Rscript -e 'install.packages("ggrepel",dependencies=T);'
RUN Rscript -e 'install.packages("pheatmap",dependencies=T);'
RUN Rscript -e 'install.packages("egg",dependencies=T);'
RUN Rscript -e 'install.packages("ggalluvial",dependencies=T);'
RUN Rscript -e 'install.packages("cowplot",dependencies=T);'
RUN Rscript -e 'install.packages("pracma",dependencies=T);'
RUN Rscript -e 'install.packages("vegan",dependencies=T);'
RUN Rscript -e 'install.packages("UPSetR",dependencies=T);'
RUN Rscript -e 'install.packages("ghibli",dependencies=T);'
RUN Rscript -e 'install.packages("hexbin",dependencies=T);'
RUN Rscript -e 'install.packages("ggsignif",dependencies=T);'
RUN Rscript -e 'devtools::install_github("LKremer/ggpointdensity",dependencies=T);'

RUN Rscript -e 'install.packages("fst",dependencies=T);'
RUN Rscript -e 'install.packages("mcr",dependencies=T);'
RUN Rscript -e 'install.packages("limma",dependencies=T);'
RUN Rscript -e 'install.packages("randomForest",dependencies=T);'
RUN Rscript -e 'install.packages("xgboost",dependencies=T);'

RUN Rscript -e 'install.packages("EBImage",dependencies=T);'

RUN Rscript -e 'install.packages("BiocManager",dependencies=T);'

RUN Rscript -e 'BiocManager::install(version="3.13",ask=F)'
RUN Rscript -e 'BiocManager::install(version="3.13","org.Sc.sgd.db");'
RUN Rscript -e 'BiocManager::install(version="3.13","Biobase");'
RUN Rscript -e 'BiocManager::install(version="3.13","GOSemSim");'
RUN Rscript -e 'BiocManager::install(version="3.13","clusterProfiler");'
RUN Rscript -e 'BiocManager::install(version="3.13","variancePartition");'
RUN Rscript -e 'BiocManager::install(version="3.13","DESeq2");'
