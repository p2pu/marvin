# Badges

TODO: Work in progres!

This playbook will install Badges on an Ubuntu Server 12.04 x86 using [ansible](http://ansible.cc).

Usage:
* before you run this playbook, you need to setup credentials in var/credentials.yml, copy credentials.yml and rename it to credentials_(your_host).yml

The playbook sets up Badges in a virtual enviroment, configures hosting using apache and mod wsgi, 

##### TODO:
* setup DB
* setup celery

The best place to see all the moving parts is by looking in the playbook itself: install.yml.

 
