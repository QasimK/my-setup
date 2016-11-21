# Setup Linux (Mint) for development

## Use Vim with Bash

    echo "export VISUAL=vim" >> ~/.bashrc
    echo "export EDITOR=vim" >> ~/.bashrc
    source ~/.bashrc


## Install PIP for the local user
<https://pip.pypa.io/en/stable/installing/> (Note the use of python3 here)

    wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user && rm get-pip.py

*(May not have to do this)* Add pip command to path (check with `echo $PATH`)

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


## Bash shortcuts

    echo "alias rmpycache='find . -name \*.pyc -delete && find . -type d -name __pycache__ -delete'" >> ~/.bash_aliases
    source ~/.bashrc


## Create SSH key to use locally (with GitHub)
<https://help.github.com/articles/generating-ssh-keys/>

    ssh-keygen -t rsa -b 4096 -C QasimK...

Copy the public key to the clipboard

    xclip -selection clipboard ~/.ssh/id_rsa.pub


## Setup shortcut to launch Terminator instead of Terminal

    Keyboard Shortcuts > New custom command "terminator" with the right shortcut


## Setup up SSH to keep connections alive

    echo 'Host * !bitbucket.org !github.com' >> ~/.ssh/config
    echo '    ServerAliveInterval 240' >> ~/.ssh/config
    echo '    ControlPersist 1h' >> ~/.ssh/config
    echo '    ControlMaster auto' >> ~/.ssh/config
    echo '    ControlPath ~/.ssh/controlmasters/%r@%h:%p' >> ~/.ssh/config
    chmod 600 ~/.ssh/config
    mkdir ~/.ssh/controlmasters

## Setup tmux

Install [powerline-status](https://powerline.readthedocs.io/en/latest/installation.html).

Copy and paste this into `~/.tmux.conf`

    set -g @plugin 'tmux-plugins/tpm'

    set -g @plugin 'tmux-plugins/tmux-resurrect'
    set -g @plugin 'tmux-plugins/tmux-continuum'
    set -g @plugin 'tmux-plugins/tmux-sensible'
    set -g @plugin 'tmux-plugins/tmux-yank'
    set -g @plugin 'tmux-plugins/tmux-pain-control'

    set -g @resurrect-capture-pane-contents 'on'
    set -g @continuum-restore 'on'

    set-window-option -g xterm-keys on

    source "/home/qasim/.local/lib/python3.5/site-packages/powerline/bindings/tmux/powerline.conf"

    run '~/.tmux/plugins/tpm/tpm'


## Setup a Virtualenv using Python 3

    mkproject --python=`which python3` project-name


## Setup Jupyter Notebook with Virtualenv

(Assuming Jupyter is installed outside of the virtualenv)

    pip install ipykernel
    python -m ipykernel install --user --name project-name --display-name "Project Name"
