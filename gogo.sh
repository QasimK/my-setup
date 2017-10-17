#!/bin/bash
# Download dot files into pwd
URL=https://raw.githubusercontent.com/QasimK/my-setup/master
declare -a FILES=('.inputrc' '.vimrc' '.tmux.conf' '.gitignore' '.pdbrc')
for FILE in "${FILES[@]}"; do
    wget -q --backups=1 $URL/$FILE
done

