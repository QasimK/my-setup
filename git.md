# Useful Git Stuff

## Aliases

[**git stash-rename**](http://stackoverflow.com/a/25935360/5173025) Usage: `git stash-rename stash@{2} Nuke-files`.

    git config --global alias.stash-rename '!_() { rev=$(git rev-parse $1) && git stash drop $1 || exit 1 ; git diff-index --quiet HEAD; s=$?; [ $s != 0 ] && git stash save "tmp stash from stash-rename"; git stash apply $rev && shift && git stash save "$@" && [ $s != 0 ] && git stash pop stash@{1}; }; _'
    
**git where** - show current branch

    git config --global alias.where "rev-parse --abbrev-ref HEAD"


## Config

    git config --global user.email QasimK@users.noreply.github.com
    git config --global user.name QasimK
    git config --global push.default simple
    git config --global core.excludesfile ~/.gitignore

Create `~/.gitignore` with

    *.sublime-project
    *.sublime-workspace
