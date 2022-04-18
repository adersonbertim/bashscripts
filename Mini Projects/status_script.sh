#!/usr/bin/env bash

# This is a script based on E-book in readme, so this script return the current server status.
# In this script i fail to found CPU LOAD Average, but i fell failed to solve this but anyway.


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

all_functions
