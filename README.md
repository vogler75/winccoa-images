# Dockerfiles for WinCC OA

This repository contains Dockerfiles and samples to build Docker images for WinCC OA products and open source projects.
```
cd winccoa-centos; ./build.sh

cd winccoa-server-core
# download and unzip WinCC OA to the software directory and match the version in the Dockerfile
#   WinCC_OA_3.XX-api-rhel-0-X.x86_64.rpm 
#   WinCC_OA_3.XX-base-rhel-0-X.x86_64.rpm
# store your shield.txt file to the config directory
./build.sh

docker run -d -ti -p 5678:5678 -e DISPLAY=172.17.0.1:0 --name oa winccoa-server-core bash 
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
cd winccoa-centos; ./build.sh
cd winccoa-server-core; ./build.sh # copy wincc oa software rpm's to the software directory
cd winccoa-server-java; ./build.sh # java + oa4j 
cd winccoa-server-mqtt; ./build.sh
./run.sh 
# on Linux allow clients to connect to your X-Windows-Server (Xorg -listen tcp & "xhost +")
# on Windows you should change the DISPLAY variable and use a XWin software (e.g. Xming)
```
