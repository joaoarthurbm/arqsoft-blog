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

- Projeto documentado: https://github.com/transtats/transtats

# Descrição Arquitetural -- Transtats

Este documento descreve a arquitetura da aplicação [Transtats](https://github.com/transtats/transtats). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Transtats

O Transtats é um software open source para auxiliar sistemas que trabalham com versões em diferentes linguagens, agindo na automação de etapas de extração e atualização de recursos de idioma. Além da função de tradução do produto, o software também gera estatísticas do progresso de tradução, procura por erro de traduções, gerencia o progresso de I10n (adaptação de um produto, aplicativo ou conteúdo de documento para atender aos requisitos de idioma, cultura e outros de um mercado-alvo específico), e notifica os membros da equipe responsáveis pela tradução com base nas datas de lançamento.

## Containers

Os quatro contêiners principais que compõe o Transtats são a Aplicação Web, uma aplicação Single Page (SPA), a API, e o BD.

A Aplicação Web é escrito em Python, usa Django como framework web e é servida pelo Apache. Ela se comunica com a SPA entregando o conteúdo requisitado, além de se comunicar com a API requisitando funcionalidades.

A SPA é escrita em JavaScript, utiliza o Bootstrap como framework front-end e se comunica apenas com a Aplicação Web ao enviar as interações do usuário com a página.

O BD utilizado pelo sistema é o PostgresSQL e serve para armazenar os pacotes em tradução/traduzidos e suas métricas.

A API é escrita em Python, usa Django e se comunica com:
- a Aplicação Web respondendo às requisições, 
- com o gerenciador de repositório indo buscar o link onde o pacote se encontra
- com a plataforma de tradução onde os pacotes serão traduzidos, e
- com o BD onde os pacotes e as métricas são armazenados.

Alguma operações que a API oferece são:

Adiciona um pacote ao Transtats:
```
POST /api/package/create 
```
**Exemplo**
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

Recupera detalhes de um job
```
GET /api/job/<job_id>/log
```