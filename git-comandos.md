
# GIT - COMANDOS ÚTEIS

### Para obter todas as remote branchs em seu repositorio local

Estes comando deverão ser executados na pasta do projeto

```sh
git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done 
```

```sh
git remote set-branches --add origin *
git fetch origin
```

```sh
# altera a referência para que o 'fetch' atenda a todas as branchs do diretorio remoto
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
# 
git fetch origin
```

> Todas as alterações serão refletidas no arquivo `.git/config` do diretório do projeto.

### `.gitignore` Ignorar arquivos ou pastas inteiras já monitoradas (`tracked`):

Por vezes, queremos remover uma pasta de algum projeto por um motivo qualquer (como transferir algum recurso para uma `lib`), para isso é necessário realizar alguns comandos. 

**Removendo um simples arquivo:**
```sh
git rm --cached <file>
git commit -m "<Message>"
```

**Removendo uma pasta inteira:**
```sh
git rm --cached -r <folder>
git commit -m "<Message>"
```

**Removendo todos os arquivos/pastas que já estejam no arquivo `.gitignore`:**

```sh
git rm -r --cached .
git add .
git commit -m "Removes all .gitignore files and folders"
```