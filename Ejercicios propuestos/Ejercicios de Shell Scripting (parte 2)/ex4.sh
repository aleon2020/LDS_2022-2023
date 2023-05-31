#!/bin/sh
# Si solo se le pasa como parámetro el fichero alice_ebook.txt,
# imprime por pantalla todas las líneas que empiezan por 'Alice'.
# Además, solo debe quedarse con el fragmento de esa línea hasta el primer punto.
if [ $# -eq 1 ] && [ -f "$1" ]; then
	grep "^Alice" "$1" | while read -r line; do
		echo "$line" | sed 's/\([^\.]*\).*/\1/'
	done

# Si se le pasa un número incorrecto de parámetros,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 alice_ebook.txt"
	exit 1
fi
exit 0
