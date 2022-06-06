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

Jest é um framework de teste Javascript construído para garantir a corretude de qualquer base de código escrita em JavaScript. É disponibilizado como um pacote NPM e permite a escrita de testes de uma maneira acessível, intuitiva e rica em recursos que produzem resultados dos testes rapidamente, através de um conjunto de APIs.

Jest requer zero configuração, garante o isolamento dos testes, fornece suporte à snapshots, o que permite verificar a integridade de objetos grandes e complexos, além de exportar alguns de seus módulos internos. Dessa forma, os usuários conseguem customizar as funcionalidades, de modo que elas atendam à necessidades mais especificas ou sejam usadas para outros propósitos, além do ecossistema de testes. Por exemplo, um projeto que precise lidar com paralelização em JavaScript pode remover toda a fricção de configurar threads, utilizando o pacote jest-worker.

## Objetivos

Implementar um framework que ofereça uma maneira autómatica de estruturar, executar e coletar métricas de testes em JavaScript.

## Objetivos especificos

- Encontrar todos os arquivos relevantes à serem testados de forma eficiente.
- Executar todos os testes em paralelo e de forma isolada.
- Utilizar um sistema de asserção para escrita e relatório dos testes.
