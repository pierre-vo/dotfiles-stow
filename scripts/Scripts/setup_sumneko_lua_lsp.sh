#!/bin/bash

APP_FOLDER="$HOME/Scripts/App"

mkdir -p $APP_FOLDER

cd $APP_FOLDER

git clone https://github.com/sumneko/lua-language-server --depth 1
cd lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
bash compile/install.sh

cd $APP_FOLDER/lua-language-server
./3rd/luamake/luamake rebuild




