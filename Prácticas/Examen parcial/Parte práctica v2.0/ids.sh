#!/bin/sh
#!/bin/sh
# Si no se le pasa ninguna opción como parámetro,
# imprime información acerrca de los usuarios más jovenes
# y de la ciudad más popular.
if [ $# -eq 0 ]; then
        top5jovenes=$(sort -k3,3 ids.txt | head -n 5)
        echo "5 USUARIOS MÁS JÓVENES"
        echo "NOMBRE\t\tAPELLIDO\tEDAD\tRESIDENCIA\tID"
        echo "$top5jovenes"
        ciudadpopular=$(awk '{print $4}' ids.txt | sort -k 1,1 | uniq -c | sort -k1,1r | head -n 1 | awk '{print $2}')
        num_usuarios=$(awk '{print $4}' ids.txt | sort -k 1,1 | uniq -c | sort -k1,1r | head -n 1 | awk '{print $1}')
        echo "\n$ciudadpopular es la ciudad con más personas registradas\nen este sitio web, con un total de $num_usuarios usuarios."
# Si se le pasa un número incorrecto de parámetros,
# devuelve un mensaje de uso por la salida de error.
else
        echo "usage: $0"
        exit 1
fi
exit 0
