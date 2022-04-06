#!/usr/bin/env bash

# We have some logical Operators like ! && || the condicionals >< <= >= == != =~ and ifs -gt -lt -ge -eq

age=22
yo=21

if (( $age >= $yo ))
then
  echo "You have age"

else
  echo "You dont have age to do it"

fi

if [ 01 -eq 1 ]
then
  echo "01 Equal 1"
fi
