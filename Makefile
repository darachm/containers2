
.PHONY: all

# TODO figure out how to get shell variable sing cache dir into targets

~/.singularity/darachm-containers-%.simg : */Singularity.%
	sudo singularity build $@ $<

all_containers = \
	~/.singularity/darachm-containers-ubuntu2004.simg \
	~/.singularity/darachm-containers-tensorflow-v2.2.0-compiled.simg \
	~/.singularity/darachm-containers-tensorflow-v2.4.0-rc4-compiled.simg \
	~/.singularity/darachm-containers-jupyter-plus.simg \
	~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.2.0-compiled.simg \
	~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled-partial.simg \
	~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled.simg \
	~/.singularity/darachm-containers-jupyter.simg 

# Additional dependencies for some
~/.singularity/darachm-containers-jupyter-plus.simg : \
		~/.singularity/darachm-containers-ubuntu2004.simg
~/.singularity/darachm-containers-jupyter-plus-tfcompiled-v2.4.0-rc4-compiled.simg : \
		~/.singularity/darachm-containers-tensorflow-v2.4.0-rc4-compiled.simg 
~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.2.0-compiled.simg : \
		~/.singularity/darachm-containers-tensorflow-v2.2.0-compiled-partial.simg 

~/.singularity/darachm-containers-jupyter-plus-tensorflow-v2.0.3-compiled.simg : \
		~/.singularity/darachm-containers-tensorflow-v2.0.3-compiled-partial.simg 

~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled.simg : \
		~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled-partial.simg
~/.singularity/darachm-containers-tensorflow-v1.15.4-compiled-partial.simg :

all: $(all_containers)
	
