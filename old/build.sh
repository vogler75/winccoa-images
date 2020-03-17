docker rmi winccoa-centos winccoa-base winccoa-java winccoa-mqtt winccoa-orcl
docker build winccoa-centos -t winccoa-centos
docker build winccoa-base -t winccoa-base
docker build winccoa-java -t winccoa-java
docker build winccoa-mqtt -t winccoa-mqtt
docker build winccoa-orcl -t winccoa-orcl