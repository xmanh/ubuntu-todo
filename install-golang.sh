#!/bin/bash

echo 'install golang'

curl -LO https://go.dev/dl/go1.18.10.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.10.linux-amd64.tar.gz
rm -f go1.18.10.linux-amd64.tar.gz

if [ -f "$HOME/.zshrc" ]; then
  SHELL_FILE="$HOME/.zshrc"
else
  SHELL_FILE="$HOME/.bashrc"
fi

{
  echo ''
  echo 'export PATH=$PATH:/usr/local/go/bin'
} >>$SHELL_FILE

go version
