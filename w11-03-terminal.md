
# Configurações extras no Windows

> **Date**: *17/06/2022*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

- [Configurações extras no Windows](#configurações-extras-no-windows)
  - [Alterando algumas configurações do Terminal Windows](#alterando-algumas-configurações-do-terminal-windows)
    - [Mudando o diretório padrão dos shells](#mudando-o-diretório-padrão-dos-shells)
    - [Inserindo o Git Bash no Terminal Windows](#inserindo-o-git-bash-no-terminal-windows)

## Alterando algumas configurações do Terminal Windows

### Mudando o diretório padrão dos shells

> **Referência**: https://github.com/microsoft/terminal/issues/2743 | https://goulet.dev/posts/how-to-set-windows-terminal-starting-directory/

> Por padrão, o terminal do Windows inicia o shell no diretório do usuário no Windows, independente de qual será aberto (PowerShell, CMD, Git Bash, Ubuntu, ...). No shell Windows em `C:\Users\<usuario>`, no shell Ubuntu em `/mnt/c/Users/<usuario>`, no Git Bash em `/c/Users/<usuario>`.

Para mudar o diretório, devemos alterar as configurações do Terminal Windows que fica em `C:\Users\haroldocruz\AppData\Local\Packages\Microsoft.WindowsTerminal_<hash-do-seu-terminal>\LocalState\settings.json`, acrescentando a seguinte linha `"startingDirectory": "//wsl$/Ubuntu/home/<usuario>"`

```json
{
    ...
    "profiles": {
        ...
        "list": [
            ...
            {
                "guid": "{2c4de342-38b7-51cf-b940-2309a097f518}",
                "hidden": false,
                "name": "Ubuntu",
                "source": "Windows.Terminal.Wsl",
                "startingDirectory": "//wsl$/Ubuntu/home/<usuario>"
            },
            ...
        ]
    }
    ...
}
```

**Nota**: *Neste exemplo o diretório inicial do shell do Ubuntu foi alterado para o diretório do usuário dentro do próprio Ubuntu.*

### Inserindo o Git Bash no Terminal Windows

> **Referência**: https://medium.com/@leonardosilvadev/usando-git-bash-como-aba-no-windows-terminal-d99ef6714ade

> Para inserir um novo shell devemos ter um id único para atribuir ao novo shell.

No PowerShell, execute este comando para gerar um id único e guarde-o, pois no próximo passo iremos inseri-lo como valor em um atributo chamado `"guid"`:

```PowerShell
[guid]::NewGuid()
```

Abra as configurações do Terminal (<kbd>ctrl</kbd> + <kbd>,</kbd>) e insira este bloco de código dentro, observando a hierarquia de configurações do arquivo:

```json
{
    ...
    "profiles": {
        ...
        "list": [
          ...
            {
                "guid": "{<id-gerado-no-powershell>}",
                "hidden": false,
                "name": "GIT BASH",
                "commandline": "C:\\Windows\\System32\\cmd.exe /c \"C:\\Program Files\\Git\\bin\\sh.exe\" --cd-to-home",
                "icon": "%SystemDrive%\\Program Files\\Git\\mingw64\\share\\git\\git-for-windows.ico"
            }
            ...
        ]
    }
    ...
}
```

**Nota**: *Se atente aos valores do atributo `"commandLine"` e `"icon"` pois eles podem variar, dependendo do caminho de instalação do git*

> Depois destes passos, é só verificar no Terminal, na seta de abrir novas abas/guias que o Git Bash deverá estar disponível.

---
