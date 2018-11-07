FROM alpine:latest
ENV VER = 0.8.25
RUN mkdir -m 777 /ct

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 
ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
