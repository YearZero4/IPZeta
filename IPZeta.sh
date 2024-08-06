#!/bin/bash

### GEOLOCALIZAR IP PUBLICA EN BASH ####
function IPZeta(){
chmod 777 * ; W='\033[1;37m'; G="\033[1;32m" ; w="\033[0;37m" ; clear


echo -e "$G
  _____ _____ ______    _
 |_   _|  __ \___  /   | |
   | | | |__) | / / ___| |_ __ _
   | | |  ___/ / / / _ \ __/ _\` |
  _| |_| |    / /_|  __/ || (_| |
 |_____|_|   /_____\___|\__\__,_|
 ${w} PGX - NINGUN SISTEMA ES SEGURO
"

echo -e -n "${W}-Introduzca IP >>> $G" ; read ip ; echo ""
response=$(curl -s http://ip-api.com/json/$ip)
country=$(echo $response | grep -o '"country":"[^"]*' | sed 's/"country":"//')
echo -e "$response" | sed 's/[{}"]//g' | sed 's/,/\n/g' | sed 's/Inc./Inc:/g' | while read z;do
x="${z#*:}" ; y="${z%%:*}"
if [[ "$x" != "" ]];then
echo -e "$G[*] ${W}$y $w=> ${G}$x" | grep -v 'C\.A\.'
fi
done
archivo="numbers.txt"
codigo=$(grep -i "$country" "$archivo" | awk '{print $1}')
if [[ -n "$codigo" ]]; then
echo -e "$G[*] ${W}Prefijo Telefonico $w=> ${G}$codigo"
fi



echo -e -n "\n${W}Presione ${G}[ENTER]${W} Para continuar " ; read x ; IPZeta
}
IPZeta
