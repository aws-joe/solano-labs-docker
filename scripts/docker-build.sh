#!/bin/bash

echo "starting build"

echo "performing: sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID ."
sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID .

echo "Done with build"
