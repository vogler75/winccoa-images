name=${1:-oa}
docker run -d -ti -v /home:/home -p 5678:5678 -e DISPLAY=172.17.0.1:0 --name $name --hostname $name winccoa-oa4j:3.15.6 bash
