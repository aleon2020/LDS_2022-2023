#!/usr/bin/python3
import argparse
import pandas as pd

# Si se ejecuta con las opciones -h o --help,
# imprime la información para ejecutar el script y otras opciones disponibles.
parser = argparse.ArgumentParser(description='Script de Python que procesa el archivo Pima.csv')
parser.add_argument('archivo', metavar='Pima.csv', type=str, help='Archivo a procesar')
parser.add_argument('-m', '--mean', action='store_true', 
                    help='Imprime el nombre las columnas con valores numéricos y calcula su media')
parser.add_argument('-b', '--bool', action='store_true',
                    help='Imprime el nombre de las columnas con valores booleanos (nº de YES y NO)')
args = parser.parse_args()
df = pd.read_csv(args.archivo)

# Si se ejecuta con las opciones -m o --mean,
# imprime el nombre de las columnas con valores numéricos y calcula su media.
if args.mean:
    num_cols = df.select_dtypes(include=['float64', 'int64']).columns.tolist()
    for col in num_cols:
        mean = df[col].mean()
        print(f"{col}: {mean}")

# Si se ejecuta con las opciones -b o --bool,
# imprime el nombre de las columnas con valores booleanos (nº de YES y NO).
if args.bool:
    yes_count = df['type'].str.count('Yes').sum()
    no_count = df['type'].str.count('No').sum()
    print(f"{'type'}: Yes={yes_count}, No={no_count}")
