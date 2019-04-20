#!/bin/sh
RUNNING=`docker ps -a | grep mc_server`
IMAGE=`docker images | grep mc_server`

if [ -n "$IMAGE" ]; then
	echo "Found container. removing"
	docker stop mc_server
	docker rm mc_server

else
	echo "No container found"
fi

if [ -n "$IMAGE" ]; then
	echo "Found image. removing"
	docker rmi -f mc_server
else
	echo "No image found"
fi

docker build . -t mc_server/mc_server:latest 

docker run --name mc_server -v /home/tmcalves/mc_server/imblying76_server/survival:/minecraft/survival -d mc_server/mc_server:latest


