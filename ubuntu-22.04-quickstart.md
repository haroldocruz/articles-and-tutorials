
# Preparação do ambiente Ubuntu 22.04

> **Date**: *21/06/2023*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

## Novo usuário

> **Referência**: https://irias.com.br/blog/como-criar-um-usuario-no-linux-pelo-terminal/

```sh
# criar novo usuario
sudo useradd -m haroldo

# alterar o shell padrão do usuario
sudo chsh -s /bin/zsh haroldo

# criar usuario e alterar o shell padrão
sudo useradd -m -s /usr/bin/zsh haroldo

# adicionar o usuario no grupo 'sudo'
sudo usermod -aG sudo haroldo

# definir uma nova senha para o usuario
sudo passwd haroldo

# acessar shell como outro usuario
su - haroldo

# acessar como root
sudo su
```

## Ativar memória SWAP
> **Referência**: https://www.digitalocean.com/community/tutorials/como-adicionar-espaco-de-swap-troca-no-ubuntu-18-04-pt

```sh
sudo swapoff -a
sudo mkdir /home/.swap
# sudo fallocate -l 16G /swapfile
# sudo dd if=/dev/zero of=/swapfile bs=1G count=16
sudo dd if=/dev/zero of=/home/.swap/swapfile bs=1M count=16000 status=progress

# alterar permissões
sudo chmod 600 /home/.swap/swapfile

# marcar o arquivo como espaço de swap
sudo mkswap /home/.swap/swapfile

# habilitar o arquivo de swap
sudo swapon /home/.swap/swapfile

# Verifique se o swap está disponível digitando:
sudo swapon --show
```
#### Próximo passo – Tornando o Arquivo de Swap Permanente
> Os comandos anteriores habilitaram o arquivo de `swap` para a sessão atual. No entanto, o PC for reiniciado, o swap deverá ser habilitado novamente. Para que o swap se mantenha sempre habilitado, é necessário adicioná-lo nas configurações do arquivo `/etc/fstab`.

Os comandos seguintes resolvem isso:

```sh
# fazer um backup do arquivo /etc/fstab para o caso de algo dar errado:
sudo cp /etc/fstab /etc/fstab.bak

# adicionar informação do arquivo de swap no final do arquivo /etc/fstab:
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

#### Proximo passo – Ajustando as Configurações de Swap

> Há algumas opções que você pode configurar que terão um impacto no desempenho do seu sistema quando estiver lidando com o swap.

```sh
# ver o valor atual do parâmetro swappiness (default = 60):
cat /proc/sys/vm/swappiness

# definir o valor do parâmetro swappiness em 10 (somente na sessão atual):
sudo sysctl vm.swappiness=10

# OU definir valor 10 automaticamente na reinicialização, adicionando a linha no nosso arquivo /etc/sysctl.conf:
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
```

#### Proximo passo – Ajustando a Configuração da Pressão por Cache

> Outro valor relacionado que você pode querer modificar é o `vfs_cache_pressure`. Este ajuste configura o quanto o sistema escolherá para as informações cache dos objetos inode e dentry em detrimento de outros dados.

Por padão, o valor vem configurado em 100, isso quer dizer que o sistema removerá as informações de inode do cache muito rapidamente. Talvez uma configuração mais conservadora possa ajudar, baixando o valor para 50, por exemplo:


```sh
# ver o valor atual do parâmetro swappiness (default = 100):
cat /proc/sys/vm/vfs_cache_pressure

# definir o valor do parâmetro vfs_cache_pressure em 50 (somente na sessão atual):
sudo sysctl vm.vfs_cache_pressure=50

# OU definir valor 50 automaticamente na reinicialização, adicionando a linha no nosso arquivo /etc/sysctl.conf:
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.conf
```

## Atribuir permissões corretas nos arquivos e pastas do diretório /home/$USER/.ssh

```sh
# criar o diretorio /home/<user>/.ssh, caso não exista
mkdir -p ~/.ssh

chmod -R go= ~/.ssh

# criar chave publica e privada (basica para conexões SSH)
ssh-keygen -q -b 2048 -P "" -f ~/.ssh/keys/192.168.33.119_rsa -t rsa

# testar a conexão
ssh -T git@192.168.33.119

echo public_key_string >> ~/.ssh/authorized_keys

```


## Instalar DBeaver

```sh
sudo snap install dbeaver-ce
```