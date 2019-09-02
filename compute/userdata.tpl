#!/bin/bash
yum install httpd -y
echo "Hi from ec2 ${ec2_index}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on
