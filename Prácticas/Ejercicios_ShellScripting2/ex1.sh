#!/bin/sh
comparacion=$(diff $1 $2 | head -n 1 | awk -F, '{print $1}' | sed -E 's/[0-9]+//g')
# Caso 1: Se ha producido una inserción
if [ $# -eq 2 ] && [ $comparacion = 'a' ]; then
	echo "Se ha producido una inserción"

# Caso 2: Se ha producido una modificación
elif [ $# -eq 2 ] && [ $comparacion = 'c' ]; then
	echo "Se ha producido una modificación"

# Caso 3: Se ha producido una eliminación
elif [ $# -eq 2 ] && [ $comparacion = 'd' ]; then
	echo "Se ha producido una eliminación"

# Si no se le pasan dos ficheros como parámetro,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 fich1 fich2"
	exit 1
fi
exit 0
