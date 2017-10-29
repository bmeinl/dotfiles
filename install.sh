#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -fsv "$BASEDIR/vim/vimrc" ~/.vimrc

# bash/readline
ln -fsv "$BASEDIR/runcom/bashrc" ~/.bashrc
ln -fsv "$BASEDIR/runcom/inputrc" ~/.inputrc
ln -fsv "$BASEDIR/runcom/bash_profile" ~/.bash_profile

# x11
ln -fsv "$BASEDIR/runcom/xinitrc" ~/.xinitrc
