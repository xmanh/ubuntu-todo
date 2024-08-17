#!/bin/bash

PYTHON=${1:-3.10.12}

sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev curl \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

curl https://pyenv.run | bash

pyenv install $PYTHON
pyenv global $PYTHON

if [ -f "$HOME/.zshrc" ]; then
  SHELL_FILE="$HOME/.zshrc"
else
  SHELL_FILE="$HOME/.bashrc"
fi

{
  echo ''
  echo 'export PYENV_ROOT="$HOME/.pyenv"'
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"'
  echo 'eval "$(pyenv init -)"'
  echo '[ -f .python-version ] && pyenv local'
  echo 'alias py="python"'
  echo ''
} >>$SHELL_FILE
