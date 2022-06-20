#!/usr/bin/env bash

# DISCLAIMER
# Of course this script have a didactic purposes.

# Ask user for the password length
clear
read -p "How many characters you like in your password? " pass_length
printf "\n"

# Script to generate a password.
for i in {1..5}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w"$pass_length" | head -n 1); done
# We have here a loop with cat the path in dev/urandom and add a variable pass_length and print then.

# We have other ways to do that like ..
#openssl rand -base64 ${pass_length}

# We print the password.
printf "$pass_output\n"
printf "That are a password suggestions for you $USER have a nice day! :)\n"
