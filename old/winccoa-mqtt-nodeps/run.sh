name=${1:-oa}
docker run -d -p 1883:1883 -e DISPLAY=172.17.0.1:0 --name $name --hostname $name winccoa-mqtt-nodeps
docker logs -f oa
