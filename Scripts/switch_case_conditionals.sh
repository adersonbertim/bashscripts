#!/usr/bin/env bash

# Switch Case used to mainten organized your code, basicly is a if-then-else more better.

read -p "What's your phone? " phone

case $phone in
  Iphone)
    echo "${phone} is the Aplle!"
    ;;
  Samsumg | Motorola | Philco | Nokia)
    echo "${phone} is a Android!"
    ;;
  *)
    echo "${phone} what is time you live dude !!!!"
    ;;
esac

