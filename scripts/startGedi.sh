docker run -ti --rm \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /proj/DemoApplication_3.16:/proj/default \
-v /proj/DemoApplication_3.16/config/config.ui:/proj/default/config/config \
winccoa:3.16 \
WCCOAui -autoreg -m gedi -config /proj/default/config/config
