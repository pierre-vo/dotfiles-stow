#!/bin/sh
case $1/$2 in
  pre/*)
    # echo "Going to $2..."
    ;;
  post/*)
    # echo "Waking up from $2..."
    modprobe -r psmouse
    modprobe psmouse
    ;;
esac

