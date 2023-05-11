#!/bin/sh
# Si no se le pasa ningún argumento como parámetro,
# imprime por pantalla la información del fichero cars.txt
# ordenada por precio y marca y la marca y el modelo más caro.
if [ $# -eq 0 ]; then
	cat cars.txt | sort -k5,5n -k1,1 > cars_sorted.txt
	echo "Contenido del fichero ordenado por precio y marca:"
	cat cars_sorted.txt
	mas_caro=$(tail -n 1 cars_sorted.txt | awk '{print $1" "$2}')
	echo "Coche más caro: $mas_caro"

# Si se le pasa cualquier cosa como parámetro (nº parámetros != 0),
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0"
	exit 1
fi
exit 0
