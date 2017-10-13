# Dockerfiles for WinCC OA

This repository contains Dockerfiles and samples to build Docker images for WinCC OA products and open source projects.
```
cd winccoa-centos-7.2
./build

cd winccoa-server-3.15.6
download and unzip WinCC OA 3.15.6 to the software directory 
download the oracle instant client 12.1.0.2 (basic+sqlplus) to the software directory
./build

docker run -d -ti -p 5678:5678 -e DISPLAY=172.17.0.1:0 --hostname oa1 --name oa1 --net=winccoa winccoa-server:3.15.6
docker exec -ti oa1 bash
> startPA
> startConsole
```
