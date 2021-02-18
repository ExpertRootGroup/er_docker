ARG ER=dev
ARG ACCDAQ=master
ARG DEPENDENCIES=ghcr.io/flnr-jinr/fs_oct17p4:latest

FROM ${DEPENDENCIES}

RUN apt-get install nano

WORKDIR /opt

RUN useradd -m -d /home/jovyan jovyan
RUN chown jovyan:jovyan /opt
USER jovyan

SHELL ["/bin/bash", "--login", "-c"]

RUN git clone https://github.com/flnr-jinr/ACCULINNA_go4_user_library accdaq &&\
	cd accdaq &&\
	git checkout ${ACCDAQ} &&\
	mkdir build && cd build &&\
	source /opt/FairSoft/bin/thisroot.sh &&\
	source /opt/go4/go4login &&\
	cmake ../ -DCMAKE_INSTALL_PREFIX=/opt/accdaq/install &&\
	make install -j4 

RUN cd /opt && git clone https://github.com/flnr-jinr/er &&\
	cd er &&\
	git checkout ${ER} &&\
	export SIMPATH=/opt/FairSoft/ &&\
	export FAIRROOTPATH=/opt/FairRoot/ &&\
	mkdir build &&\
	cd build &&\
	cmake ../ -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DACCULINNA_GO4=/opt/accdaq/install &&\
	make -j4

RUN wget -nv http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O miniconda.sh &&\
    bash miniconda.sh -b -p /opt/miniconda &&\
    source /opt/miniconda/etc/profile.d/conda.sh &&\
	conda install -c conda-forge -y jupyter &&\
	conda install -c conda-forge -y metakernel &&\
	rm ./miniconda.sh

SHELL ["/opt/miniconda/condabin/conda", "run", "-n", "base", "/bin/bash", "-c"]

RUN jupyter-kernelspec install --user /opt/FairSoft/share/root/etc/notebook/kernels/root/
COPY kernel.json /home/jovyan/.local/share/jupyter/kernels/root/kernel.json
	
EXPOSE 8888
WORKDIR /home/jovyan

SHELL ["/bin/bash", "--login", "-c"]
COPY start.sh /etc/start.sh

CMD ["/etc/start.sh"]