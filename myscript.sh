#!/bin/bash
docker build -t mvnbuild -f Dockerfilemvn .
docker run -it -d mvnbuild bash
contid="$(sudo docker ps -q)"
echo $contid
docker cp $contid:/app/target/gamutkart.war .
