#!/bin/bash
for index in $(seq 1 10); do
  echo "${index}"
done

for ip_address in "$@"; do
  echo "Taking some action on IP address ${ip_address}"
done


grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
ps | grep TTY
ps | grep tty
ps | grep -i tty
grep -v "35.237.4.214" log.txt
grep -o "35.237.4.214" log.txt
awk '{print $1}' log.txt
awk '{print $1,$2,$3}' log.txt
awk '{print $1,$NF}' log.txt

#!/bin/bash

# Crear el archivo CSV
echo "hola1,chao1" > test.csv
echo "hola2,chao2" >> test.csv
echo "hola3,chao3" >> test.csv
# Mostrar el contenido del archivo
cat test.csv
# Mostrar la primera columna 
awk -F',' '{print $1}' test.csv

awk 'NR < 10' .devcontainer/log.txt
cat log.txt
grep "42.236.10.117" log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt
sed 's/ //g' log.txt
sed '1d' log.txt
sed '$d' log.txt
sed '5,7d' log.txt
sed -n '2,15 p' log.txt
sed -i '1d' log.txt