+++
title = "Documentação Arquitetural do Mockito"
date = 2021-07-28
tags = []
categories = []
+++


# Autores

Este documento foi produzido por Luiz Bonfim Vieira Costa Neto

- Matrícula: 119210966
- Contato: luiz.bonfim.neto@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/mockito/mockito

# Descrição Arquitetural -- Mockito

Este documento descreve parte da arquitetura do projeto [Mockito](https://github.com/mockito/mockito). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Mockito

O Mockito é um framework bastante popular para a criação de mocks em testes de unidade de projetos  desenvolvidos em Java. O uso de mocks adiciona funcionalidades interessantes aos testes de unidade, por ser possível simular a execução de uma implementação de uma dependência externa, para vários cenários distintos e de forma dinâmica, mantendo assim os testes com a agilidade e modularidade de um teste de unidade.

## Objetivo
No desenvolvimento de softwares, os testes de unidade são fundamentais para indicar se pequenas seções de código são adequadas às necessidades, bem como tornar os sistemas mais manuteníveis e menos susceptíveis a inserção de bugs durante expansões ou refatorações do sistema. Em projetos Java, a unidade de código que buscamos testar é geralmente uma Classe, ou apenas um simples método.

Em testes de unidade, é desejável validar a funcionalidade de um objeto em específico. Porém, na maioria dos casos esses objetos possuem dependência de outros objetos externos, e é neste ponto que os mocks são fundamentais. Com os mocks, podemos simular o comportamento das dependências segundo a regra de negócio do sistema, e testar se a classe em questão tem a funcionalidade adequada ao contexto na qual está inserida.

## Contexto
`Descrever o contexto no qual o mockito está inserido`

![Diagrama de Contexto](context.png)