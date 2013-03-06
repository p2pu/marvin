# Badges

TODO: Work in progres!

This playbook will install Badges on an Ubuntu Server 12.04 x86 using [ansible](http://ansible.cc).

The playbook sets up Badges in a virtual enviroment, configures hosting using apache and mod wsgi, sets up the database in mysql and sets up celery. The best place to see all the moving parts is by looking in the playbook itself: install.yml.

Before you run this playbook, you need to setup credentials in var/credentials.yml. You should also copy your ssl certificates to files/certificate.crt and files/p2pu.org.key.
