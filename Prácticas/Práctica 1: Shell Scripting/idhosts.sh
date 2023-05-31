#!/bin/sh
# Si no recibe ningún argumento,
# imprime el número total de máquinas del fichero /etc/hosts.
if [ $# -eq 0 ]; then
	num_maquinasfichero=$(grep -E '^[0-9]+' /etc/hosts | wc -l)
	echo "Número de máquinas del fichero /etc/hosts: $num_maquinasfichero"

# Si se ejecuta con la opción -l L.X.XXX,
# imprime el número total de máquinas de ese laboratorio.
elif [ $# -eq 2 ] && [ "$1" = "-l" ]; then
	id_laboratorio=$(echo $2 | sed -e 's/[A-Z]/\L&/' | sed -e 's/\.//g')
	num_laboratorio=$(cat /etc/hosts | egrep '-' | egrep $id_laboratorio | wc -l)
	# Si recibe un identificador de laboratorio que no está en el archivo,
	# imprime un mensaje de error y termina con el código de estatus apropiado.
	if [ $num_laboratorio -eq 0 ]; then
		echo "error: unknown lab"
		exit 1
	else
		echo "$2 has $num_laboratorio hosts"
	fi

# Si se ejecuta con la opción -l L.X.XXX -n,
# imprime el número de máquina de todos los PCs de ese laboratorio.
elif [ $# -eq 3 ] && [ "$1" = "-l" ] && [ "$3" = "-n" ]; then
	id_laboratorio=$(echo $2 | sed -e 's/[A-Z]/\L&/' | sed -e 's/\.//g')
	num_laboratorio=$(cat /etc/hosts | egrep '-' | egrep $id_laboratorio | wc -l)
	# Si recibe un identificador de laboratorio que no está en el archivo,
	# imprime un mensaje de error y termina con el código de estatus apropiado.
	if [ $num_laboratorio -eq 0 ]; then
		echo "error: unknown lab"
		exit 1
	else
		num_pcs=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $3 }' | sed -E 's/f\-l(.+)\-//g' | tr '\n' ' ')
		echo "$2: $num_pcs"
	fi

# Si se ejecuta con cualquier otra opción,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 [ -l ] L.X.XXX [ -n ]"
	exit 1
fi
exit 0
