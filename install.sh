#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# tmux
ln -fsvi "$BASEDIR/runcom/tmux.conf" ~/.tmux.conf

# vim
ln -fsvi "$BASEDIR/vim/vimrc" ~/.vimrc

# bash/readline
ln -fsvi "$BASEDIR/runcom/bashrc" ~/.bashrc
ln -fsvi "$BASEDIR/runcom/inputrc" ~/.inputrc
ln -fsvi "$BASEDIR/runcom/bash_profile" ~/.bash_profile
ln -fsvi "$BASEDIR/runcom/dir_colors" ~/.dir_colors

# x11
ln -fsvi "$BASEDIR/X11/xinitrc" ~/.xinitrc
ln -fsvi "$BASEDIR/X11/Xresources" ~/.Xresources
ln -fsvi "$BASEDIR/X11/XCompose" ~/.XCompose
ln -fsvi "$BASEDIR/X11/i3config" ~/.i3config

# copy locale.conf to /etc/ if sudo is installed
sudo cp -i "$BASEDIR/locale.conf" /etc/locale.conf

# link tpm submodule
mkdir -p ~/.tmux/plugins
ln -fsvi "$BASEDIR/tpm" ~/.tmux/plugins/tpm
