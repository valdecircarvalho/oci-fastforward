#!/bin/sh

#######################################
# Bash scritp to install Apache web server and deploy simple web page
# Written by Valdecir Carvalho

# OCI Fast Forward
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo yum update -y 

## Install AMP
echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo yum install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y php5 -y

echo -e "$Cyan \n Verifying installs$Color_Off"
sudo yum install apache2 libapache2-mod-php5  -y

## TWEAKS and Settings
# Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set $Color_Off"

# Restart Apache
echo -e "$Cyan \n Restarting Apache $Color_Off"
sudo systemctl start httpd
sudo systemctl enable httpd

# Configure Firewall
echo -e "$Cyan \n Configuring firewall $Color_Off"
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp --add-port=443/tcp
sudo firewall-cmd ––reload

# Deploy sample website
echo -e "$Cyan \n Deploying sample website $Color_Off"
sudo cp /home/opc/oci-fastforward/server-info.php /var/www/html/index.php
