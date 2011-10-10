#!/bin/sh

hg remove vimrc vimrc.local zhrc mybashrc myemacs

cp /etc/vim/vimrc .
cp /etc/vim/vimrc.local .

cp ~/.zshrc zshrc
cp ~/.mybashrc mybashrc
cp ~/.myemacs myemacs

hg add vimrc
hg add vimrc.local
hg add zshrc
