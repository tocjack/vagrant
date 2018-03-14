# Lightweight Vagrant Script
This simple script is use to boot vagrant which is a tool for building and managing virtual machine environments in a single workflow. About the vagrant, please read the more details at [vagrant intro](https://www.vagrantup.com/intro/index.html).

## Installation

```
git clone https://github.com/tocjack/vagrant.git
cp -R vagrant root_path_your_project
```

## Configuration

```
cd root_path_your_project/vagrant
vim config.json
```

Once you open the config.json, you will see following json:

```
{
    "ip": "172.16.6.6",
    "memory": 2048,
    "cpus": 2,
    "box": "ubuntu/xenial64",
    "name": "cjvagrant",
    "provider": "virtualbox",
    "authorize": "~/.ssh/id_rsa.pub",
    "keys": [
        "~/.ssh/id_rsa"
    ],
    /**
     * public fold within your project root path on the host machine
     * will map to /var/www/public within the guest machine.
     * Use options to specify the owner, group and write permission of the shared fold in guest machine.
     */
    "folders": [
        {
            "map": "./public",
            "to": "/var/www/public",
            "options": {
                 "owner": "ubuntu",
                 "group": "www-data",
                 "mount_options": [
                     "dmode=775",
                     "fmode=774"
                 ]
            }
        }
    ],
    /**
     * Set the virutal host and root directory for the site
     */
    "sites": [
        {
            "map": "cjvagrant.me",
            "to": "/var/www/public"
        }
    ],
    /**
     * Install the nginx, php7, mysql, redis in the guest machine.
     * If you want to install other dependencies, please put a bash script in the provision fold. 
     * Then add the script file name in the provisions list.
     */
    "provisions": [
        "install-nginx",
        "install-php7",
        "install-mysql",
        "install-redis"
    ]
}
```

