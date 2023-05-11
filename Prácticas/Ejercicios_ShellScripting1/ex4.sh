#!/bin/sh
# Si se ejecuta con al menos un argumento como parámetro,
# imprime el tipo de archivo de cada uno de los argumentos.
if [ $# -ne 0 ]; then
	for i in $@; do
		if [ -f $i ]; then
			echo "\n$i es un fichero regular"
			ls -l "$i"
		elif [ -d $i ]; then
			echo "\n$i es un directorio"
			ls -l "$i"
		else
			echo "\n$i es otro tipo de fichero"
			ls -l "$i"
		fi
	done
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0 [ fich1 | dir1 | etc1 ] ... [ fichN | dirN | etcN ]"
	exit 1
fi
exit 0
