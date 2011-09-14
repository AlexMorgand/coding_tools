#!/bin/sh

hg remove vimrc vimrc.local .zshrc

cp /etc/vim/vimrc .
cp /etc/vim/vimrc.local .

cp ~/.zshrc .

hg add vimrc
hg add vimrc.local
hg add .zshrc
