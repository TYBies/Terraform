#!/bin/bash
yum update -y

# Install and configure PHP 7.4
amazon-linux-extras enable php7.4
yum clean metadata
yum remove -y php*
yum install -y httpd php php-cli php-mysqlnd php-json php-gd php-mbstring php-xml php-fpm php-opcache mysql

systemctl start httpd
systemctl enable httpd

# Mount EBS volume
mkfs -t ext4 /dev/xvdf
mkdir -p /var/www/html
mount /dev/xvdf /var/www/html

# Install WordPress directly in /var/www/html
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .    # Move files to current directory
rm -rf wordpress    # Remove empty wordpress directory
rm -f latest.tar.gz # Remove the tarball
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html