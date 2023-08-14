#!/bin/bash


echo "...INSTALANDO GIT..."
echo "# atualizar as referências"
sudo apt update
echo "# instalar o GIT"
sudo apt install git


echo "...INSTALANDO VSCODE..."
# sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# sudo apt update
# sudo apt install code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders


echo "...INSTALANDO DOCKER..."
echo "# atualizar lista de fontes: atualizando as referências do gerenciador de pacotes novamente"
sudo apt update -y && sudo apt upgrade -y

echo "# remover sujeira: limpar qualquer rastro de instalações do Docker anteriores"
sudo apt remove docker docker-engine docker.io containerd runc

echo "# instalar dependências: instalando algumas dependências de segurança"
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    

echo "# baixar nova fonte: baixando referências aos pacotes do Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "# adicionar nova fonte: adicionando o repo do Docker na lista de sources do Ubuntu"
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "# atualizar lista de fontes: atualizando as referências do gerenciador de pacotes novamente"
sudo apt update

echo "# instalar pacotes: instalando os pacotes necessários do Docker"
sudo apt install docker-ce docker-ce-cli containerd.io -y

echo "# modificar conta do usuário: adicionando o usuário corrente ao grupo 'docker'"
sudo usermod -aG docker $USER


echo "...INSTALANDO ZSH | OH MY ZSH | PLUGINS..."
echo "# instalar o Zsh"
sudo apt install zsh -y

echo "# instalar o Oh My Zsh"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -n

echo "# instalar plugins uteis para Oh My Zsh com ZInit"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
echo "zinit light zsh-users/zsh-syntax-highlighting" >> ~/.zshrc
echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
echo "zinit light zsh-users/zsh-history-substring-search" >> ~/.zshrc

echo "# atualizar o shell"
source ~/.bashrc


echo "...INSTALANDO NVM..."
echo "# Baixar e instalar:"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "# Atualizar a fonte: atualiza os comandos do shell (bash, zsh, ...)"
source ~/.bashrc

echo "# Instalar NodeJS LTS com NVM"
nvm install --lts

echo "...INSTALANDO UNGIT..."
npm i ungit -g

echo "...INSTALANDO DCONF-EDITOR..."
sudo apt install dconf-editor
