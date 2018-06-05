# Useful Git Stuff

## Aliases

[**git stash-rename**](http://stackoverflow.com/a/25935360/5173025) Usage: `git stash-rename stash@{2} Nuke-files`.

    git config --global alias.stash-rename '!_() { rev=$(git rev-parse $1) && git stash drop $1 || exit 1 ; git diff-index --quiet HEAD; s=$?; [ $s != 0 ] && git stash save "tmp stash from stash-rename"; git stash apply $rev && shift && git stash save "$@" && [ $s != 0 ] && git stash pop stash@{1}; }; _'
    
**git where** - show current branch

    git config --global alias.where "rev-parse --abbrev-ref HEAD"

**git tree** - show log as a tree

    git config --global alias.tree "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


## Config

    mkdir -p ~/.config/git
    git config --global user.email QasimK@users.noreply.github.com
    git config --global user.name QasimK
    git config --global push.default simple
    git config --global core.excludesfile ~/.config/git/gitignore
    git config --global commit.template ~/.config/git/commitmessage

Create `~/.config/git/gitignore` with

    *.sublime-project
    *.sublime-workspace
