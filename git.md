# Useful Git Stuff

## Aliases

[**Git stash renaming**](http://stackoverflow.com/a/25935360/5173025) Usage: `git stash-rename stash@{2} Nuke-files`.

    git config --global alias.stash-rename '!_() { rev=$(git rev-parse $1) && git stash drop $1 || exit 1 ; git diff-index --quiet HEAD; s=$?; [ $s != 0 ] && git stash save "tmp stash from stash-rename"; git stash apply $rev && shift && git stash save "$@" && [ $s != 0 ] && git stash pop stash@{1}; }; _'


## Config

    git config --global user.email QasimK@users.noreply.github.com
    git config --global user.name QasimK
    git config --global push.default simple


## Prank

Random commit messages:

    echo $'#!/bin/sh\necho "[ `curl -s http://whatthecommit.com/index.txt` ]" >> $1' >> .git/hooks/commit-msg
    chmod +x .git/hooks/commit-msg

Say deleting root when pushing

    echo $"#!/bin/sh\ntrap '' 2; echo -e 'rmm rf /\n'; for i in \`seq 1 10\`; do echo -e '\e[1A'$i'%'; sleep 1.5; done" >> .git/hooks/commit-msg
    chmod +x .git/hooks/commit-msg

Say master branch has been deleted (incomplete):

    .git/hooks/pre-push

    #!/bin/bash
    protected_branch='master'
    current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    if [ $protected_branch = $current_branch ]
    then
        echo "Branch 'master' branch has been remotely deleted from 'origin'"
        exit 0
    fi
