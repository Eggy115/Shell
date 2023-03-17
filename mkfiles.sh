#!/usr/bin/bash

i=0
while [ $i -lt 11 ]
do
  dd if=/dev/zero of=/file_$i bs=1024 count=10000
  i=$[ $i + 1 ]
done
