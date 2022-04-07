#!/usr/bin/env bash

# This is other example i like

guest="aderson"
age="21"
read -p "What's your name: " name
read -p "And your age: " yo
if [[ ${name} != ${guest} ]] && [[ ${yo} -lt ${age} ]]
then
  echo "You dont have permission"
else
  echo "Let's get into the party"
fi
