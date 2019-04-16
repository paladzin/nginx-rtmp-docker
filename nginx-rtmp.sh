docker build -t ngin-rtmp2d ./
docker run --detach --restart always -ti \
        --publish 1935:1935 \
        --publish 80:80 \
        --volume /opt/nginx:/etc/nginx \
        --name nginx-rtmp2d \
        nginx-rtmp2d
