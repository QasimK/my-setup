# Funny

## Good variable name generator

    printf v; cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 6 | head -n 1


## Gradually deteriorating shell

    echo 'echo "sleep 0.5" >> ~/.bashrc' >> ~/.bashrc


## Random commit messages

    echo $'#!/bin/sh\necho "[ `curl -s http://whatthecommit.com/index.txt` ]" >> $1' >> .git/hooks/commit-msg
    chmod +x .git/hooks/commit-msg


## Say deleting root when commiting

    echo "#""!""/bin/sh" >> .git/hooks/commit-msg
    echo "trap '' 2; echo 'rm -rf /';" >> .git/hooks/commit-msg
    echo 'for i in `seq 0 100`; do echo $i%; sleep 1; done' >> .git/hooks/commit-msg
    chmod +x .git/hooks/commit-msg


## Say master branch has been deleted (incomplete)

    .git/hooks/pre-push

    #!/bin/bash
    protected_branch='master'
    current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
    if [ $protected_branch = $current_branch ]
    then
        echo "Branch 'master' branch has been remotely deleted from 'origin'"
        exit 0
    fi

## Greek Semicolon

Here it is: `;`

## Python Valid Apostrophe

TODO: Find char.

## Links

https://medium.com/feature-creep/the-software-engineer-s-guide-to-asserting-office-dominance-ddea7b598df7
https://git-man-page-generator.lokaltog.net/
