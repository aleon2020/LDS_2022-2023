import argparse

parser = argparse.ArgumentParser(description='Realiza operaciones con una serie de números enteros.')
parser.add_argument('numeros', metavar='N', type=int, nargs='+',
                    help='una serie de números enteros')
parser.add_argument('-m', '--max', action='store_true', help='muestra el máximo número')
parser.add_argument('-s', '--min', action='store_true', help='muestra el mínimo número')
parser.add_argument('-a', '--asc', action='store_true', help='muestra la serie ordenada de menor a mayor')
parser.add_argument('-r', '--rev', action='store_true', help='muestra la serie ordenada de mayor a menor')

args = parser.parse_args()

if args.max:
    print(f'El máximo número es: {max(args.numeros)}')
elif args.min:
    print(f'El mínimo número es: {min(args.numeros)}')
elif args.asc:
    print(f'La serie ordenada es: {" ".join(map(str, sorted(args.numeros)))}')
elif args.rev:
    print(f'La serie inversamente ordenada es: {" ".join(map(str, sorted(args.numeros, reverse=True)))}')
else:
    print('Debes elegir al menos una opción. Escribe "-h" o "--help" para ver las opciones disponibles.')
