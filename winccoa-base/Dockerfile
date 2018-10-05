FROM winccoa-centos
ADD software /software
ADD files /files
RUN yum install -y \
/software/WinCC_OA_3.16-base-rhel-0-3.x86_64.rpm \
/software/WinCC_OA_3.16-api-rhel-0-3.x86_64.rpm
RUN yum clean all
RUN ln -s /opt/WinCC_OA/3.16 /opt/WinCC_OA/current; \
cp /files/winccoa.sh /etc/profile.d/; \
[ ! -f /files/shield.txt ] || cp /files/shield.txt /opt/WinCC_OA/current/; 
