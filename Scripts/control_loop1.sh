#!/usr/bin/env bash

# Its a loop but with break or continue, this is private words

start=0

while [ $start -lt 10 ]
do
  echo $start 
  if [ $start -eq 5 ]
  then 
    break
  elif (($start == 1))
  then 
    echo "O valor obtido é 1"
  fi
  start=`expr $start + 1`
done
