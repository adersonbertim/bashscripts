#!/usr/bin/env bash

# Simple example 
read -p "What's your age? " age
ageMin=18
# We have a read tag, variable age and ageMin
if [ ${ageMin} -ge ${age} ]
  # If ageMin >= age read the first echo.
then 
  echo "You dont have the age"
else
  echo "You have the age"
  # But if age > ageMin read the second echo.
fi

# Made with brackts become mor readble for all shells, more than (()).

