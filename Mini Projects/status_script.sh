#!/usr/bin/env bash

# This is a script based on E-book in readme, so this script return the current server status.

server_name=$(hostid)

function memory_check() {
  echo ""
    echo "The current memory usage on ${server_name} is: "
    free -h
    echo ""
}

function cpu_usage() {
  echo ""
    echo "The current CPU LOAD on ${server_name} is: "
    uptime 
    echo ""
}

function os_name (){
  echo ""
    echo "This Operetional System on ${server_name} is: "
    egrep '^NAME' /etc/os-release
    echo ""
}

function kernel_version (){
  echo ""
    echo "Kernerl version on ${server_name} is: "
    uname -r
    echo ""
}

function architecture (){
  echo ""
    echo "Architecture is on ${server_name} is: "
    uname -m
    echo ""
}

function processes_user (){
  echo ""
    echo "Status of processes on ${server_name} is: "
    ps
    echo ""
}

function all_functions (){
  memory_check
  cpu_usage
  os_name
  kernel_version
  architecture
  processes_user
}

#all_functions

# Adding colors
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

# Color functions
ColorGreen (){
  echo -ne $green$1$clear
}

ColorBlue (){
  echo -ne $blue$1$clear
}

# Adding menu function
menu() { 
  echo -ne "
  Menu Options
  $(ColorGreen '1)') Memory Usage
  $(ColorGreen '2)') CPU LOAD
  $(ColorGreen '3)') Operetional System 
  $(ColorGreen '4)') Kernel version
  $(ColorGreen '5)') Architecture
  $(ColorGreen '6)') Processes User 
  $(ColorGreen '7)') Check all 
  $(ColorGreen '8)') Exit
  $(ColorBlue 'Choose an option:')"
# The flags -ne is n -> not append new line | e -> enale backslash scapes interpretation 
    read a
    case $a in
      1) memory_check ; menu ;;
      2) cpu_usage ; menu;;
      3) os_name ; menu ;;
      4) kernel_version ; menu ;;
      5) architecture ; menu ;;
      6) processes_user ; menu ;;
      7) all_functions ; menu ;;
      8) exit 0 ;;
      *) echo -e $red"Wrong Option."$clear; 
        WrongCommand ;;
    esac
}

menu
