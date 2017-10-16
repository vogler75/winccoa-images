FROM winccoa-server-java
EXPOSE 1883
ENV URL=tcp://localhost CID=winccoa CLEAN=true
RUN yum install -y --nogpgcheck mosquitto gettext
RUN source /etc/profile.d/java.sh && \
git clone https://github.com/vogler75/oa4j-drivers.git /opt/oa4j-drivers && \
cd /opt/oa4j-drivers/Mqtt; ./make.sh
ADD files /files
CMD ["/bin/bash", "/files/docker-entrypoint.sh"]
