marvin
======

<img src="http://www.deviantart.com/download/84301828/Marvin_the_Martian_by_EJJS.jpg" />

Marvin helps us to manage the services that we use at P2PU using [ansible](http://ansible.cc/).

The typical process of using a playbook is as follows:
 
1. install [ansible](http://ansible.cc/docs/gettingstarted.html)
1. install Ubuntu Server 12.04 x86 on a remote host or virtual machine
1. install ssh: 'apt-get install ssh' on the remote host
1. copy your public rsa key to the remote host: "scp -p ~/.ssh/id_rsa.pub user@host.org:.ssh/authorized_keys"
1. add host.org to your /etc/ansible/hosts file
1. run the playbook: 'ansible-playbook install.yml --extra-vars "hosts=host.org" -K'
1. sit back and relax :)

Typically you will need to do other things like provide credentials and pass other variables to ansible-playbook. See the subdirectories for more details and instructions.
