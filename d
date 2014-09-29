#!/bin/bash



#######################################################
# build an image from a Dockerfile
#######################################################
function build_from_dockerfile
{
    docker build -t gregfelice/centos-flask .
}

CONTAINER="$(sudo docker run -d -p 5000:5000 training/webapp python app.py)"

echo "created container: $CONTAINER"

sleep 1

echo "killing container $CONTAINER"

sudo docker stop $CONTAINER

echo "container stopped."


