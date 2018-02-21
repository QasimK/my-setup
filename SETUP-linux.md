# Setup Linux (Mint) for Development

## Setup dotfiles

    wget https://raw.githubusercontent.com/QasimK/my-setup/master/gogo.sh
    chmod +x gogo.sh
    ./gogo.sh


## Install PIP for the local user
<https://pip.pypa.io/en/stable/installing/> (**We install pip for Python 3.**)

    wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user && rm get-pip.py

*(May not have to do this)* Add pip command to path (check with `echo $PATH`)

    echo "export PATH=\${PATH}:~/.local/bin" >> ~/.bashrc
    source ~/.bashrc

## Install pipenv

**NOTE**: Consider using pipenv with/instead of virtualenvwrapper/virtualfish

    pip install --user pipenv

Install auto-completions for fish:

    echo "eval (pipenv --completion)" >> ~/.config/fish/config.fish


## Install virtualenvwrapper for the local user (Bash shell)
<https://virtualenvwrapper.readthedocs.org/en/latest/install.html>

    pip install --user virtualenvwrapper

Make the commands available

    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
    echo "export PROJECT_HOME=$HOME/projects" >> ~/.bashrc
    echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
    echo "source ~/.local/bin/virtualenvwrapper_lazy.sh" >> ~/.bashrc
    source ~/.bashrc


## Install virtualfish for the local user (Fish shell)

(virtualenvwrapper for the fish shell)

    pip install --user virtualfish

Enable virtualfish:

    echo "eval (python -m virtualfish auto_activation projects)" >> ~/.config/fish/config.fish

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


## Setup a Virtualenv using Python 3

With `virtualenvwrapper` set-up fully:

    mkproject --python=`which python3` <name>

With virtualfish set-up fully:

    vf project -p (which python3) <name>
    vf connect


## Setup Jupyter Notebook with Virtualenv

(Assuming Jupyter is installed outside of the virtualenv)

    pip install ipykernel
    python -m ipykernel install --user --name project-name --display-name "Project Name"
