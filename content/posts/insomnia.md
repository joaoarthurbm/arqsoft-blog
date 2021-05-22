+++
title = "Documentação arquitetural do Insomnia"
date = 2021-04-15
tags = []
categories = []
+++

---

Este é um documento explica aspectos da arquitetura de um cliente para requisições à API's. O Insomnia
torna a tarefa de teste de Api's mais fáceis.

---

# Autores

Este documento foi produzido por Filipe Pires Guimarães.

- Matrícula: 116210442
- Contato: filipepiresg@gmail.com
- Projeto documentado: https://github.com/Kong/insomnia

# Descrição Arquitetural – Insomnia

Este documento descreve parte da arquitetura do projeto Insomnia. Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que não será escrita toda a arquitetura do Insomnia. O foco principal é descrever a `API client` utilizando o padrão REST de um ùnico workspace, que é parte fundamental do projeto.

## Descrição Geral sobre o Insomnia

O Insomnia é uma ferramenta open-source e cross-platform para desktop, feito em electron para testar requisições à APIs com suporte à protocolos, como: `REST`, `SOAP`, `GraphQL` e `GRPC`. De uma forma muito fácil e àgil. Nele, podem ter vários workspaces, com distintas API`s.

Mais detalhes podem ser vistos [nesse link](https://insomnia.rest/)

## Insomnia Client

### Objetivo Geral

Implementar uma ferramenta em que possa testar mais facilmente, e agilmente, às API's.

### Objetivos Específicos

O Insomnia é um projeto que tem como objetivo "facilitar o teste de requisições às API's", nele pode-se simular uma requisição completa, observar sua execução e verificar o seu retorno. Ele permite o compartilhamento do workspace com o time, acelerando esse processo.

### Contexto

![context](insomnia-context.png)

### Containers

![container](insomnia-container.png)

### Componentes

![component](insomnia-component.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de informação

![estados](insomnia-estados.png)
