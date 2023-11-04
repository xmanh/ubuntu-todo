#!/bin/bash

sudo apt install -y unzip

curl -fsSL https://fnm.vercel.app/install | bash

if [ -f "$HOME/.zshrc" ]; then
    zsh
    SHELL_FILE="$HOME/.zshrc"
else
    SHELL_FILE="$HOME/.bashrc"
fi

if [ -z "$(grep "NVM_DIR" $SHELL_FILE)" ]; then
    {
        echo ''
        echo 'if [ -f .nvmrc ]; then'
        echo '    fnm use'
        echo 'else'
        echo '    fnm use 18'
        echo 'fi'
    } >>$SHELL_FILE
fi
