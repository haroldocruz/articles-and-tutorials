
# Lista de comandos uteis para Devs

> **Date**: *20/09/2022*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

  - [Passos para instalar o WSL 2 no Windows (resumo)](#passos-para-instalar-o-wsl-2-no-windows-resumo)
    - [Configurações extras](#configurações-extras)
  - [Passos para instalar o Docker (nativo) no Ubuntu WSL](#passos-para-instalar-o-docker-nativo-no-ubuntu-wsl)
  - [Passos para instalar o Oh My Zsh](#passos-para-instalar-o-oh-my-zsh)
    - [Gerenciando plugins do ZSH com ZInit](#gerenciando-plugins-do-zsh-com-zinit)

## Remover todos as pastas _node_modules_ recursivamente

> **Referência**: https://marquesfernandes.com/desenvolvimento/como-deletar-recursivamente-todos-as-pastas-node_modules-do-windows-linux-e-mac/


Inicialmente, apenas o CLI do WSL está disponível. Portanto o primeiro passo é instalar os módulos pendentes.

Para o *Windows* com o *PowerShell*:

```PowerShell
Get-ChildItem -Path "." -Include "node_modules" -Recurse -Directory | Remove-Item -Recurse -Force
```

Para o *Linux* e *Mac*:
```
 cd projects
$ find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;
```

>**Este comando irá:**
• Percorrer todas as pastas, recursivamente, e a partir da pasta atual, apagando as que tiverem o nome *node_modules*.

