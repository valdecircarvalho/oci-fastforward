#!/usr/bin/bash

#######################################
# Bash scritp to config OCI tennant
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
echo -e "$Yellow \n Starting V6... $Color_Off"
echo -e "$Yellow \n Exporting OCI Variables... $Color_Off"

export COMPART=ocid1.compartment.oc1..aaaaaaaaumwqniwn3mvy2vbjpogbrnxizznd4kxsb3cb5ftqm55bhlslkkla
export TENANT=ocid1.tenancy.oc1..aaaaaaaa7dygf3b3qurvjb4eoueh63ogv6fzav3653ivy6zgdzpycunmprkq