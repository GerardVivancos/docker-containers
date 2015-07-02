#!/bin/bash

if [ ! -f purepw.txt ]; then
  echo "No purepw.txt file found. Will not init Pureftpd users"
  exit 0
fi

while read  l; do
  user=$(echo $l | cut -d":" -f1)
  pw=$(echo $l | cut -d":" -f2 )
  echo -e "$pw\n$pw"| pure-pw useradd $user -u ftpuser -d /opt/ftpdir
done < purepw.txt
