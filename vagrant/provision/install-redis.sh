#!/usr/bin/env bash

# install redis server
if [ ! -e "/usr/bin/redis-server" ]; then
    echo ">>> Installing redis-server"
    sudo apt-get -y install redis-server

     # allow external connections
    echo ">>> Updating redis configs in /etc/redis/redis.conf."
    sudo sed -i "s/.*bind.*/bind 0.0.0.0/" /etc/redis/redis.conf
    echo ">>> Updated redis bind address in /etc/redis/redis.conf to 0.0.0.0 to allow external connections."

    #enable the module
    sudo systemctl restart redis-server
else
    echo ">>> Redis-server already installed"
fi

# install phpredis client
if [ ! -e "/usr/bin/redis-cli" ]; then
    echo ">>> Installing phpredis client"
    sudo apt-get install -y php-redis
    echo ">>> Phpredis client installed"
else
    echo ">>> Phpredis client already installed"
fi



