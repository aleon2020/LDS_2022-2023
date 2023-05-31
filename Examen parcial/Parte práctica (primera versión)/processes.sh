#!/bin/sh
# Si no se le pasa ninguna opción como parámetro,
# muestra por pantalla los 10 procesos con mayor porcentaje de CPU,
# además de indicar el número de procesos que lleva el usuario actual.
if [ $# -eq 0 ]; then
	top10Procesos=$(ps aux | grep -E '[0-9]' | sort -k3,3r | head -n 10)
	usuario=$(whoami)
	echo "10 PROCESOS QUE MÁS CPU CONSUMEN"
	echo "$top10Procesos"
	procesosUsuario=$(ps aux | grep -E '[0-9]' | sort -k3,3r | head -n 10 | awk '{print $1}' | grep -c $usuario)
	echo "\nEl usuario $usuario es propietario de $procesosUsuario de los 10 procesos que consumen más CPU actualmente"
# Si se le pasa una opción incorrecta como parámetro,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0"
	exit 1
fi
exit 0
