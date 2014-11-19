#!/bin/bash

red='\e[0;33m'
NC='\e[0m' # No Color

sudo docker rm -f db

echo -e "${red}build the database${NC}"
sudo docker build -t gregfelice/centos-postgres ./db_container

echo -e "${red}run the database${NC}"
# run as daemon
sudo docker run -d -P --name db gregfelice/centos-postgres

# run in foreground
# sudo docker run --rm -P --name db gregfelice/centos-postgres

# run at command line
# sudo docker run -i -t --name db gregfelice/centos-postgres /bin/bash

# to connect from the host
# psql -h localhost -p PORT -d docker -U docker --password

