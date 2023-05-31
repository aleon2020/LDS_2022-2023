#!/bin/sh
# Si se le pasa un único argumento como parámetro,
# devuelve el tipo de archivo del argumento.
if [ $# -eq 1 ]; then
	if [ -f $1 ]; then
		echo "\n$1 es un fichero regular"
		ls -l "$1"
	elif [ -d $1 ]; then
		echo "\n$1 es un directorio"
		ls -l "$1"
	else
		echo "\n$1 es otro tipo de fichero"
		ls -l "$1"
	fi
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0 [ fich | dir | etc ]"
	exit 1
fi
exit 0
