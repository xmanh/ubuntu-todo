#!/bin/bash

if [ -z "$(which vim)" ]; then
    echo "install vim"
    sudo apt install -y vim
    {
        echo "set number"
        echo "syntax on"
    } >~/.vimrc
else
    echo "vim installed"
fi

if [ -z "$(which zsh)" ]; then
    echo "install zsh"
    sudo apt install -y zsh
else
    echo "zsh installed"
fi

if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh installed"
else
    echo "install oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -z "$(grep "zsh-autosuggestions" ~/.zshrc)" ]; then
    echo "install plugin zsh-autosuggestions zsh-syntax-highlighting"

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    {
        echo 'export ZSH=$HOME/.oh-my-zsh'
        echo 'ZSH_THEME="af-magic"'
        echo 'plugins=(git docker-compose zsh-syntax-highlighting zsh-autosuggestions)'
        echo '# zstyle ":omz:update" mode disabled'
        echo 'zstyle ":completion:*:*" ignored-patterns "*ORIG_HEAD"'
        echo 'source $ZSH/oh-my-zsh.sh'
        echo ''
        echo '[ -f ~/.bash_aliases ] && source ~/.bash_aliases'
        echo ''
        echo 'alias ls="ls --color=auto --group-directories-first -h"'
        echo 'alias ll="ls -lA"'
    } >~/.zshrc
fi
