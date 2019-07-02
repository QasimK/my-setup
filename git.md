# Useful Git Stuff

## Useful Commands

* Delete branches that have been deleted on origin (i.e. merged + deleted): `git remote prune origin --dry-run`

## Hooks

* [Prevent pushes to master](https://blog.ghost.org/prevent-master-push/) by placing this file in your project's `.git/hooks/pre-push` and `chmod +x .git/hooks/pre-push`.

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
