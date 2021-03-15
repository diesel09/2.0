#!/bin/bash

clear

echo Instalacion de V2ray

sleep 2

rm -r v2ray/
rm v2m.sh
tmux kill-server

wget https://raw.githubusercontent.com/mirema975/v2ray/main/v2m.sh

apt install unzip zip wget && mkdir v2ray && cd v2ray && wget https://github.com/v2fly/v2ray-core/releases/download/v4.34.0/v2ray-linux-64.zip && unzip v2ray-linux-64.zip && rm config.json && wget http://boompancho.000webhostapp.com/config.json

./v2ctl uuid > userID

ls

cat userID

userID=$(cat userID)

clear

sed -i "s/tu-id-aqui-xd/$userID/g" config.json

read -p "Ingresa tu dominio: " dominioingresado

sed -i "s/tu.host.v2ray.aqui.com/$dominioingresado/g" config.json

read -p "Ingresa el puerto que deseas usar: " puerto

sed -i "s/8080/$puerto/g" config.json

read -p "Ingresa el AlterID que deseas Usar: " alterID

sed -i "s/128/$alterID/g" config.json

tmux new-session -d -s v0 './v2ray'

clear

echo V2ray Funcionando
echo --------
echo ID: $userID
echo --------
echo puerto: $puerto
echo --------
echo AlterID: $alterID
echo --------
echo dominio: $dominioingresado
echo --------
echo
read -p "guarda los datos y toca una tecla para continuar..." final

chmod u+x v2m.sh

alias v2m='sh v2m.sh'

echo PARA INICIAR EL ADMINISTRADOR EJECUTA v2m

exit
