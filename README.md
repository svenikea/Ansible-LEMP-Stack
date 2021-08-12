# Deploy LEMP Stack with Ansible 

## Introduction
This is a Wordpress LEMP Stack deployment script for use with Ubuntu, Debian and CentOS

## Action Performed 

* Install Nginx, MySQL, PHP, Wordpress and its necessary dependencies 
* Enable TLS/SSL connection
* Setup new MySQL, PHP-FPM configuration
* Download and unpacking Wordpress to ```/var/www/html```

## Variables

> To chage the way ansible run and setup WordPress use the following variable 

```yml
MysqlUser: "mysql"
MysqlPass: "123"
MysqlDatabase: "wordpress"
MysqlRootUser: "root"
MysqlRootPassword: "root"
BodySize: 100M
```
