FROM winccoa-java
EXPOSE 1883
ENV URL=tcp://localhost CID=winccoa CLEAN=true LANGS="en_US.utf8"
RUN yum install -y --nogpgcheck mosquitto gettext
RUN source /etc/profile.d/java.sh && \
git clone https://github.com/vogler75/oa4j-drivers.git /opt/oa4j-drivers && \
cd /opt/oa4j-drivers/Mqtt; ./make.sh
ADD files /files
CMD ["/files/entrypoint.sh"]
