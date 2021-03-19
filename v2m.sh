#!/bin/bash

#ManagerV2Ray

clear

echo -----------------------------
echo ---ADMINISTRADOR DE V2RAY----
echo ---CREADO POR @RAGNAROKVPS---
echo -----------------------------
echo 1- Crear un nuevo acceso
echo 2- Modificar el Host
echo 3- Ver Configuracion Actual
echo 4- Detener Servicio V2ray
echo 5- Iniciar Servicio V2ray
echo 6- Eliminar ID
echo 7- Agregar ID especifico
echo 8- Cambiar Puerto
echo 9- Comprobar Estado de V2ray
echo 10- Arreglar ID
echo 11- Reiniciar V2Ray
echo 0- Salir
echo -----------------------------
echo EN CASO DE EQUIVOCARSE, SALIR DEL SCRIPT CON CTRL + c 
echo -----------------------------
echo 
read -p "Seleccionar una opción: " opcion

if [ $opcion = 1 ]; then
    cd
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
    cd
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
    cd
    sh v2m.sh
fi

if [ $opcion = 3 ]; then
    cd
    sed '/id/!d' v2ray/config.json
    sed '/host/!d' v2ray/config.json
    sed '/port/!d' v2ray/config.json
    sed '/patch/!d' v2ray/config.json
    sed '/protocol/!d' v2ray/config.json
    echo
    read -p "PRESIONA UNA TECLA PARA CONTINUAR..." t
    sh v2m.sh
fi

if [ $opcion = 4 ]; then
    clear
    tmux kill-session -t v0
    clear
    echo SERVICIO V2RAY DETENIDO
    sleep 2
    cd 
    sh v2m.sh
fi

if [ $opcion = 5 ]; then
    clear
    cd
    cd v2ray/ && tmux new-session -d -s v0 './v2ray' && cd
    echo SERVICIO V2RAY INICIADO
    sleep 2
    cd
    sh v2m.sh
fi

if [ $opcion = 6 ]; then
    clear
    echo ¡IMPORTANTE! NO ELIMINAR EL ID GENERADO EN LA INSTALACION
    echo
    echo LO IDENTIFICAS PORQUE NO TIENE UNA COMA AL FINAL DE LA LINEA
    echo
    echo A CONTINUACION TENDRAS UNA LISTA CON LOS ID EXISTENTES
    sleep 5
    cd
    sed '/id/!d' v2ray/config.json
    read -p "INTRODUZCA EL ID QUE DESEA ELIMINAR: " iddel
    cd v2ray/
    sed -i "/$iddel/d" ./config.json
    cd
    sh v2m.sh
fi

if [ $opcion = 7 ]; then
    clear
    cd
    cd v2ray/
    read -p "INTRODUCE EL NUEVO ID: " idcustom
    sed -i '9a\            { "id": "tu-id-aqui-xd", "alterId":aID, "level":1 }\' config.json
    sed -i '10s/$/,/' config.json
    sed -i "s/tu-id-aqui-xd/$idcustom/g" config.json
    read -p "Introduce un AlterID del 1 al 1000: " altID
    sed -i "s/aID/$altID/g" config.json
    echo -------
    echo ID: $idcustom
    echo -------
    echo AlterID: $altID
    echo -------
    read -p "Presiona una tecla para continuar..." tend
    cd
    sh v2m.sh
fi

if [ $opcion = 8 ]; then
    clear
    cd
    read -p "INTRODUZCA EL NUEVO PUERTO: " puerto
    cd v2ray/
    sed -i '/port/d' ./config.json
    sed -i "5a\      \"port\": $puerto," ./config.json
    cd
    sh v2m.sh
fi

if [ $opcion = 9 ]; then
    cd
    cd v2ray/
    tmux ls > statustmux
    sed -i 's/: 1.*//' statustmux
    cat statustmux
    ls
    statmux=$(cat statustmux)
    if [ $statmux = v0 ]; then
    clear
    echo V2Ray ENCENDIDO
    sleep 4
    cd
    sh v2m.sh
    else
    clear
    echo V2Ray APAGADO
    sleep 4
    cd
    sh v2m.sh
    fi
fi

if [ $opcion = 10 ]; then
    cd
    sed '/id/!d' v2ray/config.json
    echo
    read -p "INTRODUZCA EL ULTIMO DE LA LISTA (SI APARECEN VARIOS) O EL UNICO ALTERID: " rid
    sed -i "s/$rid, \"level\":1 },/$rid, \"level\":1 }/g" v2ray/config.json
    cd
    sh v2m.sh
fi

if [ $opcion = 11 ]; then
    clear
    echo REINICIANDO V2RAY
    tmux kill-session -t v0
    cd
    cd v2ray/
    tmux new-session -d -s v0 './v2ray'
    cd
    echo ------------
    sleep 3
    echo V2RAY ENCENDIDO
    sleep 3
    sh v2m.sh
fi

if [ $opcion = 0 ]; then
    exit
fi

exit
