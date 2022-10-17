#!/bin/bash

printHelp() {
    cat << 'EOF'
Usage: ./install.sh [ALL|bash|zsh|tmux|vim|readline|x11|locale]*
EOF
}

if [ $# -eq 0 ]; then
    printHelp()
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
if [ "$ALL_flag" -eq 1 -o "$tmux_flag" -eq 1 ]; then
    ln -fsvi "$BASEDIR/runcom/tmux.conf" ~/.tmux.conf
    mkdir -p ~/.tmux/plugins
    ln -fsvi "$BASEDIR/tpm" ~/.tmux/plugins/tpm
fi

# vim
if [ "$ALL_flag" -eq 1 -o "$vim_flag" -eq 1 ]; then
    ln -fsvi "$BASEDIR/vim/vimrc" ~/.vimrc
fi

# bash
if [ "$ALL_flag" -eq 1 -o "$bash_flag" -eq 1 ]; then
    ln -fsvi "$BASEDIR/runcom/bashrc" ~/.bashrc
    ln -fsvi "$BASEDIR/runcom/bash_profile" ~/.bash_profile
fi

# zsh
if [ "$ALL_flag" -eq 1 -o "$zsh_flag" -eq 1 ]; then
    ln -fsvi "$BASEDIR/runcom/zshrc" ~/.zshrc
fi

# readline
if [ "$ALL_flag" -eq 1 -o "$readline_flag" -eq 1 ]; then
    ln -fsvi "$BASEDIR/runcom/inputrc" ~/.inputrc
    ln -fsvi "$BASEDIR/runcom/dir_colors" ~/.dir_colors
fi

# x11
if [ "$ALL_flag" -eq 1 -o "$x11_flag" -eq 1 ]; then
    ln -fsvi "$BASEDIR/X11/xinitrc" ~/.xinitrc
    ln -fsvi "$BASEDIR/X11/Xresources" ~/.Xresources
    ln -fsvi "$BASEDIR/X11/XCompose" ~/.XCompose
    mkdir -p ~/.config/i3
    ln -fsvi "$BASEDIR/X11/i3config" ~/.config/i3/config
fi

# locale
if [ "$ALL_flag" -eq 1 -o "$locale_flag" -eq 1 ]; then
    # copy locale.conf to /etc/ if sudo is installed
    sudo cp -i "$BASEDIR/locale.conf" /etc/locale.conf
fi
