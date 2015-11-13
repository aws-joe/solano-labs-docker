#!/bin/bash

echo "starting build"

#sudo docker pull centos:6
echo "sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID ."
sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID .

echo "Done with build"
