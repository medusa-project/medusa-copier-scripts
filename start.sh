#!/bin/bash
source ./env.sh

#coordinate this with the docker-compose file to make
#sure that the right volumes exist
instances=(1 2 3 4)
for i in "${instances[@]}"; do
    mkdir -p "$RUN_DIR/$i"
    mkdir -p "$LOG_DIR/$i"
done

cd $COPIER_DIR
docker-compose start || docker-compose up
