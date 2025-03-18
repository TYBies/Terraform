#!/bin/bash
yum update -y
yum install -y httpd php php-mysqlnd mysql
systemctl start httpd
systemctl enable httpd

# Mount EBS volume
mkfs -t ext4 /dev/xvdf
mkdir /var/www/html/wordpress
mount /dev/xvdf /var/www/html/wordpress

# Install WordPress
cd /var/www/html/wordpress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz
chown -R apache:apache /var/www/html/wordpress