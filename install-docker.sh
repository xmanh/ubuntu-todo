#!/bin/bash

# install docker
sudo apt update
sudo apt install -y docker docker-compose

# Add your user to the Docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Sanity check that both tools were installed successfully
docker --version
docker-compose version

# Using Ubuntu 22.04 or Debian 10 / 11? You need to do 1 extra step for iptables
# compatibility, you'll want to choose option (1) from the prompt to use iptables-legacy.
# sudo update-alternatives --config iptables
