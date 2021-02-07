#!/bin/bash

if [ $# -lt 1 ]; then
  echo "usage: $0 <collection>";
elif [ ! -d /mnt/Delta/$1 ]; then
  echo "error: picture collection path '/mnt/PictureFrame/$1' not found";
elif [[ $1 =~ ^[-_a-zA-Z0-9]+$ ]]; then
  DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh -q -Z -F -R 60 -Y -D 15.0 /mnt/PictureFrame/$1 &
else
  echo "error: invalid collection";
fi
