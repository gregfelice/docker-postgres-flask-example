#!/bin/bash

red='\e[0;33m'
NC='\e[0m' # No Color

sudo docker stop db
sudo docker rm -f db

echo -e "${red}build the database${NC}"
sudo docker build -t gregfelice/centos-postgres ./db_container                 # build db container

echo -e "${red}run the database${NC}"
sudo docker run -d -p 7777:5432 --name db gregfelice/centos-postgres           # run as daemon

# sudo docker run --rm -P --name db gregfelice/centos-postgres                 # foreground
# sudo docker run -i -t --name db gregfelice/centos-postgres /bin/bash         # cli

# psql -h localhost -p 7777 -d docker -U docker --password                     # to access db from host

sudo docker stop web
sudo docker rm -f web

echo -e "${red}build the app${NC}"
sudo docker build -t gregfelice/centos-flask ./app_container                                       # build app container

echo -e "${red}run the app${NC}"
sudo docker run -d -p 8888:5000 --name web --link db:db gregfelice/centos-flask python app.py      # run as daemon
#sudo docker run -d -p 8889:5000 --name web2 --link db:db gregfelice/centos-flask python app.py      # run as daemon
#sudo docker run -d -p 8890:5000 --name web3 --link db:db gregfelice/centos-flask python app.py      # run as daemon

# sudo docker run -i -t -p 8888:5000 --name web --link db:db gregfelice/centos-flask /bin/bash     # command line

echo -e "${red}connect via http to the app${NC}"
sleep 5
echo `curl localhost:8888` # test



