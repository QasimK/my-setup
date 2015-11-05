# Useful Git Stuff

## Aliases

[Git stash renaming](http://stackoverflow.com/a/25935360/5173025). Usage: `git stash-rename stash@{2} Nuke-files`.

    `git config --global alias.stash-rename '!_() { rev=$(git rev-parse $1) && git stash drop $1 || exit 1 ; git diff-index --quiet HEAD; s=$?; [ $s != 0 ] && git stash save "tmp stash from stash-rename"; git stash apply $rev && shift && git stash save "$@" && [ $s != 0 ] && git stash pop stash@{1}; }; _'`
