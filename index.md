
**SUMÁRIO**

- [Configurando um ambiente de desenvolvimento produtivo no Windows com WSL e Docker](w11-01-wsl-instalar.md)
- [Iniciando e configurando um ambiente de desenvolvimento produtivo no Windows 11](w11-02-dev-env-quickstart.md)
- [Configurações extras no Windows](w11-03-terminal.md)
- [Configurações extras no VSCode](w11-04-vscode-config-quickstart.md)
- [Trabalhando produtivamente com Docker](wsl-01-docker.md)

**1º PASSO**: Usando o PowerShell:
```PowerShell
# instalar o WSL e a versão mais recente do Ubuntu WSL oficial
wsl --install

# instalar o Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# instalar os pacotes necessário usando o Chocolatey
choco install -y 7zip git openvpn vscode googlechrome googledrive greenshot obs-studio obs-virtualcam obs-move-transition office365proplus --params '/Language=pt-br' foxitreader winrar rainmeter rocketdock

# configurando os dados de usuário globalmente
git config --global user.name "Haroldo Cruz"
git config --global user.email "haroldocruzdr@gmail.com"
```

**2º PASSO**: Usando o WSL Ubuntu:
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

##### DOCKER #####
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

##### DOCKER COMPOSE #####
# # baixar nova fonte: baixando referências aos pacotes de Docker Compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# # modificar permissão: dando permissão de execução na pasta do Docker Compose
# sudo chmod +x /usr/local/bin/docker-compose

# # Criar link: criando um link para o comando docker-compose
# sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

##### ZSH + ZINIT #####
sudo apt install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

##### GIT #####
sudo apt install git

# configurando os dados de usuário globalmente
git config --global user.name "Haroldo Cruz"
git config --global user.email "haroldocruzdr@gmail.com"

##### NVM #####
# Baixar e instalar:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Atualizar a fonte: atualiza os comandos do shell (bash, zsh, ...)
source ~/.zshrc

# para instalar uma versão específica
nvm install 16

##### PORTAINER #####
# baixando a imagem
docker pull portainer/portainer-ce

# criando um volume para armazenamento dos dados
docker volume create portainer_data

# criando e executando um container
docker run -d --name portainer --restart=always \
-p 9440:9000 -p 9443:9443 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce

##### PROJECTS-DEVELOPMENT #####
mkdir -p ~/projects/psd
cd ~/projects/psd
git clone --branch main http://192.168.33.117/psd/deploy ./deploy

cd ~/projects/psd/deploy
sudo chmod -R 744 ./git_clone_all.sh
sudo chmod -R 744 ./git_pull_all.sh

git config --local user.name "Haroldo Cruz"
git config --local user.email "haroldo.cruz@ikhon.com.br"
git config --local credential-helper store
echo "haroldo.cruz:Lu1691gb\$@192.168.33.117" > ~/.credential-helpers

cd ~/projects/psd/deploy
./git_clone_all.sh | bash
```

3º PASSO: Tarefas manuais:
- No Windows:
  - login no One Drive (haroldo.cruz|haroldocruzdr)
  - configurar BKP automático nas pastas padrão (Desktop, Documents, Images)
  - login no Google Drive (msom.info|haroldocruzdr)
- No Linux:
  - criação de usuário e senha no Portainer
  - selecionar o tema half-life no ~/.zshrc
  - configurar o tema half-life no ~/.oh-my-zsh/themes/half-life.zshtheme
  - inserção do script do ZInit no ~/.zshrc