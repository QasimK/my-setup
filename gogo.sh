#!/bin/bash
# Download dot files into pwd
URL=https://raw.githubusercontent.com/QasimK/my-setup/master
declare -a FILES=('.inputrc' '.vimrc' '.tmux.conf' '.gitignore' '.gitcommitmessage' '.pdbrc' '.pypirc')
for FILE in "${FILES[@]}"; do
    wget -q --backups=1 $URL/$FILE
done

mkdir -p ~/.config/git
mv --backup ~/.gitignore ~/.config/git/gitignore
mv --backup ~/.gitcommitmessage ~/.config/git/commit.template
