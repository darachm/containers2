Bootstrap: docker
From: ubuntu:20.04

%labels
MAINTAINER darachm

%help

    This container is for providing 'R', fairly basic.

%environment
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8

%post

    sed -i 's/main/main restricted universe/g' /etc/apt/sources.list
    echo 'export DEBIAN_FRONTEND=noninteractive' >> $SINGULARITY_ENVIRONMENT
    ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

    apt-get update
    apt-get -y upgrade
    apt-get -y install --no-install-recommends apt-transport-https software-properties-common dirmngr wget

    #apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    #add-apt-repository 'deb [arch=amd64,i386] https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
    apt-get install --no-install-recommends software-properties-common dirmngr
    wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
    apt-get update

    apt-get -y install --no-install-recommends r-base r-base-dev \
        vim gnupg2 git g++ gcc libxml2-dev libssl-dev \
        curl libcurl4-openssl-dev pandoc \
        libfontconfig1-dev libgit2-dev

%test

