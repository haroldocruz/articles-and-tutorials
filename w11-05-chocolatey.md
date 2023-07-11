
# Instalando pacotes no Windows 11

> **Date**: *19/06/2022*
> **Author**: *Haroldo Cruz*
> **PC**: *Notebook Dell Vostro 15 5510 | Windows 11*

**SUMÁRIO**

- [Instalando pacotes no Windows 11](#instalando-pacotes-no-windows-11)
  - [Gerenciando pacotes com o Chocolatey](#gerenciando-pacotes-com-o-chocolatey)
    - [Instalando alguns pacotes necessários](#instalando-alguns-pacotes-necessários)

## Gerenciando pacotes com o Chocolatey

> **Referência**: https://chocolatey.org

> Chocolatey é um gerenciador de pacotes para o Windows em CLI. Com ele podemos instalar um ou vários programas com um simples comando.

Para instalar o Chocolatey, abra o Terminal com PowerShell (<kbd>WinKey</kbd> + <kbd>x</kbd> depois <kbd>a</kbd>), e digite ou cole este comando:

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### Instalando alguns pacotes necessários

> Pensando em um ambiente para devs JS, foram selecionados os seguintes pacotes:
> • Git
> • Google Chrome
> • VS Code
> <font-red-small>*Recomendo a instalação de outros pacotes, como NodeJS, no WSL.*</font-red-small>

O próximo comando instalará os pacotes listados acima:

```PowerShell
choco install -y git googlechrome vscode
```

Aqui está o comando com os pacotes da minha coleção:

```PowerShell
choco install -y 7zip foxitreader git googlechrome googledrive greenshot obs-move-transition obs-studio obs-virtualcam openvpn rainmeter rocketdock vscode winrar office365proplus --params '/Language=pt-br'
```

---

<style>
    font-red-small { color: red; font-size: 75% }
    font-yellow { color: yellow }
</style>
