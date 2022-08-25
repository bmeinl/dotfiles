#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# tmux - not using tmux since switch to kitty
# ln -fsvi "$BASEDIR/runcom/tmux.conf" ~/.tmux.conf
# mkdir -p ~/.tmux/plugins
# ln -fsvi "$BASEDIR/tpm" ~/.tmux/plugins/tpm

# vim
ln -fsvi "$BASEDIR/vim/vimrc" ~/.vimrc

# bash/readline - using zsh now
# ln -fsvi "$BASEDIR/runcom/bashrc" ~/.bashrc
# ln -fsvi "$BASEDIR/runcom/inputrc" ~/.inputrc
# ln -fsvi "$BASEDIR/runcom/bash_profile" ~/.bash_profile
# ln -fsvi "$BASEDIR/runcom/dir_colors" ~/.dir_colors

# x11
ln -fsvi "$BASEDIR/X11/xinitrc" ~/.xinitrc
ln -fsvi "$BASEDIR/X11/Xresources" ~/.Xresources
ln -fsvi "$BASEDIR/X11/XCompose" ~/.XCompose
mkdir -p ~/.config/i3
ln -fsvi "$BASEDIR/X11/i3config" ~/.config/i3/config

# copy locale.conf to /etc/ if sudo is installed
sudo cp -i "$BASEDIR/locale.conf" /etc/locale.conf

