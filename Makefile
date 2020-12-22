
.PHONY: all

# TODO figure out how to get shell variable sing cache dir into targets

~/.singularity/darachm-containers-%.simg : */Singularity.%
	sudo singularity build $@ $<

all_containers = \
	~/.singularity/darachm-containers-ubuntu2004.simg \
	~/.singularity/darachm-containers-tensorflow2-compiled-R710.simg \
	~/.singularity/darachm-containers-jupyter-plus.simg \
	~/.singularity/darachm-containers-jupyter-plus-tfcompiled.simg \
	~/.singularity/darachm-containers-jupyter.simg 

# Additional dependencies for some
~/.singularity/darachm-containers-jupyter-plus-tfcompiled.simg : \
		~/.singularity/darachm-containers-tensorflow2-compiled-R710.simg 
~/.singularity/darachm-containers-jupyter-plus.simg : \
		~/.singularity/darachm-containers-ubuntu2004.simg
~/.singularity/darachm-containers-jupyter-plus-tfcompiled.simg : \
		~/.singularity/darachm-containers-ubuntu2004.simg

all: $(all_containers)
	
