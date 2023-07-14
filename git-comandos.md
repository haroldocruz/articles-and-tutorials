
# GIT - COMANDOS ÚTEIS

## Para obter todas as branchs em seu repositorio local
```sh
git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done 
```

```sh
# To add another remote branch to my local repository that was cloned using --single-branch, the following works for me:
git remote set-branches --add origin *
git fetch origin
```
*Este outro comando tem um resultado semelhante*
```sh
# To add another remote branch to my local repository that was cloned using --single-branch, the following works for me:
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch origin
```