#!/usr/bin/env bash

if [ ! -e "/usr/bin/php" ]; then
    echo ">>> Installing php7.2"

    sudo add-apt-repository ppa:ondrej/php && sudo apt-get update

    sudo apt-get install -y php7.2 php7.2-common php7.2-cli php7.2-fpm php7.2-mysql

    echo ">>> PHP7.2 installed"
else
    echo ">>> PHP7.2 Already installed"
fi


