#!/bin/bash

#ManagerV2Ray

clear

echo ----------------------------
echo ---ADMINISTRADOR DE V2RAY---
echo ----------------------------
echo 1- Crear un nuevo acceso
echo 2- Modificar el Host
echo 3- Ver Configuracion Actual
echo 4- Detener Servicio V2ray
echo 5- Iniciar Servicio V2ray
echo 6- Eliminar ID
echo 7- Salir
echo ----------------------------  
echo EN CASO DE EQUIVOCARSE, SALIR DEL SCRIPT CON CTRL + c 
echo ----------------------------
echo 
read -p "Seleccionar una opción: " opcion

if [ $opcion = 1 ]; then

    cd v2ray/

    ./v2ctl uuid > userID

    ls

    cat userID

    userID=$(cat userID)

    clear

    sed -i '9a\            { "id": "tu-id-aqui-xd", "alterId":aID, "level":1 }\' config.json

    sed -i '10s/$/,/' config.json

    sed -i "s/tu-id-aqui-xd/$userID/g" config.json

    read -p "Introduce un AlterID: " altID

    sed -i "s/aID/$altID/g" config.json

    echo -------
    echo ID: $userID
    echo -------
    echo AlterID: $altID
    echo -------

    read -p "Presiona una tecla para continuar..." tend

    cd

    sh v2m.sh

fi

if [ $opcion = 2 ]; then

    clear

    echo Tu Host actual es:
    echo
    sed '/host/!d' v2ray/config.json

    read -p "INTRODUCE EL HOST ACTUAL: " hostact

    sed -i "s/$hostact/acaelhost/g" v2ray/config.json

    read -p "INTRODUCE EL NUEVO HOST: " newhost

    sed -i "s/acaelhost/$newhost/g" v2ray/config.json

    clear

    echo ---------------------------
    echo HOST CAMBIADO CORRECTAMENTE
    echo ---------------------------
    echo NUEVO HOST $newhost
    echo ---------------------------

    read -p "PRESIONA UNA TECLA PARA CONTINUAR..." tend

    clear

    sh v2m.sh

fi

if [ $opcion = 3 ]; then

    sed '/id/!d' v2ray/config.json

    sed '/host/!d' v2ray/config.json

    echo
    
    read -p "PRESIONA UNA TECLA PARA CONTINUAR..." t

    sh v2m.sh

fi

if [ $opcion = 4 ]; then

    clear

    tmux kill-server

    clear

    echo SERVICIO V2RAY DETENIDO

    sleep 2

    sh v2m.sh

fi

if [ $opcion = 5 ]; then

    clear

    cd

    cd v2ray/ && tmux new-session -d -s v0 './v2ray' && cd

    echo SERVICIO V2RAY INICIADO

    sleep 2

    sh v2m.sh

fi

if [ $opcion = 6 ]; then

    clear

    read -p "INTRODUZCA EL ID QUE DESEA ELIMINAR: " iddel

    cd v2ray/

    sed -i "/$iddel/d" ./config.json

    cd

    sh v2m.sh

fi

if [ $opcion = 7 ]; then

exit

fi

exit
