# Dockerfiles for WinCC OA based on CentOS

This repository contains Dockerfiles and samples to build Docker images for WinCC OA products.

## Build Docker Image

Download and unzip the CentOS WinCC OA rpm's to the software directory.  

Only put those WinCC OA rpm's into the directory which you want to have installed in your image. For a minimum image you only need the base packag of WinCC OA.

`WinCC_OA_3.16-base-rhel-0-17.x86_64.rpm`

Build your WinCC OA Docker image with:  

`docker build -t winccoa:3.16 .`

## WinCC OA Project in a Container
The project should be mounted on **/proj/start** as a volume to your docker container.

And you may also mount a shield file to your docker container.

Example how to startup a WinCC OA project in a container:  
```
docker run -d \ 
  --name winccoa \ 
  --hostname winccoa-server \ 
  -v ~/shield.txt:/opt/WinCC_OA/3.16/shield.txt \ 
  -v /proj/DemoApplication_3.16:/proj/start \ 
  -p 5678:5678 \ 
  winccoa:3.16 
```

## WinCC OA Gedi in a Container

To start a WinCC OA client application like a Gedi or a User-Interface you have to adapt your config file so that the proxy settings point to the WinCC OA server container. You can just create a copy of your config file (e.g. config.ui) and adapt the settings.

```
[general] 
data = "winccoa-server" 
event = "winccoa-server" 
mxProxy = "winccoa-server <your-docker-host-name>:5678 cert" 
```

Then you can startup a Gedi/Ui with:
```
docker run --rm \ 
-e DISPLAY=$DISPLAY \ 
-v /tmp/.X11-unix:/tmp/.X11-unix \ 
-v /proj/DemoApplication_3.16:/proj/default \ 
-v /proj/DemoApplication_3.16/config/config.ui:/proj/default/config/config \ 
winccoa:3.16 \ 
WCCOAui -autoreg -m gedi -proj default 
```

Sure you can also use a copy of your project directory (or a git checkout if you use git) and adapt the config file. 

## Start Project Administration as Container
With the Project Administration you can create a new project in the /proj directory. 
```
docker run -ti --rm \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /proj:/proj \
winccoa:3.16 \
WCCOAui -projAdmin
```

## Distributed Managers and Kubernetes
For sure what we have done with the Gedi can also be done with Control-Managers and Drivers. And in theory that can also be done with Kubernetes and so you can run your SCADA project in a Kubernetes Cluster.