#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -fsv "$BASEDIR/vim/vimrc" ~/.vimrc

# bash/readline
ln -fsv "$BASEDIR/runcom/bashrc" ~/.bashrc
ln -fsv "$BASEDIR/runcom/inputrc" ~/.inputrc
ln -fsv "$BASEDIR/runcom/bash_profile" ~/.bash_profile
ln -fsv "$BASEDIR/runcom/dir_colors" ~/.dir_colors

# x11
ln -fsv "$BASEDIR/X11/xinitrc" ~/.xinitrc
ln -fsv "$BASEDIR/X11/Xresources" ~/.Xresources
ln -fsv "$BASEDIR/X11/XCompose" ~/.XCompose
ln -fsv "$BASEDIR/X11/i3config" ~/.i3config
