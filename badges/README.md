# Badges

TODO: Work in progres!

This playbook will install Badges on an Ubuntu Server 12.04 x86 using [ansible](http://ansible.cc).

For development purposes a Vagrant box can be used. 
Usage:
* install [vagrant](http://docs.vagrantup.com/v1/docs/getting-started/index.html)
* from marvin/badges run vagrant init (the box is provided if it does not exist already)
* before you run this playbook, you need to setup credentials in var/credentials.yml, copy credentials.yml and rename it to credentials_(your_host).yml
* you should also copy your ssl certificates to files/certificate.crt and files/p2pu.org.key

The playbook sets up Badges in a virtual enviroment, configures hosting using apache and mod wsgi, 

##### TODO:
* setup DB
* setup celery
* setup credentials

The best place to see all the moving parts is by looking in the playbook itself: install.yml.

 
