#!/usr/bin/env bash

# While structure is very similiar to the for loop.

countdown=10

while [[ $countdown -gt 0 ]]
do
  echo $countdown
  ((countdown--))
done

