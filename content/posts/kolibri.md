+++
title = "Documentação Arquitetural - Kolibri"
date = 2021-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Maria Cecília Kemiac Santos.

- Matrícula: 117110019
- Contato: maria.cecilia.santos@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/learningequality/kolibri

# Descrição Arquitetural -- Kolibri

Este documento descreve parte da arquitetura do projeto [Kolibri](https://github.com/learningequality/kolibri). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Kolibri

Kolibri é um aplicativo offline que disponibiliza tecnologia educacional de alta qualidade em comunidades de poucos recursos, como escolas rurais, campos de refugiados, orfanatos, sistemas escolares não formais e sistemas prisionais. 

## O Kolibri

### Contexto

![fig1](contexto.png)

O sistema do Kolibri é utilizado por usuários que estão interessados em aprender, porém possuem poucos recursos para acessar a internet. Ele também pode ser utilizado por instrutores, que podem criar turmas para organizar o conteúdo que será ministrado. Os usuários interagem com a plataforma do Kolibri, que deve ser instalada localmente. Os materiais e os exercícios disponíveis na plataforma podem ser baixados para serem usados de forma offline, e são provenientes do sistema Kolibri Studio, uma ferramenta onde produtores de conteúdo educacional publicam os materiais que serão deisponibilizados.

### Containers

![fig2](containers.png)

O Kolibri é composto por três containers: a aplicação frontend, backend e o banco de dados. A aplicação front-end está escrita em Javascript e utiliza o framework Vue. Ela é dividida em diversas Single Page Applcations independentes entre si. Cada uma dessas aplicações é implementada como um plugin do Kolibri. A aplicação backend é uma API REST escrita em python e que utiliza o framework Django. A comunicação com o lado do cliente é feita através de requisições HTTPS e todo dado utilizado é serializado e enviado na forma de JSON. No banco de dados é utilizado PostgresSql e Sql Server.

### Componentes

![fig3](componentes.png)

O frontend é dividido em Single Page Applications, e cada Single Page Application é dividida em 3 componentes: View, Route e Modules. A View contém os componentes em Vue, que lidam com a estrutura visual, lógica e estilização do componente. A Route é responsável pela organização das rotas da aplicação e a parte de Modules monta o componente no HTML retornado pelo servidor. Já o Vuex é um componente que armazena os dados que precisam persistir entre as Views das Single Page Applications.

O backend é dividido em Models, Routes e API Resources. A parte de Models lida mais diretamente com o banco de dados, a de Routes é responsável pela serialização dos objetos e criação das rotas e a parte de API Resources é uma camada de abstração escrita para reduzir a complaxidade ao inferir URLs e o armazenamento de cache.

### Código

Em breve.

### Visão de Informação

A máquina de estados representa um possível fluxo de um canal (um canal disponibiliza conteúdos e atividades sobre uma ou várias áreas) ao ser utilizado por um usuário que está interessado em usar os seus conteúdos para aprender.

![fig4](visao-da-informacao.png)

## Contribuições Concretas

Não foi enviado PR ao projeto.