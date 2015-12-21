# Setup Linux (Mint) for development

## Use Vim with Bash

    echo "export VISUAL=vim" >> ~/.bashrc
    echo "export EDITOR="$VISUAL"" >> ~/.bashrc
    source ~/.bashrc


## Install PIP for the local user
<https://pip.pypa.io/en/stable/user_guide/>

    wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py --user && rm get-pip.py

Add pip command to path (check with `echo $PATH`)

    echo "PATH=\$PATH:~/.local/bin" >> ~/.bashrc
    source ~/.bashrc


## Install virtualenvwrapper for the local user
<https://virtualenvwrapper.readthedocs.org/en/latest/install.html>

    pip install --user virtualenvwrapper

Make the commands available

    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
    echo "export PROJECT_HOME=$HOME/projects" >> ~/.bashrc
    echo "source ~/.local/bin/virtualenvwrapper.sh" >> ~/.bashrc
    source ~/.bashrc


## Create SSH key to use locally (with GitHub)
<https://help.github.com/articles/generating-ssh-keys/>

    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

Copy the public key to the clipboard

    xclip -selection clipboard ~/.ssh/id_rsa.pub


## Setup a Virtualenv using Python 3...

    mkproject --python=`which python3` project-name

