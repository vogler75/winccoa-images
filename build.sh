docker rmi winccoa-base winccoa-centos winccoa-java winccoa-mqtt winccoa-orcl
cd winccoa-centos; ./build.sh; cd ..
cd winccoa-base; ./build.sh; cd ..
cd winccoa-java; ./build.sh; cd ..
cd winccoa-mqtt; ./build.sh; cd ..
cd winccoa-orcl; ./build.sh; cd ..
