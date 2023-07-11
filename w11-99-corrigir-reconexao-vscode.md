
# Iniciando e configurando um ambiente de desenvolvimento produtivo no Windows 11

> **Date**: *17/06/2022*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*
Stop the LxssManager service.
Enable and start the hns service.
Start the WSL 2 instance, e.g. by launching wsl.
The hns service can now be stopped and disabled again.
For convenience, this following script (save to a .bat file and run as elevated) can be used to do all the 4 steps above:

```powershell
net stop LxssManager
sc config hns start= auto
net start hns

# replace the line below if your default WSL distro is not WSL 2
wsl false

net stop hns
sc config hns start= disabled
```