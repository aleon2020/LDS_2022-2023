import argparse

# Configuración de los argumentos
parser = argparse.ArgumentParser(description='Operaciones con números')
parser.add_argument('num1', type=int, help='Primer número entero')
parser.add_argument('num2', type=int, help='Segundo número entero')
group = parser.add_mutually_exclusive_group()
group.add_argument('-m', '--mult', action='store_true', help='Multiplica los dos números')
group.add_argument('-p', '--pow', action='store_true', help='Eleva el primer número a la potencia del segundo')
args = parser.parse_args()

# Procesamiento de los argumentos
if args.mult:
    resultado = args.num1 * args.num2
    print('El resultado de la multiplicación es:', resultado)
elif args.pow:
    resultado = args.num1 ** args.num2
    print('El resultado de la potencia es:', resultado)
else:
    serie = [1]
    for i in range(args.num1 - 1):
        serie.append(serie[-1] + args.num2)
    print('La serie es:', ' '.join(str(x) for x in serie))
