FROM winccoa-centos
ADD software /software
<<<<<<< HEAD:winccoa-base/Dockerfile
ADD files /files
=======
ADD config /config
>>>>>>> 9d0183df00885f1410a16e7b78c66b8b9a083f83:winccoa-server/Dockerfile
RUN yum install -y \
/software/WinCC_OA_3.15-base-rhel-0-6.x86_64.rpm \
/software/WinCC_OA_3.15-api-rhel-0-6.x86_64.rpm
RUN yum clean all
RUN ln -s /opt/WinCC_OA/3.15 /opt/WinCC_OA/current; \
cp /files/shield.txt /opt/WinCC_OA/current/; \
cp /files/winccoa.sh /etc/profile.d/; 
