FROM winccoa-base
ADD files/java.sh /etc/profile.d/
RUN yum install -y --nogpgcheck java-1.8.0-openjdk-devel git which
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
