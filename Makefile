
.PHONY: all 

# TODO figure out how to get shell variable sing cache dir into targets
#
~/.singularity/%.sif : */Singularity.%
	sudo singularity build $@ $<

~/.singularity/darachm-containers-%.simg : */Singularity.%
	sudo singularity build $@ $<

~/.singularity/darachm-containers-%-sandbox : */Singularity.%
	sudo singularity build --sandbox $@ $<

#~/.singularity/darachm-containers-jupyter-plus-%.simg: ~/.singularity/darachm-containers-%.simg

username=darachm

docker-% : */Dockerfile.%
	docker build -f $< -t $(username)/$(subst docker-,,$@) $(subst docker-,,$@)

bps: ~/.singularity/bioinfmunger.sif ~/.singularity/starcode.sif ~/.singularity/itermae-plus.sif ~/.singularity/guppy-gpu.sif ~/.singularity/racon.sif ~/.singularity/lh3-aligners.sif ~/.singularity/htseq.sif ~/.singularity/kalign2.sif 
#~/.singularity/medaka.sif 

~/.singularity/cuda-tensorflow-v2.6.0.sif :

~/.singularity/bioinfmunger.sif : 
~/.singularity/starcode.sif : 
~/.singularity/itermae-plus.sif : 
~/.singularity/guppy-gpu.sif : 
~/.singularity/racon.sif : 
~/.singularity/medaka.sif : 
~/.singularity/lh3-aligners.sif : 
~/.singularity/htseq.sif : 
~/.singularity/kalign2.sif : 

~/.singularity/r-tidy.sif : ~/.singularity/r.sif
~/.singularity/r-tidy-extra.sif : ~/.singularity/r-tidy.sif

~/.singularity/bioconda.sif : ~/.singularity/ubuntu2004.sif
~/.singularity/enrich2.sif : ~/.singularity/bioconda.sif

~/.singularity/jupyter-plus.sif : 

~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.4.0-rc4-compiled.simg: ~/.singularity/darachm-containers-tensorflow-v2.4.0-rc4-compiled.simg


#all_containers = \
#	~/.singularity/darachm-containers-ubuntu2004.simg \
#	~/.singularity/darachm-containers-tensorflow-v2.2.0-compiled.simg \
#	~/.singularity/darachm-containers-tensorflow-v2.4.0-rc4-compiled.simg \
#	~/.singularity/darachm-containers-jupyter-plus.simg \
#	~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.2.0-compiled.simg \
#	~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled-partial.simg \
#	~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled.simg \
#	~/.singularity/darachm-containers-jupyter.simg 

# Additional dependencies for some
~/.singularity/darachm-containers-jupyter-plus.simg : \
		~/.singularity/darachm-containers-ubuntu2004.simg
#~/.singularity/darachm-containers-jupyter-plus-tfcompiled-v2.4.0-rc4-compiled.simg : \
#		~/.singularity/darachm-containers-tensorflow-v2.4.0-rc4-compiled.simg 
#~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.2.0-compiled.simg : \
#		~/.singularity/darachm-containers-tensorflow-v2.2.0-compiled-partial.simg 
#
#~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.0.3-compiled.simg : \
#		~/.singularity/darachm-containers-tensorflow-v2.0.3-compiled-partial.simg 


#~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled.simg : \
#		~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled-partial.simg
#~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled-partial.simg :

all: $(all_containers)
	
