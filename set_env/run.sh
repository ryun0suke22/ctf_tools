#!/bin/bash

# for xserver
export IP=$(ifconfig en0 | awk '/inet / { print $2  }')
xhost + $IP

# container gen
docker-compose run kali-linux

