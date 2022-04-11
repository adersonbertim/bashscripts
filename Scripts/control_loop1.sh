#!/usr/bin/env bash

# Its a loop but with break or continue, this is private words

start=0

while [ $start -lt 10 ]
do
  echo $start 
  if [ $start -eq 8 ]
  then 
    break  # This is a word used to break of course this loop 
  elif (($start == 1))
  then 
    echo "This value 1"
  fi
  start=`expr $start + 1`
done
