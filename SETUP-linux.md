# Setup Linux for Development

* Setup common dotfiles: <https://github.com/QasimK/dotfiles>.
* Install mosh, tmux, fish, vim, git, htop.
* Install aur:direnv

## Install PIP for the local user
<https://pip.pypa.io/en/stable/installing/> (**We install pip for Python 3.**)

    wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user && rm get-pip.py

*(May not have to do this)* Add pip command to path (check with `echo $PATH`)

    # Fish
    set -U fish_user_paths ~/.local/bin $fish_user_paths

## Configure direnv

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

## Install pipenv (if necessary)

**NOTE**: Use Poetry or direnv instead.

**NOTE**: Consider using pipenv with/instead of virtualenvwrapper/virtualfish

    pip install --user pipenv

Install auto-completions for fish:

    echo "eval (pipenv --completion)" >> ~/.config/fish/config.fish


## Create SSH key to use locally (with GitHub)
<https://help.github.com/articles/generating-ssh-keys/>
<https://https://qasimk.gitbooks.io/the-programmer-s-compendium/linux/ssh.html>

Set a passphrase for the new SSH key:recently

    ssh-keygen -t ed25519 -C User@Device#Realm
    ssh-keygen -t rsa -b 4096 -C User@Device#Realm

Copy the public key to the clipboard (e.g. to add to GitHub).

    xclip -selection clipboard ~/.ssh/id_rsa.pub


## Setup Jupyter Notebook with Virtualenv

(Assuming Jupyter is installed outside of the virtualenv)

    pip install ipykernel
    python -m ipykernel install --user --name project-name --display-name "Project Name"
