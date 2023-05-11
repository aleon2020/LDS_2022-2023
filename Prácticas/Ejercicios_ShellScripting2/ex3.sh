#!/bin/sh
# Si solo le pasamos como argumento el fichero alice_ebook.txt y un nombre,
# se sustituye la cadena 'Alice' por dicho nombre,
# y muestra cuántas veces aparece dicho nombre en el mismo.
if [ $# -eq 2 ] && [ -f "$1" ]; then
	sed -i "s/Alice/$2/g" "$1"
	count=$(grep -o -i "$2" "$1" | wc -l)
	echo "El nombre $2 aparece $count veces en el fichero"

# Si se le pasa un número incorrecto de parámetros,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 alice_ebook.txt string"
	exit 1
fi
exit 0
