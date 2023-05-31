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
		echo "\nLab: $2"
		echo "\nTotal hosts: $num_laboratorio"
		first_hostpc=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $3 }' | head -n 1)
		first_hostip=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $1 }' | head -n 1)
		echo "\nFirst host: $first_hostpc | $first_hostip"
		last_hostpc=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $3 }' | tail -n 1)
		last_hostip=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $1 }' | tail -n 1)
		echo "\nLast host: $last_hostpc | $last_hostip\n"
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
        	echo "\nLab: $2"
		columna_idpc=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $3 }' | sed -E 's/f\-l(.+)\-//g')
		columna_ip=$(grep -E "$id_laboratorio" /etc/hosts | awk '{ print $1 }')
		columna_subdomain=$(grep -E "$id_laboratorio" /etc/hosts | awk '{print $2 }' | cut -d. -f2-)
		echo "\nID PC\t\tIP\t\t\tSubdomain"
		echo "---------\t--------------\t\t---------------------------"
		grep -v '#' /etc/hosts | grep "$id_laboratorio" | while read data; do
			columna_idpc=$(echo $data | awk '{ print $3 }' | sed -E 's/f\-l(.+)\-//g')
                	columna_ip=$(echo $data | awk '{ print $1 }')
                	columna_subdomain=$(echo $data | awk '{print $2 }' | cut -d. -f2-)
			echo "$columna_idpc\t\t$columna_ip\t\t$columna_subdomain"
		done
		echo "\nTotal hosts: $num_laboratorio\n"
	fi

# Si se ejecuta con cualquier otra opción,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
        echo "usage: $0 [ -l ] L.X.XXX [ -n ]"
        exit 1
fi
exit 0
