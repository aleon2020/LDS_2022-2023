#!/bin/sh
# Si no se le pasa ningún argumento como parámetro,
# convierte a mayúsculas el argumento recibido.
if [ $# -eq 0 ]; then
	while :
	do
		read -p "Inserta una palabra en minúsculas: " word
		echo $word | tr '[a-z]' '[A-Z]'
		if [ $word = 'stop' ]; then
			break
		fi
	done
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0"
	exit 1
fi
exit 0
