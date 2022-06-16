+++
title = "Jest"
date = 2022-05-04
tags = []
categories = []
+++

# Autores

Este documento foi produzido por: Fanny Batista Vieira.

- Matrícula: 117111445
- Contato: fanny.vieira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/facebook/jest

# Descrição Arquitetural -- Jest

Esse documento descreve a arquitetura do [Jest](https://github.com/facebook/jest). As descrições e diagramas do documento usam o [modelo C4](https://c4model.com/) como referência.

## Descrição geral

Jest é um framework de teste Javascript construído para garantir a corretude de qualquer base de código escrita em JavaScript. É disponibilizado como um pacote NPM e permite a escrita de testes de uma maneira acessível, intuitiva e rica em recursos que produzem resultados dos testes rapidamente, através de um conjunto de APIs.

Jest requer zero configuração, garante o isolamento dos testes, fornece suporte à snapshots, o que permite verificar a integridade de objetos grandes e complexos, além de exportar alguns de seus módulos internos. Dessa forma, os usuários conseguem customizar as funcionalidades, de modo que elas atendam à necessidades mais especificas ou sejam usadas para outros propósitos, além do ecossistema de testes. Por exemplo, um projeto que precise lidar com paralelização em JavaScript pode remover toda a fricção de configurar threads, utilizando o pacote jest-worker.

## Objetivos

Implementar um framework que ofereça uma maneira autómatica de estruturar, executar e coletar métricas de testes em JavaScript.

## Objetivos especificos

- Encontrar todos os arquivos relevantes à serem testados de forma eficiente.
- Executar todos os testes em paralelo e de forma isolada.
- Utilizar um sistema de asserção para escrita e relatório dos testes.

## Contexto

Como citado anteriormente, o Jest se trata de um framework desenhado para estruturação e execução automatizada de testes, assim, os seus usuários finais são desenvolvedores de software.

No que se refere a comunicação com sistemas externos, a sua principal interação se dá com uma biblioteca chamada _watchman_ que observa mudanças realizadas nos arquivos de teste da aplicação dos usuários. Isso permite a otimização da execução de alguns testes, uma vez que o framework pode pular a execução dos testes em arquivos que não foram recentemente modificados, e realizaram alguma execução, anteriormente.

Além disso, o Jest se comunica com outros plugins de terceiros com o objetivo de estender suas funcionalidades, como: suporte a paralelização de tarefas, customização da interface do usuário e manipulação de cache. O diagrama de contexto a seguir ilustra quais entidades interagem com o Jest.

![Diagrama de Contexto](context_diagram_jest.png)

## Containers

O Jest não se trata de um sistema de software, já que não é composto por aplicações, bem como, não possui armazenamento de dados, sendo assim, se trata de um framework. Possui dois containers principais: _bin_ e _lib_ que operam dentro do ambiente NodeJS.

O container _bin_ é responsável pelo empacotamento do build do framework e por inicializar o Jest, através de um conjunto de comandos fornecidos pelo usuário na _Command Line Interface_(CLI). O container _lib_ é responsável pela exportação dos módulos internos do Jest. Esses dois containers interagem a fim de realizar as tarefas requisitadas pelo usuário.

![Diagrama de Container](container_diagram_jest.png)

### Implantação

A implantação do Jest é relativamente simples, sendo apenas necessário o uso de algum gerenciador de pacotes, como npm ou yarn, e a instalação de algumas bibliotecas adicionais, se o projeto não usar JavaScript puro. Por exemplo, no caso de ser uma aplicação web que usa um framework que abstrai o JavaScript. Como essas informações são voláteis e dependem da versão atual do Jest, é recomendado verificá-las na [documentação oficial](https://jestjs.io/docs/getting-started).

## Componentes

Até o momento, o Jest é composto por 51 módulos internos. No entanto, para esse diagrama, optou-se por destacar apenas os principais, já que muitos deles, tratam de funcionalidades utilitárias, ou são usados por outros módulos que incorporam suas responsabilidades.

![Diagrama de Components](component_diagram_jest.png)

**Jest-CLI**: Componente responsável por exportar a interface de comunicação entre os usuários.

**Jest-Config**: Componente responsável por coletar as preferências dos usuários. Informações como: Framework de teste interno que será usado, ambiente dos testes, plugins que observam mudanças específicas nos arquivos e assim por diante. Para mais informações, leia a [página de configurações](https://jestjs.io/docs/configuration) do Jest.

**Jest-Core**: Componente responsável por coletar a requisição dos usuários, normalizar para o padrão de comunicação dos módulos internos e orquestrar a execução dos mesmos.

**Jest-Runtime**: Componente responsável por tratar das configurações e ambientação dos testes. Esse componente define que funcionalidades adicionais deverão ser exportadas dependendo do ambiente de execução do usuário (browser, nodejs e assim por diante.)

**Jest-Haste-Map**: Componente responsável por coletar todos os arquivos de teste do projeto e criar uma representação interna, a fim de tornar sua localização mais eficiente.

**Jest-Runner**: Componente responsável pelo gerenciamento da execução dos testes.

**Jest-Reporters**: Componente responsável pela comunicação dos resultados da execução de testes do projeto, através de eventos.

**Jest-Workers**: Componente responsável pela paralelização da execução dos testes através de workers.

**Jest-Circus**: Componente responsável pela execução efetiva dos testes, esse componente exporta a API usada pelos usuários para construção dos testes, e permite que os testes construídos pelos usuários sejam invocados e testados.

**Jest-Jasmine**: Componente responsável pela execução efetiva dos testes, esse componente exporta a API usada pelos usuários para construção dos testes, e permite que os testes construídos pelos usuários sejam invocados e testados.
