FROM winccoa-server:3.15.6
RUN git clone https://github.com/vogler75/oa4j.git /opt/oa4j; \
source /etc/profile.d/winccoa.sh; \
source /etc/profile.d/java.sh; \
cd /opt/oa4j/Java; ./make.sh && \
mv /opt/oa4j/Java/lib /opt/WinCC_OA/current && \
cd /opt/oa4j/Native/Manager; ./make.sh && \
cd /opt/oa4j/Native/Driver; ./make.sh && \
mv /opt/oa4j/Native/Builds/* /opt/WinCC_OA/current/bin && \
for lang in `ls /opt/WinCC_OA/3.15/msg/`; do \
  echo "WCCOAjava,Java Manager" >> /opt/WinCC_OA/current/msg/$lang/managers.cat; \
  echo "WCCOAjavadrv,Java Driver" >> /opt/WinCC_OA/current/msg/$lang/managers.cat; \
done;
