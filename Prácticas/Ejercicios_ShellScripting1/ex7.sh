#!/bin/sh
# Si se ejecuta con al menos un argumento como parámetro,
# concede permisos de ejecución a cada uno de los argumentos.
if [ $# -ne 0 ]; then
        for i in $@; do
                if [ -e $i ]; then
			if [ -x $i ]; then
				echo "El fichero $i ya cuenta con permisos de ejecución"
			else
                        	chmod +x $i
                        	echo "Permisos de ejecución concedidos a $i"
			fi
                else
                        echo "El fichero $i no existe"
                fi
        done
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
        echo "usage: $0 [ fich1 ] ... [ fichN ]"
        exit 1
fi
exit 0
