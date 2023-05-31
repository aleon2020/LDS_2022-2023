import argparse

parser = argparse.ArgumentParser(description='SCRIPT DE PYTHON DECIMALES.PY EXAMEN FINAL LABORATORIO DE SISTEMAS')

parser.add_argument('numeros', metavar='N', type=float, nargs='+', help='Recibe como argumentos entre 1 y 4 números decimales, separados entre sí por un espacio en blanco')
parser.add_argument('-f', '--first', action='store_true', help='Imprime el primer número decimal proporcionado por el usuario.')
parser.add_argument('-p', '--pi', action='store_true', help='Comprueba si alguno de los números insertados es el número pi (3.14)')

args = parser.parse_args()

# Si recibe el parámetro opcional -f o bien --first,
# imprime el primer número decimal proporcionado por el usuario.
if args.first:
    print(f'El primer número decimal es: {args.numeros[0]}')
    
# Si recibe el parámetro opcional -p o bien --pi,
# comprueba si alguno de los números insertados es el número pi (3.14).
elif args.pi:
    if 3.14 in args.numeros:
        print('La serie SI contiene el número pi')
    else:
        print('La serie NO contiene el número pi')

# Si no se recibe ningún parámetro, realiza la suma de los números recibidos como argumento y la imprime por pantalla.     
else:
    suma = sum(args.numeros)
    print(suma)
