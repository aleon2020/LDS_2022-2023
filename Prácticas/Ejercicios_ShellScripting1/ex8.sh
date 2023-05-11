#!/bin/sh
# Si se ejecuta con al menos un argumento como parámetro,
# traduce a mayúsculas cada uno de los argumentos.
if [ $# -ne 0 ]; then
	for i in $@; do
		echo "$i" | tr '[a-z]' '[A-Z]'
	done
# Si se ejecuta con un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0 [ word1 ] ... [ wordN ]"
	exit 1
fi
exit 0
