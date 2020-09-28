marvin
======

![Marvin](http://info.p2pu.org/wp-content/uploads/2013/06/3356358479_a0e3ee8a05_b.jpg)
Image CC-BY-SA [John Greenaway](http://www.flickr.com/photos/johngreenaway/)

Marvin manages our servers using [ansible](http://ansible.cc/).

To use the Ansible playbooks, you need to 

1. [install ansible](http://ansible.cc/docs/gettingstarted.html) on your local host.
1. clone this repo
1. setup credentials (copy files from AWS S3 to ./host_vars and ./vars `aws s3 sync s3://sysadmin/marvin/host_vars/ host_vars/ && aws s3 sync s3://sysadmin/marvin/vars/ vars/`. You'll need the AWS CLI installed and the correct credentials set up.
1. setup access to the remote hosts: copy your public key to the remote host: `ssh-copy-id -i ~/.ssh/id_rsa.pub user@host.org`
1. put the vault password in ~/.vault_pass.txt on your local host
1. run the relevant playbook: `ansible-playbook -v --vault-password-file=~/.vault_pass.txt -i inventory.ini learningcircles.yml`

Here are the different plays:

1. learningcircles.yml - learningcircles.p2pu.org
1. staging-learningcircles.yml - staging-learningcircles.p2pu.org
1. community.yml - community.p2pu.org
1. discourse.yml - discourse.p2pu.org
1. etherpad.yml - etherpad.p2pu.org
1. lernanta.yml - courses.p2pu.org (legacy)
