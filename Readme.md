# Docker files for [er](https://github.com/ExpertRootGroup/er) building.

## Container fs_oct17p4:

* [FairSoft](https://github.com/FairRootGroup/FairSoft):oct17p4
* [FairRoot](https://github.com/FairRootGroup/FairRoot):v-17.10b
* [go4](https://www.gsi.de/en/work/research/experiment_electronics/data_processing/data_analysis/the_go4_home_page.htm):6.0.0

## Container er

Building [er](https://github.com/FLNR-JINR/er) and [accdaq](https://github.com/FLNR-JINR/ACCULINNA_go4_user_library)

```
docker build --build-arg DEPENDENCIES=ghcr.io/flnr-jinr/fs_oct17p4:latest --build-arg ER=dev --build-arg ACCDAQ=master -t er .
```

Define base container DEPENDECIES, revision ACCDAQ of [ACCULINNA_go4_user_library](https://github.com/FLNR-JINR/ACCULINNA_go4_user_library) and revision ER of [er](https://github.com/FLNR-JINR/er).

Running bash shell in container:

```
docker run -it er -v <your_working_directory>:/home/jovyan -e DISPLAY=<your_$DISPLAY_value>  /bin/bash 
```

-v <your_working_directory>:/home/jovyan - plugs your working directory in container.

-e DISPLAY=<your_$DISPLAY_value> - set your host display for gui forwarding. For forwarding gui in MacOS [socat](https://gist.github.com/stonehippo/2c2b0972b7d199c78fb94fa9b1be1f5d) is needed.

## Container er_notebooks

Building [er](https://github.com/FLNR-JINR/er), [accdaq](https://github.com/FLNR-JINR/ACCULINNA_go4_user_library) and setup jupyter with [root kernel](https://github.com/root-project/root/tree/master/bindings/jupyroot)

```
build --build-arg DEPENDENCIES=ghcr.io/flnr-jinr/fs_oct17p4:latest --build-arg ER=dev --build-arg ACCDAQ=master -t er_notebooks .
```

Running jupyter server in container:

```
docker run -it er -v <your_working_directory>:/home/jovyan -p 8888:8888
```

Then found client at localhost:8888.