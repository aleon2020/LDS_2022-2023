#!/bin/sh
# Si se ejecuta con ningún argumento, imprime por pantalla "¡Hola username!".
if [ $# -eq 0 ]; then
	username=$(whoami)
	echo "¡Hola $username!"
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0"
	exit 1
fi
exit 0
