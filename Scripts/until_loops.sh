#!/usr/bin/env bash

# Until loops will be executed the loop condition become true.

countdown=10
until [ $countdown -le 0 ]
do
  echo ${countdown}
  ((countdown--))
done
