+++
title = "Jest"
date = 2023-05-04
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

Jest é um framework de teste Javascript construído para garantir a corretude de qualquer codebase escrita em JavaScript. É disponibilizado como um pacote NPM e permite a escrita de testes de uma maneira acessível, intuitiva e rica em recursos que produzem os seus resultados dos testes, através de uma API.

Jest possui uma documentação ampla, requer zero configuração e exporta alguns dos seus componentes, assim os seus usuarios conseguem customizar as funcionalidade de modo que elas atendem a necessidades mais especificas ou sejam usadas para outros propositos.

Dentre as suas principais vantagens temos:

- Rapidez: O jest executa os testes em paralelo, o que permite reduzir o tempo de execução dos testes.

- Cobertura de código built-in: Jest provê a métrica de cobertura de código por padrão, o que permite ter uma visão geral da efetividade dos testes no projeto como um todo.

- Isolamento de testes: Cada teste em Jest é executado de maneira isolada, o que garante que dois tests não iram impactar no resultado um do outro.

- Suporte eficiente a Mocking: Jest fornece suporte a todos os tipos de mocking: funcional mocking, timer mocking ou mocking de chamadas individuais a API.

- Suporte a teste snapshot: Isso é especialmente útil para o público que usa Jest atrelado a biblioca React, já que o Jest consegue capturar os componentes React que estão sendo testados, e assim é possivel validar o comportamento dos outputs das telas

## Objetivos

Implementar uma biblioca que ofereça uma maneira autómatica de estruturar, executar e coletar métricas de testes em JavaScript.

## Objetivos especificos

- Encontrar todos os arquivos relevantes a serem testados de forma eficiente.
- Executar todos os testes em paralelo e isoladamente.
- Utilizar um sistema de asserção para escrita e relatório dos testes.
