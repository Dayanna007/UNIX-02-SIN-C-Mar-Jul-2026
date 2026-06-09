#!/bin/bash
# Esta línea indica que el script debe ejecutarse con el intérprete bash

# $1 captura el primer argumento de la terminal (nombre)
FIRST_NAME=$1
# $2 captura el segundo argumento de la terminal (apellido)
LAST_NAME=$2
# Crea un archivo nuevo llamado output.txt
touch output.txt
# Escribe la fecha actual en formato DD-MM-YYYY dentro de output.txt
# El símbolo > sobreescribe el archivo con esta información
date +"%d-%m-%Y" > output.txt
# Agrega el nombre completo en output.txt sin borrar lo anterior
# El símbolo >> agrega al final del archivo
echo "$FIRST_NAME $LAST_NAME" >> output.txt