ARG FAIRROOT=17.04
ARG ER=dev

FROM fairroot:${FAIRROOT}

WORKDIR /opt

RUN git clone https://github.com/ExpertRootGroup/er &&\
	cd er &&\
	git checkout ${ER}

WORKDIR /opt/er
RUN	export SIMPATH=/opt/fair_install/FairSoft/installation &&\
	export FAIRROOTPATH=/opt/FairRoot/insttallation &&\
	mkdir build &&\
	cd build &&\
	cmake ../ -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ &&\
	make -j4

USER jovyan
WORKDIR /home/jovyan
RUN mkdir input && mkdir output && mkdir macro
