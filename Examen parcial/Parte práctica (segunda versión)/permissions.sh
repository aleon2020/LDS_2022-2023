#!/bin/sh
# Si no se le pasa ninguna opción como parámetro,
# imprime una lista de TODOS los archivos regulares del directorio actual
# o subdirectorios (búsqueda recursiva).
if [ $# -eq 0 ]; then
	find . -type f -exec ls -l {} +
# Si se le pasa la opción -x seguida de una letra,
# da permisos de ejecución a todos los archivos que empiecen por esa letra.
elif [ $# -eq 2 ] && [ $1 = '+r' ]; then
 	letra=$2
	find . -name "${letra}*.txt" -type f -exec chmod u+x {} +
# Si se le pasa una opción incorrecta como parámetro,
# devuelve un mensaje de uso por la salida de error.
else
	echo "usage: $0 [ -a ] [ letter ]"
	exit 1
fi
exit 0
