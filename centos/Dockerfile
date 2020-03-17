FROM centos:centos7.7.1908
ADD software /software
RUN yum install -y `cat /software/dependencies.txt`
RUN yum install -y /software/WinCC_OA_3.16-*.rpm
RUN yum clean all
RUN systemd-machine-id-setup
ADD config /config
RUN ln -s /opt/WinCC_OA/3.16 /opt/WinCC_OA/current; \
cat /config/env.sh >> /etc/environment; \
cat /config/env.sh >> /etc/profile.d/winccoa.sh; \
[ ! -f /config/shield.txt ] || cp /config/shield.txt /opt/WinCC_OA/current/;
ENV PATH="/opt/WinCC_OA/current/bin:/config:${PATH}"
CMD ["WCCILpmon", "-autoreg", "-config", "/proj/default/config/config"]
