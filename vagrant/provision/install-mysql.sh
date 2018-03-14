#!/usr/bin/env bash

if [ ! -e "/usr/bin/mysql" ]; then
    echo ">>> Installing Mysql"

    # install mysql and give password to installer
    sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
    sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
    sudo apt-get install -y mysql-server

    # clear password
    mysqladmin -uroot -proot password ''

    # mysql - allow external connections
    echo ">>>> Updating mysql configs in /etc/mysql/mysql.conf.d/mysqld.cnf."
    sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
    echo ">>>> Updated mysql bind address in /etc/mysql/conf.d/mysql.cnf to 0.0.0.0 to allow external connections."

    # create user - username: admin; password: admin
    echo ">>>> Assigning mysql user access on %. username:admin; password:admin"
    sudo mysql -uroot --execute "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';"
    sudo mysql -uroot --execute "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin' with GRANT OPTION; FLUSH PRIVILEGES;"

    echo ">>>> Assigned mysql user root access on all hosts."
else
    echo ">>> Mysql already installed"
fi


