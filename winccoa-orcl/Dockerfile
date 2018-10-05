FROM winccoa-base
ADD software /software
ADD files /files
RUN yum install -y \
/software/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm \
/software/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm \
/software/WinCC_OA_3.16-rdb-oracle-libs12-rhel-0-3.x86_64.rpm;  \
cp /files/oracle.sh /etc/profile.d/; \
cp /files/tnsnames.ora /etc/; \
chmod u+x $ORACLE_HOME/lib/*;
