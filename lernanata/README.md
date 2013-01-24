# Lernanta

This playbook will install Lernanta on an Ubuntu Server 12.04 x86 using [ansible](http://ansible.cc).

The playbook sets up Lernanta in a virtual enviroment, configures hosting using apache and mod wsgi, sets up the database in mysql and sets up celery. The best place to see all the moving parts is by looking in the playbook itself: install.yml.

## To get started follow these steps:

 1. install [ansible](http://ansible.cc/docs/gettingstarted.html) on your PC
 1. install Ubuntu Server 12.04 x86 on the remote PC
 1. install ssh: 'apt-get install ssh' on the remote PC
 1. copy your public rsa key to the server: "scp -p ~/.ssh/id_rsa.pub user@site.org:.ssh/authorized_keys"
 1. add site.org to your /etc/ansible/hosts file
 1. setup credentials in var/credentials.yml
 1. run the playbook: 'ansible-playbook install.yml --extra-vars "hosts=site.org" -K'
 1. sit back and relax :)
