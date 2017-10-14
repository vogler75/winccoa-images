FROM winccoa-server:3.15.6
ADD software /software
ADD config /config
RUN yum install -y \
 /software/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm \
 /software/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm \
 /software/WinCC_OA_3.15-rdb-oracle-libs12-rhel-0-6.x86_64.rpm
RUN echo "setup..."; \
cp /config/oracle.sh /etc/profile.d/; \
cp /config/tnsnames.ora /etc/; \
chmod u+x $ORACLE_HOME/lib/*;
