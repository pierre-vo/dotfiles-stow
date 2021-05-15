#!/bin/bash

TMP_FOLDER="$HOME/Temp"

mkdir -p $TMP_FOLDER

cd $TMP_FOLDER

git clone https://aur.archlinux.org/yay.git --depth 1
cd yay
makepkg -si

