This playbook sets up a docker host server and deploy several applications to it

You can run it using

    ansible-playbook site.yml --vault-password-file /path/to/vault.txt -i inventory.ini

TODO - Setup a new user with SSH access and part of the sudo group. Then disable root login (when using digital ocean)
