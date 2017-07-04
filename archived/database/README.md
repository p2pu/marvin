## load-db-dump.yml
 
Copy an existing database to $hosts and imports it to the database.

The database needs to be compressed with bzip2.

The following extra variables needs to be passed as extra variable when running ansible-playbook:
 - hosts : the 
 - db_dump_path : the path to the database dump that is compressed using bzip2
 
You need to put db_name, db_user and db_password in vars/credentials.yml
