#!/bin/bash

#######################################################
# build an image from a Dockerfile
#
# this example builds a centos image that has the Flask python microframework installed.
#
#######################################################
function build_from_dockerfile
{
    sudo docker build -t gregfelice/centos-flask .
}

#######################################################
# run a docker container
#######################################################
function run_container
{
    CONTAINER="$(sudo docker run -d -p 5000:5000 gregfelice/centos-flask python app.py)"
    echo "created container: $CONTAINER"
}

function run_container_shell
{
    sudo docker run -t -i gregfelice/centos-flask /bin/bash
}

#######################################################
# stop a docker container
#######################################################
function stop_container
{
    sudo docker stop $CONTAINER
    echo "container $CONTAINER stopped."
}

#######################################################
# see if you can hit the port via HTTP.
#######################################################
function test_container
{
    curl -i localhost:5000
}

#run_container_shell
#build_from_dockerfile

run_container
#sleep 1
#test_container
#stop_container
