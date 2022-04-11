#!/usr/bin/env bash

# This is dont break and print all the rest of numbers on terminal

for i in {1..10}
do 
  if [ ${i} -eq 5 ]
  then
    echo "Skipping number 5"
    continue
  fi
  echo "I is equal to ${i}"
done
