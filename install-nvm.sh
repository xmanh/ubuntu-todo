#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

if [ -f "$HOME/.zshrc" ]; then
  zsh
  SHELL_FILE="$HOME/.zshrc"
else
  SHELL_FILE="$HOME/.bashrc"
fi

if [ -z "$(grep "NVM_DIR" $SHELL_FILE)" ]; then
  {
    echo ''
    echo 'export NVM_DIR="$HOME/.nvm"'
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
    echo '[ -f .nvmrc ] && nvm use'
  } >>$SHELL_FILE
fi

# nvm install lts/gallium
# nvm alias default lts/gallium