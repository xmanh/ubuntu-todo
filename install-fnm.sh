#!/bin/bash

sudo apt install -y zip unzip

curl -fsSL https://fnm.vercel.app/install | bash

if [ -f "$HOME/.zshrc" ]; then
    SHELL_FILE="$HOME/.zshrc"
else
    SHELL_FILE="$HOME/.bashrc"
fi

{
    echo ''
    echo '[ -f .nvmrc ] && fnm use'
    echo 'alias f="fnm"'
    echo 'alias n="npm"'
    echo 'alias y="yarn"'
    echo 'alias p="pnpm"'
    echo ''
} >>$SHELL_FILE
