#!/bin/bash  
   
# Bash script to install an LAMP+WP stack in ubuntu  
   
# Update system  
 sudo apt-get update -y  
   
## Install APache  
 sudo apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y  
   
## Install PHP  
 apt-get install php libapache2-mod-php php-mysql -y  
   
# Install MySQL database server  
 export DEBIAN_FRONTEND="noninteractive"  
 debconf-set-selections <<< "mysql-server mysql-server/root_password password $db_root_password"  
 debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $db_root_password"  
 apt-get install mysql-server -y  
   
# Enabling Mod Rewrite  
 sudo a2enmod rewrite  

# Install WordPress
# Download archive
 wget -c http://wordpress.org/latest.tar.gz

# Unpack archive
 tar -xzvf latest.tar.gz

# Copy files to /var/www/html/:
 sudo rsync -av wordpress/* /var/www/html/

# Set Permissions  
 sudo chown -R www-data:www-data /var/www/html/
 sudo chmod -R 755 /var/www/html/  
 sudo rm /var/www/html/index.html

# Restart Apache  
 sudo service apache2 restart

# Create DB mysql
 sudo mysql -u root -p

# Input servises
php -v
apache2 -v
mysql -v

# End


