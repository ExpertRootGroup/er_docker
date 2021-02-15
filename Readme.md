# Dockerfiles for [ExpertRoot](https://github.com/ExpertRootGroup/er) dependencies building.

## Container fs_oct17p4:

* [FairSoft](https://github.com/FairRootGroup/FairSoft):oct17p4
* [FairRoot](https://github.com/FairRootGroup/FairRoot):v-17.10b
* [go4](https://www.gsi.de/en/work/research/experiment_electronics/data_processing/data_analysis/the_go4_home_page.htm):6.0.0

## Build [ExpertRoot](https://github.com/ExpertRootGroup/er) container

```
build - --build-arg DEPENDENCIES=ghcr.io/flnr-jinr/fs_oct17p4:latest --build-arg ER=dev --build-arg ACCDAQ=master -t er
```

Define base container DEPENDECIES, revision ACCDAQ of [ACCULINNA_go4_user_library](https://github.com/FLNR-JINR/ACCULINNA_go4_user_library) and revision ER of [er](https://github.com/FLNR-JINR/er).


