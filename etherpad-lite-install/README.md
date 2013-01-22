ehterpad-lite
=============

This playbook will install Etherpad Lite on an Ubuntu Server 12.04 x86.

To get started:
 - install Ubuntu Server 12.04 x86.
 - install ssh: 'apt-get install ssh'
 - copy your public rsa key to the server: "scp -p ~/.ssh/id_rsa.pub user@192.168.1.6:.ssh/authorized_keys"
 - run the playbook: 'ansible-playbook etherpad-lite.yml --extra-vars "hosts=192.168.1.6" -K'
 - sit back and relax :)
