+++
title = "Documentação Arquitetural - Nullstack Framework"
date = 2021-08-16
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Mateus Pinto Mangueira.

- Matrícula: 115211466
- Contato: mateus.mangueira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/nullstack/nullstack

# Descrição Arquitetural -- Serviço de criação de Single Page Application usando o Nullstack Framework

Este documento descreve parte da arquitetura do projeto [Nullstack](https://github.com/nullstack/nullstack). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que não será descrita toda a arquitetura do Nullstack. O foco aqui é a descrição de um serviço específico de criação de SPA´s via framework, que é uma das partes fundamental do projeto.


## Descrição Geral sobre o Nullstack

O NUllstack é um framework que tem como objetivo "escrever o back-end e o front-end de um recurso em um único componente e assim o framework irá decidir onde o código sera executado". Mais detalhes sobre o projeto podem ser vistos [neste link](https://nullstack.app/pt-br).

## O Serviço de criação de Single Page Application

### Objetivo Geral

O objetivo do serviço de criação de SPA´s provido pelo Nullstack é de facilitar o processo de criação e renderização das páginas de uma aplicação web, por meio de um pipeline o processo se torna mais seguro, rápido e possível de replicação em outros lugares.

### Contexto

Com o Nullstack instalado na máquina do desenvolvedor a escrita de código segue um padrão apresentado na documentação do framework. O desenvolvedor pode escolher o tipo de renderização escolhida para o framework gerar as Views da aplicação. Para criar a View de Single Page Application, o framework utiliza 3 etapas para renderização das páginas criadas: pre-render(pelo servidor NodeJs do Framework), re-render(mudanças em Views do Client) e render(Criação de novas Views no Client).

![fig1](Diagrama de Contexto.png)

### Containers

O serviço de SPA do Nullstack é composto de 3 containers: aplicação client-side escrita em ReactJs; aplicação server-side escrita em NodeJs e banco de dados AWS.

As aplicações se comunicam com o servidor via HTTPS. As SPA´s conversam com o framework atráves de virtual pipeline, para poder ser produzidas em paralelo.

Abaixo se encontra o diagrama de containers.

![fig2](Diagrama de Container.png)

### Componentes

No Nullstack, existem três componentes principais para o processo de criação das Single Pages Application:

prerender.js, que lida com a criação de uma árvore com a instância principal de criação da View. O rerender.jsr, que engloba a API de tratamento de problemas nos galhos da árvore principal, nele possui uma interface que facilita alternar entre diferentes pages e serve como um ponto de partida para o último componente que é o rerender.js, ele tem a funcionalidade de criar, por meio dos parâmetros setados no momento da configuração do framework, as SPA´s da aplicação web. Por fim, as Views são mantidas no armazenamento AWS do framework e renderizadas quando necessárias.

Abaixo está o diagrama de componentes.

![fig3](Diagrama de Componente.png)

### Visão de Informação

Na Visão de informação é descrito o(s) estado(s) que uma dado pode atingir no decorrer do processamento das funcionalidades do sistema, ao iniciarmos o processo de criação de SPA pelo framework o prerender.js é acionado e inicia a processar a parte do servidor do framework para construir o fluxo de renderização daquela View, após o estado anterior ter sido finalizado o dado é modificado pelo prerender.js com o intuito de mitigar os erros nas informacoes das SPA´s que irão ser renderizadas pelo client-side do framework. Finalizando, o render.js cria novos galhos na árvore principal com as novas visualizações de páginas únicas na aplicação, sendo renderizadas onde quiser.

![fig4](Diagrama de Visao.png)