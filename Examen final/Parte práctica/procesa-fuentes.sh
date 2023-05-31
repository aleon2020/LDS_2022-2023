#!/bin/sh

# Comprobar si el directorio /tmp/sources.list.d existe, y si no, crearlo
if [ ! -d "/tmp/sources.list.d" ]; then
    mkdir /tmp/sources.list.d
fi

# Copiar los archivos *.list al directorio /tmp/sources.list.d
cp /etc/apt/sources.list.d/*.list /tmp/sources.list.d/

# Función para imprimir el número total de repositorios
print_total_repositories() {
    count=$(grep -c '^deb ' /tmp/sources.list.d/*.list)
    echo "Total de nombres de repositorios de fuentes software: $count"
}

# Función para imprimir las URLs de los repositorios
print_repository_urls() {
    echo "URLs"
    echo "----------------------------------"
    grep -oP '(?<=^deb\s).*?(?=\s)' /tmp/sources.list.d/*.list
    count=$(grep -c '^deb ' /tmp/sources.list.d/*.list)
    echo "Total de URLs: $count"
}

# Función para imprimir el número total de repositorios para las arquitecturas i386 y amd64
print_architecture_counts() {
    i386_count=$(grep -c 'i386' /tmp/sources.list.d/*.list)
    amd64_count=$(grep -c 'amd64' /tmp/sources.list.d/*.list)
    echo "ARQUITECTURAS"
    echo "-----------------------------------"
    echo "i386: $i386_count"
    echo "amd64: $amd64_count"
}

# Si no recibe ningún argumento, imprime por pantalla
# el número total de nombres de repositorios de fuentes software contenidos en todos los ficheros *.list.
if [ $# -eq 0 ]; then
    print_total_repositories

# Si recibe el parámetro -u o --url, entonces debe imprimir 
# un listado con las direcciones URL de cada repositorio incluido en los ficheros *.list.
elif [ "$1" = "-u" ] || [ "$1" = "--url" ]; then
    print_repository_urls
	
# Si recibe el argumento -a o --arch, se debe imprimir
# el número total de repositorios codificados como arquitectura i386 y amd64.
elif [ "$1" = "-a" ] || [ "$1" = "--arch" ]; then
    print_architecture_counts

# Si recibe cualquier opción como parámetro o un número incorrecto de parámetros,
# debe imprimir un mensaje de error alertando sobre ello y finalizar con el código de status apropiado.
else
	echo "usage: $0 [ -u | --url | -a | --arch ]"
	exit 1
fi
exit 0
