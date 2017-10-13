FROM winccoa-centos:7.2
ADD software /software
ADD config /config
ADD opt /opt
RUN yum install -y \
 /software/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm \
 /software/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm \
 /software/WinCC_OA_3.15-base-rhel-0-6.x86_64.rpm \
 /software/WinCC_OA_3.15-api-rhel-0-6.x86_64.rpm \
 /software/WinCC_OA_3.15-rdb-oracle-libs12-rhel-0-6.x86_64.rpm
RUN ln -s /opt/WinCC_OA/3.15 /opt/WinCC_OA/current
RUN echo "setup..."; \
cp /config/shield.txt /opt/WinCC_OA/current/; \
cp /config/winccoa.sh /etc/profile.d/; \
cp /config/java.sh /etc/profile.d/; \
cp /config/tnsnames.ora /etc/; \
chmod 755 /etc/profile.d/winccoa.sh; \
chmod 755 /etc/profile.d/java.sh; \
chmod u+x $ORACLE_HOME/lib/*;
CMD ["bash"]

