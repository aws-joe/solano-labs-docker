#!/bin/bash

# Exit on script errors
#set -o errexit -o pipefail

# Only deploy if all tests have passed
#if [[ "passed" != "$TDDIUM_BUILD_STATUS" ]]; then
#  echo "\$TDDIUM_BUILD_STATUS = $TDDIUM_BUILD_STATUS"
#  echo "Will only deploy on passed builds"
#  exit
#fi

# Only the master branch should trigger deploys
#if [[ "master" != "$TDDIUM_CURRENT_BRANCH" ]]; then
#  echo "\$TDDIUM_CURRENT_BRANCH = $TDDIUM_CURRENT_BRANCH"
#  echo "Will only depoloy on master branch"
#  exit
#fi

# Uncomment if cli-initiated Solano builds should not trigger deploys
#if [[ "ci" != "$TDDIUM_MODE" ]]; then
#  echo "\$TDDIUM_MODE = $TDDIUM_MODE"
#  echo "Will on deploy on ci initiated builds."
#  exit
#fi

# Deploy to docker hub?
#if [ -z "$DEPLOY_DOCKER" ] && [[ "true" == "$DEPLOY_DOCKER" ]]; then
#  echo "Will only deploy if \$DEPLOY_DOCKER is set."
#  exit
#fi

echo "starting push"

sudo docker login -e=$DOCKER_EMAIL -u=$DOCKER_USER -p=$DOCKER_PASSWORD
sudo docker push $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID

echo "done with push"
