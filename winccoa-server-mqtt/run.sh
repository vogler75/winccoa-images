name=${1:-oa}
docker run -d -v /home:/home -p 5678:5678 -p 1883:1883 -e DISPLAY=172.17.0.1:0 --name $name --hostname $name winccoa-server-mqtt
docker logs -f oa
