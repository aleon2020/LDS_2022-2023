#!/bin/sh
# Si se introduce como parámetro el fichero alice_ebook.txt,
# imprime el fragmento correspondiente al capítulo 10 (CHAPTER 10)
if [ $# -eq 1 ] && [ -f "$1" ]; then
	comienzo_capitulo10=$(grep -n "CHAPTER X" $1 | cut -d ":" -f 1 | head -n 1)
	final_capitulo10=$(grep -n "CHAPTER XI" $1 | cut -d ":" -f 1 | head -n 1)
	final_capitulo10=$(($final_capitulo10 - 1))
	sed -n "${comienzo_capitulo10},${final_capitulo10}p" $1

# Si se le pasa un número incorrecto de parámetros,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 alice_ebook.txt"
	exit 1
fi
exit 0
