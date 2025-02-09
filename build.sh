#!/bin/bash
#sudo docker build ./ -t php_fpm:7.4-`date '+%Y%m%d_%H%M%S'` --file Dockerfile
sudo docker build ./ -t alpine-php_fpm:7.4 --file Dockerfile
