# Deploy LEMP Stack with Ansible Playbooks

## Introduction
This is a Wordpress LEMP Stack deployment playbook for use with Ubuntu, Debian and CentOS

## Roles Performed 

* Install Dependencies
* Install Nginx
* Install and Setup MySQL
* Enable TLS/SSL connection
* Install PHP and Setup PHP-FPM configuration
* Download, Unpacking WordPress and setup WordPress

## Variables

> To chage Playbook variable go to ```group_vars/main.yml```

> For Example
```yml
MysqlUser: "mysql"
MysqlPass: "123"
MysqlDatabase: "wordpress"
MysqlRootUser: "root"
MysqlRootPassword: "root"
BodySize: 100M
```

## Future Work
* Separate server for different roles
* High Availability Proxy or HAProxy
* Redis cluster for caching 
* Mysql Cluster
* Keepalived
* Kibana and elastic for log management
* GlusterFS for scalable network file system
