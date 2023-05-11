#!/bin/sh
# Si no se le pasa ninguna opción como parámetro,
# muestra información acerca del fichero ids.txt.
if [ $# -eq 0 ]; then
	echo "INFORMACIÓN DE LOS 5 USUARIOS MÁS JÓVENES"
	echo "NOMBRE\tAPELLIDO\tEDAD\tRESIDENCIA\tID"
	sort -k 3,3 ids.txt | head -n 5 | while read data; do
		col_nombre=$(echo $data | awk -F ' ' '{print $1}')
		col_apellido=$(echo $data | awk -F ' ' '{print $2}')
		col_edad=$(echo $data | awk -F ' ' '{print $3}')
		col_residencia=$(echo $data | awk -F ' ' '{print $4}')
		col_id=$(echo $data | awk -F ' ' '{print $5}')
		echo "$col_nombre\t$col_apellido\t$col_edad\t$col_residencia\t$col_id"
	done
	ciudad_popular=$(sort -k 4,4 ids.txt | awk '{print $4}' | uniq -c | sort -k 1,1r | head -n 1 | awk '{print $2}')
	num_usuarios=$(sort -k 4,4 ids.txt | awk '{print $4}' | uniq -c | sort -k 1,1r | head -n 1 | awk '{print $1}')
	echo "\n$ciudad_popular es la ciudad con más personas registradas en este sitio web, con un total de $num_usuarios usuarios."
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0"
	exit 1
fi
exit 0
