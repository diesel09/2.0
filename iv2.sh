#!/bin/bash

clear

echo Instalacion de V2ray By @RAGNAROKVPS

sleep 2
echo
echo DESEA REALIZAR UNA INSTALACION LIMPIA O DESEA CONSERVAR CONFIGURACION GUARDADA?
echo
echo 1- Instalacion Limpia
echo 2- Conservar configuracion Guardada
echo
read -p "Ingrese el tipo de instalacion que desea: " tinst

if [ $tinst = 1 ]; then
    cd
    rm -r v2ray/
    rm v2m.sh
    tmux kill-session -t v0
    mkdir v2ray
    apt install unzip zip wget tmux -y; cd v2ray/ && wget https://github.com/v2fly/v2ray-core/releases/download/v4.34.0/v2ray-linux-64.zip && unzip v2ray-linux-64.zip && rm config.json && wget http://boompancho.000webhostapp.com/config.json

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
clear
elif [ $tinst = 2 ]; then
    cd
    mv v2ray/config.json config.json.b
    rm -r v2ray/
    rm v2m.sh
    tmux kill-session -t v0
    mkdir v2ray
    apt install unzip zip wget tmux -y; cd v2ray/; wget https://github.com/v2fly/v2ray-core/releases/download/v4.34.0/v2ray-linux-64.zip; unzip v2ray-linux-64.zip; rm config.json; cd; mv config.json.b v2ray/config.json; cd
else
    echo Opcion no Valida, introduzca 1 o 2

    sh iv2.sh
fi
cd

wget wget https://raw.githubusercontent.com/diesel09/2.0/main/v2m2.sh

cd v2ray/

tmux new-session -d -s v0 './v2ray'

cd

echo V2ray Funcionando

read -p "toca una tecla para continuar..." final

sed -i '/alias v2m="sh v2m2.sh"/d' ~/.bashrc
sed -i "/PARA INICIAR ADMINISTRADOR V2RAY ESCRIBA:  v2m2/d" ~/.bashrc
echo 'alias v2m="sh v2m2.sh"' >> ~/.bashrc
echo 'echo -e "\033[97m   PARA INICIAR ADMINISTRADOR V2RAY ESCRIBA:  v2m "' >> ~/.bashrc

read -p "guarda los datos y toca una tecla para continuar..." final

exit
