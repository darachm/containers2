Bootstrap: docker
From: ubuntu:20.04

%labels
MAINTAINER darachm

%help

    This container is for providing `R` with some packages.
    The idea is to make a general environment, allowing bloat over leaving
    things out. 

    Should have access to R packages of:

        tidyverse
        EBImage
        clusterProfiler

    and others and others and others .......

%environment
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8

%post

    sed -i 's/main/main restricted universe/g' /etc/apt/sources.list
    echo 'export DEBIAN_FRONTEND=noninteractive' >> $SINGULARITY_ENVIRONMENT
    ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

    add-apt-repository 'deb [arch=amd64,i386] https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

    apt-get -qq update
    apt-get -qq install apt-transport-https software-properties-common

    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    add-apt-repository 'deb [arch=amd64,i386] https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

    apt-get -qq update

    apt-get -qq install r-base r-base-dev
    apt-get -qq install vim gnupg2 git wget g++ gcc libxml2-dev libssl-dev \
        curl libcurl4-openssl-dev pandoc \
        libfontconfig1-dev libgit2-dev

    apt-get -qq upgrade

    Rscript -e 'install.packages("hash",dependencies=T);'
    Rscript -e 'install.packages("ggalluvial",dependencies=T);'
    Rscript -e 'install.packages("tidyverse",dependencies=T);'
    Rscript -e 'install.packages("magrittr",dependencies=T);'
    Rscript -e 'install.packages("EBImage",dependencies=T);'
    Rscript -e 'install.packages("ggrepel",dependencies=T);'
    Rscript -e 'install.packages("pheatmap",dependencies=T);'
    Rscript -e 'install.packages("egg",dependencies=T);'
    Rscript -e 'install.packages("cowplot",dependencies=T);'
    Rscript -e 'install.packages("pracma",dependencies=T);'
    Rscript -e 'install.packages("limma",dependencies=T);'
    Rscript -e 'install.packages("vegan",dependencies=T);'
    Rscript -e 'install.packages("UPSetR",dependencies=T);'
    Rscript -e 'install.packages("fst",dependencies=T);'
    Rscript -e 'install.packages("randomForest",dependencies=T);'
    Rscript -e 'install.packages("devtools",dependencies=T);'
    Rscript -e 'install.packages("ghibli",dependencies=T);'
    Rscript -e 'install.packages("hexbin",dependencies=T);'
    Rscript -e 'install.packages("xgboost",dependencies=T);'
    Rscript -e 'install.packages("DBI",dependencies=T);'
    Rscript -e 'install.packages("RSQLite",dependencies=T);'
    Rscript -e 'install.packages("mcr",dependencies=T);'
    Rscript -e 'install.packages("ggsignif",dependencies=T);'
    Rscript -e 'devtools::install_github("LKremer/ggpointdensity",dependencies=T);'

    Rscript -e 'install.packages("BiocManager",dependencies=T);'
    Rscript -e 'BiocManager::install(version="3.12",ask=F)'
    Rscript -e 'BiocManager::install(version="3.12","org.Sc.sgd.db");'
    Rscript -e 'BiocManager::install(version="3.12","Biobase");'
    Rscript -e 'BiocManager::install(version="3.12","GOSemSim");'
    Rscript -e 'BiocManager::install(version="3.12","clusterProfiler");'
    Rscript -e 'BiocManager::install(version="3.12","variancePartition");'
    Rscript -e 'sessionInfo();'

%test

    Rscript -e 'library(fst,clusterProfiler);'
    Rscript -e 'installed.packages();'
