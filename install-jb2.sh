#!/usr/bin/env bash

# Install dependencies
sudo apt install -y samtools tabix wget curl apache2
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 16

# Installation
npm install -g @jbrowse/cli
jbrowse create jbrowse2
sudo chown -R "$USER":"$USER" /var/www/html/
cp -r jbrowse2 /var/www/html/

# Setup sample dataset
mkdir data
cd data/

