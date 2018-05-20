# Dockerfiles for [ExpertRoot](https://github.com/ExpertRootGroup/er) building.

## Build [FairRoot](https://github.com/FairRootGroup/FairRoot) container

```
docker build - < Dockerfile.fairroot.17.04 -t fairroot:17.04
```

FairSoft oct17p1 with Root 6 will be compiled in container.

## Build [ExpertRoot](https://github.com/ExpertRootGroup/er) container

```
docker build - --build-arg FAIRROOT=17.04 --build-arg ER=419b1db933f51a4480963b576e711301c4c100fc  -t er:TAG
```

Define FairRoot container tag, ExpertRoot revision in this string. 


