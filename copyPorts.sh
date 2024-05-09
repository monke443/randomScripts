#!/bin/bash

#Required : wl (wl-copy)
#Usage : getports file (file must be a -oG nmap capture)

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function getPorts(){
  ip="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | xargs | awk '{print $1}')"
  ports="$(cat $1 | grep -oP '\d{1,5}/' | xargs | tr -d '/' | sed 's/ /,/g' | sort -u)"
  echo -e "\n${yellowColour}[+] ${endColour}${greenColour}Scan completed on $ip ${endColour}\n${yellowColour}[+]${endColour} ${greenColour}Extracting ports ---> ${endColour}${blueColour}$ports ${endColour}" 
  wl-copy "$(echo $ports)"
  echo "\n${yellowColour}[!] ${endColour}${redColour}Ports have been copied to clipboard . . . ${endColour}\n"
}
