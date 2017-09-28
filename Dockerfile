# Dockerfile for a simple Nginx stream replicator
FROM alpine:latest

# Install prerequisites and update certificates
RUN apk --update --no-cache add \
      nginx \
      nginx-mod-rtmp \
      ffmpeg && \
      rm -rf /var/cache/apk/*

# Forward logs to Docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
# Mounts
VOLUME ['/etc/nginx']
# Ports
EXPOSE 1935 80
# Run in the foreground
CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
