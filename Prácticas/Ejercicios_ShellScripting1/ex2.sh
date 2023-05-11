#!/bin/sh
# Si se ejecuta con ningún argumento,
# imprime si estamos "Entre semana" o en "Fin de semana".
if [ $# -eq 0 ]; then
	dia=$(date +%u)
	if [ $dia -ge 1 ] && [ $dia -le 5 ]; then
		echo "Entre semana"
	elif [ $dia -eq 6 ] || [ $dia -eq 7 ]; then
		echo "Fin de semana"
	fi
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0"
	exit 1
fi
exit 0
