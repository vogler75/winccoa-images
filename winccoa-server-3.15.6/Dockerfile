FROM winccoa-centos:7.2
ADD software /software
ADD config /config
RUn yum install -y \
/software/WinCC_OA_3.15-base-rhel-0-6.x86_64.rpm \
/software/WinCC_OA_3.15-api-rhel-0-6.x86_64.rpm
RUN yum clean all
RUN ln -s /opt/WinCC_OA/3.15 /opt/WinCC_OA/current; \
cp /config/shield.txt /opt/WinCC_OA/current/; \
cp /config/winccoa.sh /etc/profile.d/; 
