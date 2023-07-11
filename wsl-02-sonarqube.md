
# SonarQube e SonarScanner

> **Date**: *17/06/2022*
> **Author**: *Haroldo Cruz*
> **PC1**: *Notebook Xiaomi Mi Air 13.3 | Windows 10 + WSL 2 + Ubuntu 20.04*
> **PC2**: *Notebook Dell Vostro 15 5510 | Windows 11 + WSL 2 + Ubuntu 22.04*

**SUMÁRIO**

- [Iniciando e configurando um ambiente de desenvolvimento produtivo no Windows 11](#iniciando-e-configurando-um-ambiente-de-desenvolvimento-produtivo-no-windows-11)
  - [Passos para instalar o *Sonar Scanner*](#passos-para-instalar-o-sonar-scanner)

## SonarQube

> **Referência**: https://docs.sonarqube.org/latest/

> O SonarQube é uma ferramenta de revisão automática de código para detecção de bugs, vulnerabilidades e code smells (farejamento de código ruim). Ele pode ser integrado ao seu fluxo de trabalho existente para permitir a inspeção contínua de código em todas as ramificações do projeto e solicitações pull.

> 

### Passos para instalar o *Sonar Scanner*

> **Referência**: https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/

```sh
npm install --location=global sonarqube-scanner
```

```sh
#!/bin/bash

sonar-scanner \
  -Dsonar.projectKey=PED-Web-Angular \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=sqp_3cae1a8ee4d8f0a83aa309140a1644d57c84e670
```

ou instale como uma *dev-dependency*

```sh
npm install -D sonarqube-scanner
```

```ini
# <workdir>/sonar-project.properties

sonar.projectKey=PED-Web-Angular
sonar.login=sqp_3cae1a8ee4d8f0a83aa309140a1644d57c84e670
```

```sh
# <workdir>/sonar-project.js

const sonarqubeScanner = require('sonarqube-scanner');
sonarqubeScanner({
  serverUrl: 'http://localhost:9000',
  options: {
    'sonar.sources': 'src',
    'sonar.tests': 'src',
    'sonar.inclusions': 'src/**/*.ts,src/**/*.html,src/**/*.sass', // Entry point of your code
    'sonar.test.inclusions': 'src/**/*.spec.ts',
    //  'sonar.scm.provider': 'git',
  },
}, () => {
  console.log('Error Occurred while scanning');
});
```

```json
# <workdir>/package.json

{
    "scripts": {
        ...
        "sonar":"node sonar-project.js"
    }
}

```