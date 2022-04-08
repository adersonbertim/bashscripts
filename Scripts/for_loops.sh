#!/usr/bin/env bash

guests=("John ""Brenda ""Clara ""Martin ")
# We have here a Array with the guests.
for user in ${guests}
do
  echo "${user}"
done
# In loop for we have a variable "user" for the each one guest and print then!

# Other example 

for num in {1..10}
do
  echo ${num}
done

# Here we have a numbers loop, variable num is in the list 1 at 10 and we print all this numbers.
