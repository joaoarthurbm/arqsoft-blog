+++
title = "Documentação Arquitetural - Nullstack Framework"
date = 2021-08-13
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

O objetivo do serviço de criação de SPA´s provido pelo Nullstack é de facilitar o processo criação e renderização das páginas de uma aplicação web, por meio de um pipeline o processo se torna mais seguro, rápido e possível de replicação em outros lugares.