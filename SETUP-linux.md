# Setup Linux for Development

* Install mosh, tmux, fish, vim, git, htop, direnv.
* Setup common dotfiles: <https://github.com/QasimK/dotfiles>.


## Install PIP for the local user
<https://pip.pypa.io/en/stable/installing/> (**We install pip for Python 3.**)

    wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user && rm get-pip.py

*(May not have to do this)* Add pip command to path (check with `echo $PATH`)

    # Bash
    echo "export PATH=\${PATH}:~/.local/bin" >> ~/.bashrc
    source ~/.bashrc
    # Fish
    set -U fish_user_paths ~/.local/bin $fish_user_paths

## Install direnv

direnv is preferred over using `virtualenv` and `virtualenvwrapper`

Allow direnv to create virtualenvs inside the project:

```bash
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}
layout_python-venv() {
    local python=${1:-python3}
    [[ $# -gt 0 ]] && shift
    unset PYTHONHOME
    if [[ -n $VIRTUAL_ENV ]]; then
        VIRTUAL_ENV=$(realpath "${VIRTUAL_ENV}")
    else
        local python_version
        python_version=$("$python" -c "import platform; print(platform.python_version())")
        if [[ -z $python_version ]]; then
            log_error "Could not detect Python version"
            return 1
        fi
        VIRTUAL_ENV=$PWD/.direnv/python-venv-$python_version
    fi  
    export VIRTUAL_ENV
    if [[ ! -d $VIRTUAL_ENV ]]; then
        log_status "no venv found; creating $VIRTUAL_ENV"
        "$python" -m venv "$VIRTUAL_ENV"
    fi  
    PATH_add "$VIRTUAL_ENV/bin"
}
```

Install:

    echo "eval \"$(direnv hook bash)\"" >> ~/.bashrc
    echo "direnv hook fish | source" >> ~/.config/fish/config.fish

### Usage

Within a project, create `<python-project>/.envrc`:

```bash
export VIRTUAL_ENV=venv
layout python-venv python3.7
```

## Install pipenv

**NOTE**: Consider using pipenv with/instead of virtualenvwrapper/virtualfish

    pip install --user pipenv

Install auto-completions for fish:

    echo "eval (pipenv --completion)" >> ~/.config/fish/config.fish


## Optional: Install virtualenvwrapper for the local user (Bash shell)

<https://virtualenvwrapper.readthedocs.org/en/latest/install.html>

    pip install --user virtualenvwrapper

Make the commands available

    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
    echo "export PROJECT_HOME=$HOME/projects" >> ~/.bashrc
    echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
    echo "source ~/.local/bin/virtualenvwrapper_lazy.sh" >> ~/.bashrc
    source ~/.bashrc


## Optiona: Install virtualfish for the local user (Fish shell)

(virtualenvwrapper for the fish shell)

    pip install --user virtualfish

Enable virtualfish:

    echo "eval (python -m virtualfish auto_activation projects)" >> ~/.config/fish/config.fish

## Bash shortcuts

TODO: Fix up my dotfiles

Fish

    function rmpycache -d "Remove cached Python files"
        find . -type f -name \*.pyc -delete
        find . -type d -name __pycache__ -delete
    end

Bash

    echo "alias rmpycache='find . -name \*.pyc -delete && find . -type d -name __pycache__ -delete'" >> ~/.bash_aliases
    source ~/.bashrc


## Create SSH key to use locally (with GitHub)
<https://help.github.com/articles/generating-ssh-keys/>
<https://https://qasimk.gitbooks.io/the-programmer-s-compendium/linux/ssh.html>

Set a passphrase for the new SSH key:recently

    ssh-keygen -t rsa -b 4096 -C User@Device#Realm

Copy the public key to the clipboard (e.g. to add to GitHub).

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
