FROM ubuntu:16.04

USER root

# Set the working directory to /opt
WORKDIR /opt

COPY geant4.10.02.p01.tar.gz /opt/geant4.10.02.p01.tar.gz

RUN apt-get -y update &&\
  apt-get -y install bzip2 cmake cmake-data g++ gcc gfortran \
  debianutils build-essential make patch sed \
  libx11-dev libxft-dev libxext-dev libxpm-dev libxmu-dev \
  libglu1-mesa-dev libgl1-mesa-dev \
  libncurses5-dev curl libcurl4-openssl-dev bzip2 libbz2-dev gzip unzip tar \
  subversion git xutils-dev flex bison lsb-release python-dev \
  libc6-dev-i386 libxml2-dev wget libssl-dev libkrb5-dev \
  automake autoconf libtool

#install packages
RUN git clone https://github.com/FairRootGroup/FairSoft.git fs_src_and_build &&\
    cd fs_src_and_build &&\
    git checkout oct17p4 &&\
    cp /opt/geant4.10.02.p01.tar.gz ./transport/geant4.10.02.p01.tar.gz &&\
    rm /opt/geant4.10.02.p01.tar.gz &&\
    printf " compiler=gcc\n\
      debug=no\n\
      optimize=yes\n\
      geant4_download_install_data_automatic=yes\n\
      geant4_install_data_from_dir=no\n\
      build_root6=yes\n\
      build_python=yes\n\
      install_sim=yes\n\
      SIMPATH_INSTALL=/opt/FairSoft/" > install.conf &&\
    ./configure.sh install.conf &&\
    cd /opt &&\
    rm -r fs_src_and_build

RUN export SIMPATH=/opt/FairSoft &&\
  cd /opt &&\
	git clone https://github.com/FairRootGroup/FairRoot.git fr_src_and_build &&\
	cd fr_src_and_build &&\
	git checkout v-17.10b &&\
	mkdir build &&\
	cd build &&\
	/opt/FairSoft/bin/cmake -DCMAKE_INSTALL_PREFIX="/opt/FairRoot" .. &&\
	make -j4 &&\
	make install -j4 &&\
  cd /opt &&\
  rm -r fr_src_and_build
  
RUN export FAIRROOTPATH=/opt/FairRoot/

RUN wget -O go4.tar.gz http://web-docs.gsi.de/~go4/software/download.php?http://web-docs.gsi.de/~go4/download/go4-6.0.0.tar.gz &&\
    tar xzf go4.tar.gz &&\
    rm go4.tar.gz &&\
    mv go4-6.0.0 go4 &&\
    cd go4 &&\
    source $SIMPATH/bin/thisroot.sh &&\
    make withqt=no -j4

