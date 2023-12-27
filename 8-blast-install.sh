#!/usr/bin/env bash

# Variables
DRUPAL_HOME=/var/www/html

# Read name of drupal directory if not already read
if [[ -z ${drupalsitedir} ]]; then
  read -r -p "Enter the name of the directory in which drupal website was installed: " drupalsitedir
fi

mkdir -p "$DRUPAL_HOME"/"$drupalsitedir"/tools/blast
wget --no-remove-listing ftp.ncbi.nlm.nih.gov/blast/executables/LATEST
wget https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/"$(grep x64-linux.tar.gz LATEST | awk 'NR==1{print $2}' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}')"
tar zxvpf ncbi-blast-*+-x64-linux.tar.gz
cp -r ncbi-blast-*+/bin "$DRUPAL_HOME"/"$drupalsitedir"/tools/blast/
rm -rf ncbi-blast-*+/ ncbi-blast-*+-x64-linux.tar.gz
rm LATEST

# Setting up PATH variable
sed -i "$ a PATH=$DRUPAL_HOME/$drupalsitedir/tools/blast/bin:\$PATH" ~/.bashrc && PATH="$DRUPAL_HOME"/"$drupalsitedir"/tools/blast/bin:$PATH

