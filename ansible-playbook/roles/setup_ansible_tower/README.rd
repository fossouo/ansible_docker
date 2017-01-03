############### INSTALLATION OF ANSIBLE TOWER ###########
1. This role will install wget 
2. it will download Ansible Tower (last release)
3. unarchive it in /etc/ansible-tower-setup-{{version}}

################## NEXT STEPS ##########

1. Edit the file inventory locate in the folder /etc/ansible-tower-setup-{{version}}, replacing empty value with the password of your choice 

Note: Redis passwords must not contain spaces or any of the following characters: @, :, -, \, /, #

2. If you need an external database which needs installation 

[primary]
node1@example.com ansible_connection=local
[secondary]
node2@example.com
[database]
database@example.com
[all:vars]
admin_password='password'
redis_password='password'
pg_host=‘database@example.com’
pg_port=’5432’
pg_database='awx'
pg_username='awx'
pg_password='password'

3. Installation of Ansible tower using existing external database 

[primary]
node1@example.com ansible_connection=local
[secondary]
node2@example.com
[database]
[all:vars]
admin_password='password'
redis_password='password'
pg_host=‘database@example.com’
pg_port=’5432’
pg_database='awx'
pg_username='awx'
pg_password='password'
 
