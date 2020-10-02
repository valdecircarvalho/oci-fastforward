#!/usr/bin/bash

#######################################
# Bash scritp to setup OCI Instance
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


# Starting
echo -e "$Yellow \n Starting V7... $Color_Off"

# System Update
echo -e "$Purple \n Initializing System Updates... $Color_Off"

sudo yum update -y 2>&1 >> setup.log

# Disable Firewall
echo -e "$Purple \n Initializing System Setup... $Color_Off"
sudo systemctl stop firewalld 2>&1 >> setup.log
sudo systemctl disable firewalld 2>&1 >> setup.log
sudo systemctl mask firewalld 2>&1 >> setup.log

# Install Tools
echo -e "$Purple \n Initializing Tools Instalation... $Color_Off"
sudo yum install git -y  2>&1 >> setup.log
cd /home/opc 2>&1 >> setup.log
git clone https://github.com/valdecircarvalho/oci-fastforward.git 2>&1 >> setup.log
sleep 5
cd oci-fastforward
sudo chmod +x *.sh
sudo sed -i -e 's/\r$//' /home/opc/oci-fastforward/*.sh
clear

# Finishing
echo -e "$Yellow \n Finishing... $Color_Off"
