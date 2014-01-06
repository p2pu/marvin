marvin
======

![Marvin](http://info.p2pu.org/wp-content/uploads/2013/06/3356358479_a0e3ee8a05_b.jpg)
Image CC-BY-SA [John Greenaway](http://www.flickr.com/photos/johngreenaway/)

Marvin helps us to manage the services that we use at P2PU using [ansible](http://ansible.cc/).

The typical process of using a playbook is as follows:
 
1. install [ansible](http://ansible.cc/docs/gettingstarted.html)
1. install Ubuntu Server 12.04 x86 on a remote host or virtual machine
1. install ssh: 'apt-get install ssh' on the remote host
1. copy your public rsa key to the remote host: "ssh-copy-id -i ~/.ssh/id_rsa.pub user@host.org"
1. add host.org to your /etc/ansible/hosts file
1. run the playbook: 'ansible-playbook install.yml --extra-vars "hosts=host.org" -K'
1. sit back and relax :)

Typically you will need to do other things like provide credentials and pass other variables to ansible-playbook. See the subdirectories for more details and instructions.
