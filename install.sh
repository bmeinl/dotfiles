#!/bin/bash

printHelp() {
    cat << 'EOF'
Usage: ./install.sh [ALL|bash|zsh|tmux|vim|readline|x11|locale]*
EOF
}

if [ $# -eq 0 ]; then
    printHelp
    exit
fi

while [ -n "$1" ]; do
    case "$1" in
        ALL) ALL_flag=1 ;;
        bash) bash_flag=1 ;;
        zsh) zsh_flag=1 ;;
        tmux) tmux_flag=1 ;;
        vim) vim_flag=1 ;;
        readline) readline_flag=1 ;;
        x11) x11_flag=1 ;;
        locale) locale_flag=1 ;;
    esac
    shift
done

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# tmux
if [ -n "$ALL_flag" -o -n "$tmux_flag" ]; then
    ln -fsvi "$BASEDIR/runcom/tmux.conf" ~/.tmux.conf
    mkdir -p ~/.tmux/plugins
    ln -fsvi "$BASEDIR/tpm" ~/.tmux/plugins/tpm
fi

# vim
if [ -n "$ALL_flag" -o -n "$vim_flag" ]; then
    ln -fsvi "$BASEDIR/vim/vimrc" ~/.vimrc
fi

# bash
if [ -n "$ALL_flag" -o -n "$bash_flag" ]; then
    ln -fsvi "$BASEDIR/runcom/bashrc" ~/.bashrc
    ln -fsvi "$BASEDIR/runcom/bash_profile" ~/.bash_profile
fi

# zsh
if [ -n "$ALL_flag" -o -n "$zsh_flag" ]; then
    ln -fsvi "$BASEDIR/runcom/zshrc" ~/.zshrc
fi

# readline
if [ -n "$ALL_flag" -o -n "$readline_flag" ]; then
    ln -fsvi "$BASEDIR/runcom/inputrc" ~/.inputrc
    ln -fsvi "$BASEDIR/runcom/dir_colors" ~/.dir_colors
fi

# x11
if [ -n "$ALL_flag" -o -n "$x11_flag" ]; then
    ln -fsvi "$BASEDIR/X11/xinitrc" ~/.xinitrc
    ln -fsvi "$BASEDIR/X11/Xresources" ~/.Xresources
    ln -fsvi "$BASEDIR/X11/XCompose" ~/.XCompose
    mkdir -p ~/.config/i3
    ln -fsvi "$BASEDIR/X11/i3config" ~/.config/i3/config
fi

# locale
if [ -n "$ALL_flag" -o -n "$locale_flag" ]; then
    # copy locale.conf to /etc/ if sudo is installed
    sudo cp -i "$BASEDIR/locale.conf" /etc/locale.conf
fi
