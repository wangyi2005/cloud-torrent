FROM alpine:latest
ENV VER=0.8.25
RUN apk add --no-cache --virtual .build-deps ca-certificates &&\
    mkdir -m 777 /ct &&\
    cd /ct &&\
    wget -O ct.gz http://github.com/jpillora/cloud-torrent/releases/download/$VER/cloud-torrent_linux_amd64.gz &&\
    gzip -d ct.gz &&\
    chmod +x ct
#ADD entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh 
#ENTRYPOINT  /entrypoint.sh 
CMD ["/ct/ct","--port","8080","--log"]
EXPOSE 8080
