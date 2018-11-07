FROM alpine:latest
ENV VER=0.8.25
RUN mkdir -m 777 /ct &&\
   cd /ct &&\
   wget -O ct.gz http://github.com/jpillora/cloud-torrent/releases/download/$VER/cloud-torrent_linux_amd64.gz &&\
   gzip -d ct.gz
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 
ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
