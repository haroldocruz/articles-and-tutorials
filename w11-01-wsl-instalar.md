
# Configurando um ambiente de desenvolvimento produtivo no Windows com WSL e Docker

> **Date**: *17/06/2022*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

  - [Passos para instalar o WSL 2 no Windows (resumo)](#passos-para-instalar-o-wsl-2-no-windows-resumo)
    - [Configurações extras](#configurações-extras)
  - [Passos para instalar o Docker (nativo) no Ubuntu WSL](#passos-para-instalar-o-docker-nativo-no-ubuntu-wsl)
  - [Passos para instalar o Oh My Zsh](#passos-para-instalar-o-oh-my-zsh)
    - [Gerenciando plugins do ZSH com ZInit](#gerenciando-plugins-do-zsh-com-zinit)

## Passos para instalar o WSL 2 no Windows (resumo)

> **Referência**: https://docs.microsoft.com/pt-br/windows/wsl/install

> **Pre-requisitos**:
> • Windows 10 versão 2004 ou superior (Build 19041 ou superior) ou o Windows 11
> • 8Gb RAM

Inicialmente, apenas o CLI do WSL está disponível. Portanto o primeiro passo é instalar os módulos pendentes.

Abra o *PowerShell* em modo Administrador (Você pode usar o atalho `Winkey` + `x` e depois pressionar `a`) e digite o comando:

```PowerShell
wsl --install
```

>**Este comando irá instalar:**
• Plataforma de Máquina Virtual;
• Subsistema do Windows para Linux;
• WSL Kernel;
• Suporte a aplicativos GUI;
• Ubuntu (Distribuição Linux).

**Nota**: *Poderá ser solicitado a reinicialização do sistema*.

Para visualizar o nome das distribuições Linux disponíveis, use este comando:

```PowerShell
wsl --list --online
```

E para instalar uma distribuição:

```PowerShell
wsl --install -d <nome-da-distribuição>
```

**Nota**: *Você pode ter quantas distribuições desejar. Inclusive versões diferentes da mesma distro*.

### Configurações extras

O WSL tem acesso a todo o recurso de sua máquina, o que pode acarretar em travamentos inesperados. Para contornar isso, devemos criar um arquivo na pasta do usuário corrente com o nome `.wslconfig`, com as seguintes configurações:

```ini
# C:\Users\<usuario>\.wslconfig

[wsl2]
memory=6GB
processors=2
swap=2GB
```

## Passos para instalar o Docker (nativo) no Ubuntu WSL

> **Referência**: https://github.com/codeedu/wsl2-docker-quickstart#1---instalar-o-docker-com-docker-engine-docker-nativo

Antes da instalação do docker, precisamos instalar alguns recursos na nossa distro (as distros para WSL vêm com o mínimo de pacotes necessários):

```bash
# atualizar lista de fontes: atualizando as referências do gerenciador de pacotes novamente
sudo apt update && sudo apt upgrade

# remover sujeira: limpar qualquer rastro de instalações do Docker anteriores
sudo apt remove docker docker-engine docker.io containerd runc

# instalar dependências: instalando algumas dependências de segurança
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

**Nota**: *Observe que foi inserido um comando para limpar qualquer instalação do Docker que possa ter sido realizada anteriormente*.

Agora sim, vamos instalar o Docker nativamente:

```bash
# baixar nova fonte: baixando referências aos pacotes do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# adicionar nova fonte: adicionando o repo do Docker na lista de sources do Ubuntu
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# atualizar lista de fontes: atualizando as referências do gerenciador de pacotes novamente
sudo apt update

# instalar pacotes: instalando os pacotes necessários do Docker
sudo apt install docker-ce docker-ce-cli containerd.io

# modificar conta do usuário: adicionando o usuário corrente ao grupo "docker"
sudo usermod -aG docker $USER
```

### Instalando o Docker Compose

```bash
# baixar nova fonte: baixando referências aos pacotes de Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# modificar permissão: dando permissão de execução na pasta do Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar link: criando um link para o comando docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```
O Docker e Docker Compose estão finalmente instalados e prontos para serem usados. Para iniciar o Docker Service, faça:

```bash
sudo service docker start
```

**Nota**: *O serviço Docker deverá ser sempre iniciado após a reinicialização do WSL*.

## Passos para instalar o Oh My Zsh

> **Referência**: https://github.com/ohmyzsh/ohmyzsh#unattended-install | https://github.com/zsh-users

> Oh My Zsh é apenas um framework do ZSH, por isso, devemos instalar o ZSH primeiro.

Para instalar o ZSH, o seguinte comando já resolve:

```bash
sudo apt install zsh
```

Agora para instalar o Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

**Nota**: *O arquivo de configuração fica em `~/.zshrc`*.

> Para mudar o tema utilizado, acesse o arquivo `~/.zshrc` com algum editor e altere a linha:

```ini
# ~/.zshrc

ZSH_THEME="<nome-do-tema>"
```

> Os temas ficam localizados em `$HOME/.oh-my-zsh/themes`, caso pense em modificar algum.

### Gerenciando plugins do ZSH com ZInit

> O ZInit facilita a instalação e remoção de plugins no Zsh, por isso devemos utilizá-lo aqui.

Para instalar o ZInit, usaremos este comando:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

**Nota**: *Para usar o comando `zinit` pode ser necessário reiniciar o terminal*.

Agora poderemos instalar estes plugins que ajudarão bastante no desempenho e produtividade:

```bash
zinit light zsh-users/zsh-syntax-highlighting && \
zinit light zsh-users/zsh-autosuggestions && \
zinit light zsh-users/zsh-completions && \
zinit light zsh-users/zsh-history-substring-search
```

> `zsh-users/zsh-syntax-highlighting`: Este pacote fornece realce de sintaxe para o shell zsh. Ele permite o destaque de comandos enquanto eles são digitados em um prompt zsh em um terminal interativo. Isso ajuda na revisão de comandos antes de executá-los, principalmente na captura de erros de sintaxe.
>
> `zsh-users/zsh-autosuggestions`: Este pacote sugere comandos conforme você digita com base no histórico e nas conclusões.
>
> `zsh-users/zsh-completions`: Este pacote ajuda a completar comandos. Ele reune novos scripts de finalização que ainda não estão disponíveis no histórico do Zsh. Os scripts podem ser contribuídos para o projeto Zsh quando estiverem suficientemente estáveis.
>
> `zsh-users/zsh-history-substring-search`: Este pacote permite digitar qualquer parte de qualquer comando do histórico e pressionar as teclas escolhidas, como as setas PARA CIMA e PARA BAIXO, para alternar entre as correspondências.
