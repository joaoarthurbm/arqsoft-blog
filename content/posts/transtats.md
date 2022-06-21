+++
title = "Documentação Arquitetural do Transtats"
date = 2022-06-06
tags = []
categories = []
+++

# Autores

Este documento foi produzido por:

Dante de Araújo Costa
- Matrícula: 119210045
- Contato: dante.costa@ccc.ufcg.edu.br

Erick Morais de Sena
- Matrícula: 118111393
- Contato: erick.sena@ccc.ufcg.edu.br

Francicláudio Dantas da Silva
- Matrícula: 118210343
- Contato: franciclaudio.silva@ccc.ufcg.edu.br

Gustavo Farias de Souza Silva
- Matrícula: 118210480
- Contato: gustavo.silva@ccc.ufcg.edu.br

Projeto documentado: https://github.com/transtats/transtats

# Descrição Arquitetural -- Transtats

Este documento descreve a arquitetura da aplicação [Transtats](https://github.com/transtats/transtats). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Transtats

O Transtats é uma aplicação open source para auxiliar desenvolvedores de software que trabalham com versões de código em diferentes linguagens, realizando, dentre outras coisas, a tradução do código fonte de forma automatizada. Essa tradução é feita a partir da extração e atualização de recursos de idioma com base nos padrões de adaptação de software Internationalization (i18n) e Localization (l10n). Além da função de tradução do código, o Transtats também gera estatísticas do progresso de tradução, procura por erros de traduções e notifica os membros da equipe.

## O Serviço do Transtats

### Objetivo Geral

Automatizar o processo de tradução de pacotes de código e informar métricas e estatísticas do progresso da tradução.

### Objetivos Específicos

Compilar as estatística do processo de tradução em componentes visuais, como gráficos e tabelas, realizar a tradução para diversas línguas, avaliar a cobertura da tradução e agrupar traduções específicas por releases.

### Contexto

{
    ...
}

### Containers

<img class="center" src="./transtats/diagrama-container.png" style="width:80%">

Os quatro contêiners principais que compõem o Transtats são a Aplicação Web, uma Aplicação Single Page (SPA), a API, e o BD.

A Aplicação Web é escrita em `Python`, usa `Django` como framework web e é servida pelo `Apache`. Ela se comunica com a SPA entregando o conteúdo requisitado, além de se comunicar com a API repassando as requisições feitas pelo usuário.

A SPA é escrita em `JavaScript`, utiliza o `Bootstrap` como framework front-end e se comunica apenas com a Aplicação Web notificando sobre as ações do usuário com a página.

O BD utilizado pelo sistema é o `PostgresSQL` e serve para armazenar os pacotes escolhidos pelo usuário para serem traduzidos e suas métricas.

A API é escrita em Python, usa Django e se comunica com:
- a Aplicação Web, respondendo às requisições; 
- com o gerenciador de repositório, fazendo a busca do pacote pelo link do repositório indicado;
- com a plataforma de tradução, onde os pacotes serão traduzidos; 
- com o BD, onde os pacotes e as métricas são armazenados.

Algumas funcionalidades que a API oferece são:

Adiciona um pacote ao Transtats:
```
POST /api/package/create 
```
**Exemplo**

- Request
```
curl -d '{
    "package_name": "dnf", 
    "upstream_url": "https://github.com/rpm-software-management/dnf",
    "transplatform_slug": "WLTEFED", 
    "release_streams": "fedora,RHEL"
}' 
-H "Authorization: Token <your-transtats-api-token>" 
-H "Content-Type: application/json" 
-X POST http://localhost:8080/api/package/create 
```
- Response
```
{
    "dnf":"Package added Successfully."
}
```

Verifica a saúde de um pacote
```
GET /api/package/<package_name>/health 
```

Recupera o status de tradução de um pacote
```
GET /api/package/<package_name> 
```

Executa um job
```
POST /api/job/run
```
**Exemplo**

- Request
```
curl -d '{
    "job_type": "syncdownstream", 
    "package_name": "anaconda", 
    "build_system": "koji", 
    "build_tag": "f33"
}' 
-H 'Content-Type: application/json' 
-H 'Authorization: Token <your-transtats-api-token>' 
-X POST http://localhost:8080/api/job/run
```
- Response
```
{
    "Success":"Job created and logged. URL: http://localhost:8080/jobs/log/2a5966a9-3e5e-4ad1-b89e-1ee0e3b1651b/detail",
    "job_id":"2a5966a9-3e5e-4ad1-b89e-1ee0e3b1651b"
}
```

Recupera detalhes de um job
```
GET /api/job/<job_id>/log
```

### Componentes

Os componentes do container API são o `API REST` que possibilita a comunicação das requisições na aplicação web com o `Controller`, segundo componente responsável por gerenciar o sistema utilizando mais dois componentes: `Jobs Framework`, que faz uso do componente de mensagens `Async Msg Queue`, e o `Model`, responsável por estabelecer o modelo de comunicação com o banco de dados.

O `Jobs Framework` oferece atualmente seis templates de comunicação, sendo estes e seus respsctivos serviços:

- syncupstream: clonagem do repositório de origem do pacote, filtragem das traduções e cálculo de estatísticas.
- syncdownstream: localização do SRPM mais recente, descompactação, filtragem de arquivos de tradução e cálculo estatísticas.
- stringchange: clonagem do repositório de origem do pacote, geração do modelo (POT) de acordo com o comando fornecido, download do modelo da plataforma e busca/comparação de diferenças.
- pushtrans: clonagem do repositório de origem do pacote, filtragem das traduções e upload para a plataforma CI.
- dpushtrans: download das traduções da plataforma de tradução de pacotes e upload na plataforma CI.
- pulltrans: download das traduções da plataforma CI e envio de volta.

<img class="center" src="./transtats/components-diagram.jpg" alt="Diagrama de componente - Transtats" style="width:80%">

### Visão de Informação

Por meio do front-end, o usuário solicita a tradução para um pacote de código por meio da inserção do link do repositório deste pacote. O usuário também pode escolher entre diferentes templates de tradução, em que cada template possui diferentes configurações. A aplicação web envia uma requisição para a API que, por sua vez, envia o código para a Plataforma de Tradução e essa plataforma realiza a tradução de acordo com os padrões de adaptação de software, Internationalization (i18n) e Localization (l10n). Uma vez finalizada, o Transtats armazena a tradução em uma nova branch no repositório de origem, por meio do Gerenciador de Repositórios. Durante todo o processo de tradução, o Transtas armazena em seu banco de dados o status e as estatísticas geradas no processo de tradução.

A imagem abaixo representa, por meio de um diagrama de estados, o processo de solicitação da tradução de um pacote.

<img class="center" src="./transtats/visao-de-info.png">

