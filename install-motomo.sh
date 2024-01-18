#!/usr/bin/env bash

sudo apt-get install php php-curl php-gd php-cli mysql-server php-mysql php-xml php-mbstring

mysql
CREATE DATABASE matomo_db_name_here;
CREATE USER 'matomo'@'localhost' IDENTIFIED BY 'my-strong-password-here';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, INDEX, DROP, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON matomo_db_name_here.* TO 'matomo'@'localhost';
GRANT FILE ON *.* TO 'matomo'@'localhost';
exit

cd /var/www/html
wget https://builds.matomo.org/matomo.zip && unzip matomo.zip
rm matomo.zip
sudo chown -R www-data:www-data /var/www/html/matomo/

