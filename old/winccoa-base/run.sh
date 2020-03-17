name=${1:-oa}
docker run -d -t -e DISPLAY=172.17.0.1:0 --name $name --hostname $name winccoa-base bash
