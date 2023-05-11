#!/bin/sh
# Si se ejecuta sin ninguna opción,
# imprime el fichero de mayor tamaño del directorio actual (sin búsqueda recursiva).
if [ $# -eq 0 ]; then
	mayor_sr=$(ls -l | grep "^-" | awk '{ print $5 " " $9 }' | sort -rn | head -n1 | awk '{ print $2 }')
	echo "Archivo más grande del directorio actual (sin recursión): $mayor_sr"

# Si se ejecuta con la opción -s,
# imprime el fichero de menor tamaño del directorio actual (sin búsqueda recursiva).
elif [ $# -eq 1 ] && [ "$1" = "-s" ]; then
	menor_sr=$(ls -l | grep "^-" | awk '{ print $5 " " $9 }' | sort -rn | tail -n1 | awk '{ print $2 }')
	echo "Archivo más pequeño del directorio actual (sin recursión): $menor_sr"

# Si se ejecuta con la opción -r, 
# imprime el fichero de mayor tamaño del directorio actual (con búsqueda recursiva).
elif [ $# -eq 1 ] && [ "$1" = "-r" ]; then
	mayor_cr=$(ls -lR | grep "^-" | awk '{ print $5 " " $9 }' | sort -rn | head -n1 | awk '{ print $2 }')
	echo "Archivo más grande del directorio actual (con recursión): $mayor_cr"

# Si se ejecuta con las opciones -r -s,
# imprime el fichero de menor tamaño del directorio actual (con búsqueda recursiva).
elif [ $# -eq 2 ] && [ "$1" = "-r" ] && [ "$2" = "-s" ]; then
	menor_cr=$(ls -lR | grep "^-" | awk '{ print $5 " " $9 }' | sort -rn | tail -n1 | awk '{ print $2 }')
	echo "Archivo más pequeño del directorio actual (con recursión): $menor_cr"

# Si se ejecuta con cualquier otra opción,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 [ -s | -r | -r -s ]"
	exit 1
fi
exit 0
