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
