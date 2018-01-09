marvin
======

![Marvin](http://info.p2pu.org/wp-content/uploads/2013/06/3356358479_a0e3ee8a05_b.jpg)
Image CC-BY-SA [John Greenaway](http://www.flickr.com/photos/johngreenaway/)

Marvin manages the servers we use at P2PU using [Ansible](http://ansible.cc/).

To use the Ansible playbooks, you need to 

1. [install ansible](http://ansible.cc/docs/gettingstarted.html) on your local host.
1. setup credentials (copy files from AWS S3 to ./host_vars and ./vars
1. setup access to the remote hosts: copy your public key to the remote host: `ssh-copy-id -i ~/.ssh/id_rsa.pub user@host.org`
1. put the vault password in ~/.vault_pass.txt on your local host
1. run the relevant playbook: `ansible-playbook -v --vault-password-file=~/.vault_pass.txt -i inventory.ini learningcircles.yml`

Currently there are 3 different plays to run:

1. learningcircles.yml - that installs learning circles
1. discourse.yml - that sets up discourse
1. etherpad.yml - that sets up etherpad lite

