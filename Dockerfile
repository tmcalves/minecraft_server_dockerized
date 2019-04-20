FROM openjdk:8u212-jdk-stretch

RUN apt-get update -y
RUN apt-get upgrade -y
RUN wget https://download2268.mediafire.com/y6e23jcv32gg/kmapmr8c58c5jra/mc_server.zip -O server.zip 

RUN mkdir -p /minecraft
RUN unzip server.zip -d /minecraft

WORKDIR /minecraft

EXPOSE 25565
ENTRYPOINT ["./start.sh"]
