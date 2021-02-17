#!/usr/bin/env sh

######################################################################
# @author      : ryunosuke (jhan.k.police@gmail.com)
# @file        : get_location
# @created     : Thursday Feb 18, 2021 08:03:53 JST
#
# @description : 
#   read GPS info (location) from JPEG file.
# @usage : bash get_location.sh image.jpg
######################################################################

image=$1

lat=$(identify -verbose $image | grep -i -e "latitude:" | \
  awk '{ $1=""; gsub(",","",$2); gsub(",","",$3); }
  END {print $2" + ("$3")/60 + ("$4")/3600" }' | bc -l)
lon=$(identify -verbose $image | grep -i -e "longitude:" | \
  awk '{ $1=""; gsub(",","",$2); gsub(",","",$3); }
  END {print $2" + ("$3")/60 + ("$4")/3600" }' | bc -l)

echo "location: $lat, $lon "
