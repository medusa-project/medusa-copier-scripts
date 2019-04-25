# Medusa Copier scripts

This includes scripts and configuration template information for running 
medusa-copier via docker/docker-compose.

It is necessary to have a docker image for 
[medusa-copier](https://github.com/medusa-project/medusa-copier) available. 
If necessary you can just check that repository out and build it with:

```bash
docker image build -t medusa-copier .
```

Then checkout this repository, copy env.sh.template to env.sh. 
COPIER_DIR is where the docker-compose.yml file and other configuration
will live, and also where the medusa-copier instances will (by
docker volume mounting) have their log and run directories. Each
instance will also mount the config directory (so they have a common
config). 

The config directory will have the medusa_copier.yaml and rclone.conf.

Sample docker-compose.yml, rclone.conf, and medusa_copier.yaml files
are included in the etc/ directory of this repository. 

Once those config files are in place under COPIER_DIR and the medusa-copier
docker image is available you should be able to `docker-compose up -d` in 
that directory and then have copiers running. The start.sh and stop.sh scripts
do little more than ensuring that the log/run directories exist and running
`docker-compose start/stop`. The sample docker-compose.yml file uses
`restart: always` on the containers, so it shouldn't be necessary to
do anything more to start them on reboot.

I expect this to evolve a little bit to take advantage of some of the
technologies to monitor and restart the containers when necessary, but as
is it should work properly.


