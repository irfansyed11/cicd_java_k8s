#!/bin/bash
# set -x
docker build -t mvnbuild -f Dockerfilenew .
contid="$(docker run -it -d mvnbuild bash)"
echo $contid
docker cp $contid:/app/target/gamutkart.war .
docker container stop $contid
docker container rm $contid

