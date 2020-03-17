FROM centos
RUN systemd-machine-id-setup
ADD software /software
ADD files /files
RUN yum install -y --nogpgcheck \
epel-release krb5-devel net-tools mesa-dri-drivers libotr \
liberation-fonts-common liberation-mono-fonts liberation-sans-fonts \
java-1.8.0-openjdk-devel git which \
/software/WinCC_OA_3.15-base-rhel-0-6.x86_64.rpm \
/software/WinCC_OA_3.15-api-rhel-0-6.x86_64.rpm

# WinCC OA
RUN ln -s /opt/WinCC_OA/3.15 /opt/WinCC_OA/current; \
cp /files/shield.txt /opt/WinCC_OA/current/; \
cp /files/winccoa.sh /etc/profile.d/; \
cp /files/java.sh /etc/profile.d/

# OA4J
RUN curl -SL http://mirror.klaus-uwe.me/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz | tar -xz -C /opt;
RUN git clone https://github.com/vogler75/oa4j.git /opt/oa4j; \
source /etc/profile.d/winccoa.sh; \
source /etc/profile.d/java.sh; \
cd /opt/oa4j/Java; echo "Maven..."; ./make.sh && \
cd /opt/oa4j/Native/Manager; ./make.sh && \
cd /opt/oa4j/Native/Driver; ./make.sh && \
mv /opt/oa4j/Native/Builds/* /opt/WinCC_OA/current/bin && \
for lang in `ls /opt/WinCC_OA/3.15/msg/`; do \
  echo "WCCOAjava,Java Manager" >> /opt/WinCC_OA/current/msg/$lang/managers.cat; \
  echo "WCCOAjavadrv,Java Driver" >> /opt/WinCC_OA/current/msg/$lang/managers.cat; \
done;

# MQTT
EXPOSE 1883
ENV URL=tcp://localhost CID=winccoa CLEAN=true LANGS="en_US.utf8"
ADD files /files
RUN yum install -y --nogpgcheck mosquitto gettext && \
source /etc/profile.d/java.sh && \
git clone https://github.com/vogler75/oa4j-drivers.git /opt/oa4j-drivers && \
cd /opt/oa4j-drivers/Mqtt; ./make.sh
ADD entrypoint.sh /
CMD ["/entrypoint.sh"]
