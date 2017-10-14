# Dockerfiles for WinCC OA

This repository contains Dockerfiles and samples to build Docker images for WinCC OA products and open source projects.
```
cd winccoa-centos-7.2
docker build -t winccoa-centos:7.2 .

cd winccoa-server-3.15.6
# download and unzip WinCC OA 3.15.6 to the software directory 
# store your shield.txt file to the config directory
docker build -t winccoa-server:3.15.6 .

docker run -d -ti -p 5678:5678 -e DISPLAY=172.17.0.1:0 winccoa-server:3.15.6 bash
docker exec -ti oa1 bash
> startPA
> startConsole
```
