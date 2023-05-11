#!/bin/sh
# Si se le pasa un argumento como parámetro y es un directorio,
# muestra información de los ficheros de ese directorio.
if [ $# -eq 1 ] && [ -d $1 ]; then
	echo "PERMISOS\tUSUARIO\t\tGRUPO\tTAMAÑO\tFECHA Y HORA\tNOMBRE"
	ls -l $1 | tail -n+2 | grep -E '^-' | while read data; do
		col_permisos=$(echo $data | awk '{print $1}')
		col_usuario=$(echo $data | awk '{print $3}')
		col_grupo=$(echo $data | awk '{print $4}')
		col_size=$(echo $data | awk '{print $5}')
		col_fechayhora=$(echo $data | awk '{print $6" "$7" "$8}')
		col_nombre=$(echo $data | awk '{print $9}')
		echo "$col_permisos\t$col_usuario\t$col_grupo\t$col_size\t$col_fechayhora\t$col_nombre"
	done
	total_size=$(ls -l $1 | grep -E '^-' | awk '{sum+=$5} END {print sum}')
	echo "\nTAMAÑO TOTAL: $total_size"
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0 [ dir ]"
	exit 1
fi
exit 0
