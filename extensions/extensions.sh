#!/bin/sh

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Specify the input file
inputfile="extensions.txt"

# Check if the file exists
if [ -e "$inputfile" ]; then

    packages=""

    while IFS= read -r package; do
        packages="$packages new.$package"
    done < "$inputfile"

    touch $packages
else
    echo "File does not exist: $inputfile"
fi

