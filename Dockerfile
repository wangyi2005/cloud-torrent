FROM ubuntu:18.10
ENV VER=0.8.25
RUN apt-get update &&\
    apt-get -y install curl &&\
    mkdir -m 777 /ct &&\
    cd /ct &&\
    curl -L -o ct.gz http://github.com/jpillora/cloud-torrent/releases/download/$VER/cloud-torrent_linux_amd64.gz &&\
    gzip -d ct.gz &&\
    chmod +x ct
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 
ENTRYPOINT  /entrypoint.sh 
#CMD ["/ct/ct","--port","8080","--log"]
EXPOSE 8080
