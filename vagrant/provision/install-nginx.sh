#!/usr/bin/env bash

if [ ! -e "/usr/sbin/nginx" ]; then
    echo ">>> Installing nignx"

    sudo apt-get install -y nginx
    sudo chown -R ubuntu /etc/nginx

    echo ">>> Nignx Installed "
else
    echo ">>> Nignx already Installed "
fi

echo ">>> clearing old nginx sites"
sudo rm -f /etc/nginx/sites-enabled/*
sudo rm -f /etc/nginx/sites-available/*
echo ">>> Old nginx sites cleared"


