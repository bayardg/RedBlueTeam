#!/bin/sh

sudo apt update
sudo apt install apache2
sudo cp -R site1 /var/www/
sudo cp -R site2 /var/www/
sudo chown -R root:root /var/www/site1/public
sudo chown -R root:root /var/www/site2/public
sudo chmod -R 755 /var/www
sudo htpasswd -c /var/www/.htpasswd Bob
sudo cp site1.conf /etc/apache2/sites-available/
sudo cp site2.conf /etc/apache2/sites-available/
sudo cp -R ports.conf /etc/apache2/
sudo a2enmod authz_groupfile
sudo a2ensite site1
sudo a2ensite site2
sudo a2dissite 000-default.conf
sudo service apache2 start
sudo service apache2 reload
sudo service apache2 restart
