docker network create --driver bridge winccoa
docker run -d -ti -v ~/Workspace:/data -p 4001:5678 -e DISPLAY=172.17.0.1:0 --hostname oa1 --name oa1 --net=winccoa winccoa-server:3.15.6
docker run -d -ti -v ~/Workspace:/data -p 4002:5678 -e DISPLAY=172.17.0.1:0 --hostname oa2 --name oa2 --net=winccoa winccoa-server:3.15.6
