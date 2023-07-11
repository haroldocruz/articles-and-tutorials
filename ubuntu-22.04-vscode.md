
# Preparação do ambiente Ubuntu 22.04

> **Date**: *21/06/2023*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

## Instalar VS Code

> **Referência**: https://www.edivaldobrito.com.br/como-instalar-o-visual-studio-code-no-ubuntu-20-04-lts-e-derivados/

```sh
# conferir se o sistema é de 64 bits
uname -m

# caso o sistema for de 64 bits, adicionar o repositório do VSCode
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# baixar e instalar a chave do repositório
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

# atualize o gerenciador de pacotes
sudo apt update

# instalar o VSCode
sudo apt install code
```