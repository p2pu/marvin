ehterpad-lite
=============

This playbook will install Etherpad Lite on an Ubuntu Server 12.04 x86 using [ansible](http://ansible.cc).

Etherpad Lite is hosted by Node.js and data is stored in a mysql database. Nginx forwards incoming http traffic to Node.js.

To get started follow these steps:

## On your local host:
 1. install [ansible](http://ansible.cc/docs/gettingstarted.html)

## On a remote machine/virtual host:
 1. install Ubuntu Server 12.04 x86.
 1. install ssh: 'apt-get install ssh'
 1. copy your public rsa key to the server: "scp -p ~/.ssh/id_rsa.pub user@192.168.1.6:.ssh/authorized_keys"
 1. run the playbook: 'ansible-playbook etherpad-lite.yml --extra-vars "hosts=192.168.1.6" -K'
 1. sit back and relax :)
