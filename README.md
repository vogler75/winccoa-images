# Dockerfiles for WinCC OA

This repository contains Dockerfiles and samples to build Docker images for WinCC OA products and open source projects.
```
cd winccoa-centos
./build.sh

cd winccoa-server-core
# download and unzip WinCC OA to the software directory and match the version in the Dockerfile
#   WinCC_OA_3.XX-api-rhel-0-X.x86_64.rpm 
#   WinCC_OA_3.XX-base-rhel-0-X.x86_64.rpm
# store your shield.txt file to the config directory
./build.sh

docker run -d -ti -p 5678:5678 -e DISPLAY=172.17.0.1:0 winccoa-server-core bash
docker exec -ti oa bash
> startPA
> startConsole
```
