#!/bin/bash
#This one does a complete down/up of the docker stuff.

echo "Sourcing env.sh"
source $HOME/bin/env.sh

cd $COPIER_DIR
docker-compose down
docker-compose up -d
