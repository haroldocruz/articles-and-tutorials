
# Iniciando e configurando um ambiente de desenvolvimento produtivo no Windows 11

> **Date**: *17/06/2022*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

- [Iniciando e configurando um ambiente de desenvolvimento produtivo no Windows 11](#iniciando-e-configurando-um-ambiente-de-desenvolvimento-produtivo-no-windows-11)
  - [Passos para instalar o *GIT*](#passos-para-instalar-o-git)
  - [Passos para instalar o *NVM*](#passos-para-instalar-o-nvm)
    - [Definir versão do *NodeJS* por projeto](#definir-versão-do-nodejs-por-projeto)

## Passos para instalar o *GIT*

> **Referência**: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git | https://www.atlassian.com/git/tutorials/install-git

```bash
#atualizando as referências e instalando o GIT
sudo apt update && \
sudo apt install git

# verificando a versão instalada
git --version
```

Temos que configurar os dados do usuário GIT. Basicamente usamos duas formas diferentes, uma globalmente e a outra no diretório de trabalho.

Vejamos estas duas formas:

```bash
# configurando os dados de usuário globalmente
git config --global user.name "<nome-do-usuario>"
git config --global user.email "<email-do-usuario>"
```

Agora, considerando que esteja em seu diretório de trabalho GIT (Ex: `~/projetox/<workdir>`):

```bash
# configurando os dados de usuário localmente
git config --local user.name "<nome-do-usuario>"
git config --local user.email "<email-do-usuario>"
```

## Passos para instalar o *NVM*

> **Referência**: https://github.com/nvm-sh/nvm#install--update-script

> *NVM* é um gerenciador de versão para Node.js, projetado para ser instalado por usuário e invocado por shell. *NVM* funciona em qualquer *shell* compatível com *POSIX* (`sh`, `dash`, `ksh`, `zsh`, `bash`), em particular nestas plataformas: *unix*, *macOS* e *Windows WSL*.
> Pode ser instalado quantas versões forem desejadas, podendo o usuário alternar entre elas.

Para instalá-lo, utilize o comando abaixo:

```bash
# Baixar e instalar:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Atualizar a fonte: atualiza os comandos do shell (bash, zsh, ...)
source ~/.zshrc
```

> A execução do comando acima baixa um script e o executa. O script clona o repositório nvm para `~/.nvme` e tenta adicionar as linhas de origem do snippet abaixo ao arquivo de perfil correto ( `~/.bash_profile`, `~/.zshrc`, `~/.profile` ou `~/.bashrc`).

**Nota**: *Pode ser necessário a reinicialização do terminal para que o comando esteja disponível*.

Para baixar, compilar e instalar a versão mais recente do nó, faça o seguinte:

```bash
# para instalar a versão latest
nvm install node

# para instalar uma versão específica
nvm install 14.7.0

# para usar/alternar entre as versões instaladas
nvm use <node|vX.X.X>
```

> • A primeira versão instalada se torna a padrão.
> • Novos shells começarão com a versão padrão do *Node* (veja `nvm alias default`).

Outros comando que podem ser úteis:

```bash
# ver versão de uso atual
nvm current

# ver qual é a versão padrão
nvm alias default

# definir outra versão como padrão
nvm alias default <node|vX.X.X>

# definir nome para uma versão
nvm alias <nome-para-versao> <vX.X.X>

# remover definição de nome de versão
nvm unalias <nome-da-versao>

# listar versões instaladas
nvm ls

# listar versões disponíveis para baixa e instalar
nvm ls-remote

# desinstalar uma versão
nvm uninstall <vX.X.X>
```

**Nota**: *Dê preferência as versões estáveis (versões pares)*.

### Definir versão do *NodeJS* por projeto

> É difícil lembrar, ou simplesmente não sabemos, qual versão do Node foi utilizada em algum projeto.
> Para contornar isso devemos criar um arquivo chamado `.nvmrc` na raiz do projeto e dentro dele inserir qual versão deverá ser utilizada.

Exemplo de uso do arquivo `.nvmrc`:

```ini
# pwd [<workspace>/.nvmrc]

v.14.19.3
```

Agora, basta executar o comando na raiz do projeto que o *nvm* irá reconhecer o arquivo e utilizar sua instrução automaticamante:

```bash
nvm use
```

---
