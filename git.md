# Useful Git Stuff

    git config --global user.email noreply@QasimK.io
    git config --global user.name QasimK
    git config --global push.default simple
    git config --global core.excludesfile ~/.config/git/gitignore
    git config --global commit.template ~/.config/git/commit.template
    git config --global alias.stash-rename '!_() { rev=$(git rev-parse $1) && git stash drop $1 || exit 1 ; git diff-index --quiet HEAD; s=$?; [ $s != 0 ] && git stash save "tmp stash from stash-rename"; git stash apply $rev && shift && git stash save "$@" && [ $s != 0 ] && git stash pop stash@{1}; }; _'
    git config --global alias.where "rev-parse --abbrev-ref HEAD"
    git config --global alias.tree "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.slap 'blame -w -M'

Run `gogo.sh` to get the `gitignore` and `commit.template` files.

## Alias Glossary

* [**git stash-rename**](http://stackoverflow.com/a/25935360/5173025) Usage: `git stash-rename stash@{2} Nuke-files`.
* **git where**: show current branch
* **git tree**: show log as a tree
* [**git slap**](https://stackoverflow.com/a/44827367): git annotate ignoring formatting changes

## Hooks

* Prevent pushes to master by placing this file in your project's `.git/hooks/pre-push` and `chmod +x .git/hooks/pre-push`.

```sh
#!/bin/sh

protected_branch='master'
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [ $protected_branch = $current_branch ]
then
    read -p "You're about to push master, is that what you intended? [y|n] " -n 1 -r < /dev/tty
    echo
    if echo $REPLY | grep -E '^[Yy]$' > /dev/null
    then
        exit 0 # push will execute
    fi
    exit 1 # push will not execute
else
    exit 0 # push will execute
fi
```
