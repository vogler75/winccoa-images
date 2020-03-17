docker run -ti --rm \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /proj:/proj \
winccoa:3.16 \
WCCOAui -projAdmin
