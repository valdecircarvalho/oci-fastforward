#!/usr/bin/bash

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

clear

# Initializing apache deploy
echo -e "$Purple \n Initializing Apache deploy... $Color_Off"

## Install Apache
echo -e "$Cyan \n Installing Apache Server... $Color_Off"
sudo yum install httpd php -y 2>&1 >deployapache.log

# Restart Apache
echo -e "$Cyan \n Restarting Apache Server... $Color_Off"
sudo systemctl start httpd 2>&1 >deployapache.log
sudo systemctl enable httpd 2>&1 >deployapache.log

# Deploy sample website
echo -e "$Cyan \n Deploying sample website... $Color_Off"
sudo cp /home/opc/oci-fastforward/server-info.php /var/www/html/index.php 2>&1 >deployapache.log

clear 2>&1 >deployapache.log
sleep 5 2>&1 >deployapache.log

# Deploy finalizado
echo -e "$Yellow \n Deploy finished. $Color_Off"