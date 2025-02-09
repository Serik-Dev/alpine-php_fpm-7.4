#!/bin/bash
sudo docker network create -d bridge --subnet=172.20.0.0/16 dockernet -o "com.docker.network.bridge.name"="dockernet"
sudo docker run -d --name php7.4 --log-driver=journald --restart=unless-stopped --ip=172.20.0.5 --network="dockernet" alpine-php_fpm:7.4