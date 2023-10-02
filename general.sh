#!/bin/bash

# Setup
sudo apt update
timedatectl set-local-rtc 1 --adjust-system-clock # make Ubuntu use local time for dual boot
xdg-user-dirs-update --set DOWNLOAD ~/downloads

sudo apt install curl

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb

# JetBrains Toolbox
wget -cO jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
tar -xzf jetbrains-toolbox.tar.gz
DIR=$(find . -maxdepth 1 -type d -name jetbrains-toolbox-\* -print | head -n1)
cd $DIR
./jetbrains-toolbox
cd ..
rm -r $DIR
rm jetbrains-toolbox.tar.gz

# Git
sudo apt -y install git
sudo apt -y install git-lfs
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
git pull.rebase false origin master
git config --global credential.credentialStore cache
git config credential.helper 'cache'

# Python 
sudo apt -y install python3-pip

# Docker
sudo apt -y install docker


# Discord
sudo snap install discord

# Hardinfo 
sudo apt install -y hardinfo

# Network
sudo apt install -y net-tools
sudo apt install -y nmap

# FTP & SSH setup
sudo apt install -y openssh-server
sudo apt ufw allow ssh

# Visual Studio Code
sudo snap install --classic code

# nodejs
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
