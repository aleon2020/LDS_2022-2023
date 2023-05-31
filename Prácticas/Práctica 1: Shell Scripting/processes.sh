#!/bin/sh
# Si se ejecuta con la opción -f usuario,
# imprime el usuario y el número de procesos del mismo en primer plano.
if [ $# -eq 2 ] && [ "$1" = "-f" ]; then
	procesos_foreground=$(ps -u "$2" | wc -l)
	echo "Procesos en primer plano: $procesos_foreground"

# Si se ejecuta con la opción -b usuario,
# imprime el usuario y el número de procesos del mismo en segundo plano.
elif [ $# -eq 2 ] && [ "$1" = "-b" ]; then
	procesos_background=$(ps -u "$2" -o pid,state | grep -c 'T')
	echo "Procesos en segundo plano: $procesos_background"

# Si se ejecuta con las opciones -a usuario o usuario,
# imprime el usuario y el número total de procesos.
elif [ $# -eq 2 ] && [ "$1" = "-a" ]; then
	num_totalprocesos=$(ps -u "$2" | wc -l)
	echo "Número total de procesos: $num_totalprocesos"

elif [ $# -eq 1 ]; then
	num_totalprocesos=$(ps -u "$1" | wc -l)
	echo "Número total de procesos: $num_totalprocesos"

# Si se ejecuta con ningún argumento,
# imprime un mensaje de error y termina con el código de estatus apropiado.
elif [ $# -eq 0 ]; then
	echo "usage: $0 username"
	exit 1

# Si se ejecuta con cualquier otra opción,
# imprime un mensaje de error y termina con el código de estatus apropiado.
else
	echo "usage: $0 [ -f | -b | -a ] username"
	exit 1
fi
exit 0
