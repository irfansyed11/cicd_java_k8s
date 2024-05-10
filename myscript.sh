#!/bin/bash
# set -x
docker build -t mvnbuild -f Dockerfilenew .
docker run -it -d mvnbuild bash
contid="$(docker ps | grep mvnbuild | sed 's/|/ /' | awk '{print $1}')"
echo $contid
docker cp $contid:/app/target/gamutkart.war .
