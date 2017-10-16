# Dockerfiles for WinCC OA

This repository contains Dockerfiles and samples to build Docker images for WinCC OA products and open source projects.
```
docker build winccoa-centos -t winccoa-centos

# download and unzip WinCC OA to the software directory in winccoa-base and match the version in the Dockerfileand store your shield.txt file to the files directory
#   WinCC_OA_3.XX-api-rhel-0-X.x86_64.rpm 
#   WinCC_OA_3.XX-base-rhel-0-X.x86_64.rpm
docker build winccoa-base -t winccoa-base
./build.sh

docker run -d -ti -p 5678:5678 -e DISPLAY=172.17.0.1:0 --name oa winccoa-base bash 
# on Linux allow clients to connect to your X-Windows-Server (Xorg -listen tcp & "xhost +")
# on Windows you should change the DISPLAY variable and use a XWin software (e.g. Xming)

docker exec -ti oa bash
> startPA
> startConsole
```

# MQTT Example
This will startup a project with the MQTT driver and a local running MQTT broker.<br>
Use any MQTT client (e.g. Google Chrome MQTTlens) to send/read ExampleDP_* datapoints.<br>
Values are JSON encoded - e.g. { "Value": 42 }<br>
ExampleDP_Arg1,ExampleDP_Arg2 are configured as inputs to OA (MQTT => OA)<br>
ExampleDP_Result is configured an output (OA => MQTT)<br>
```
docker build winccoa-centos -t winccoa-centos
docker build winccoa-base -t winccoa-base # copy wincc oa software rpm's to the software directory
docker build winccoa-java -t winccoa-java
docker build winccoa-mqtt -t winccoa-mqtt

docker run -d -v /home:/home -p 5678:5678 -p 1883:1883 -e DISPLAY=172.17.0.1:0 winccoa-mqtt

# on Linux allow clients to connect to your X-Windows-Server (Xorg -listen tcp & "xhost +")
# on Windows you should change the DISPLAY variable and use XWin software (e.g. Xming)

optionally you can use the all in one Dockerfile "winccoa-mqtt-nodeps"
docker build https://github.com/vogler75/winccoa-images/winccoa-mqtt-nodeps -t winccoa-mqtt
```
