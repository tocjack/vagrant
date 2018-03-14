#!/bin/sh

sudo systemctl restart php7.2-fpm 
sudo systemctl reload nginx 
sudo systemctl restart mysql
