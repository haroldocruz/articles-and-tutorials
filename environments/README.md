### Como carregar um ambiente

Execute o comando conforme o exemplo:
```sh
mkdir -p ~/projects/ikhon/psd && \
cd ~/projects/ikhon/psd && \
curl -o- https://raw.githubusercontent.com/haroldocruz/articles-and-tutorials/main/environments/quickstart-cee-sigas.sh | sh -s -- -b develop
```

Mas, caso esteja utilizando o shell ZSH, você pode preferir com o comando `take`, que simplifica um pouco o script:
```sh
take ~/projects/ikhon/psd && \
curl -o- https://raw.githubusercontent.com/haroldocruz/articles-and-tutorials/main/environments/quickstart-cee-sigas.sh | sh -s -- -b develop
```

Qualquer dos comandos anteriores realizará os seguintes passos:
- criar o diretório (caso não exista) do projeto;
- baixar o script
- executar o script com o shell especificado (repassando o qual branch comum dos diretórios deverá clonar).
