FROM winccoa-centos
ADD software /software
ADD files /files
RUN yum install -y \
/software/WinCC_OA_3.15-base-rhel-0-6.x86_64.rpm \
/software/WinCC_OA_3.15-api-rhel-0-6.x86_64.rpm
RUN yum clean all
RUN ln -s /opt/WinCC_OA/3.15 /opt/WinCC_OA/current; \
cp /files/winccoa.sh /etc/profile.d/; \
[ ! -f /files/shield.txt ] || cp /files/shield.txt /opt/WinCC_OA/current/; 
