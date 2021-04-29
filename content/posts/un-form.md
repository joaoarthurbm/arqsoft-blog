+++
title = "Documento Arquitetural do unForm"
date = "2021-04-16"
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Lucas Venancio Duarte.

- Matrícula: 116210074
- Contato: lucas.duarte@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/unform/unform

# Descrição Arquitetural -- unForm

Este documento descreve a arquitetura do [unForm](https://github.com/unform/unform).
As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

## Descrição Geral

Unform é uma API focada em desempenho para criar experiências de formulários para React e React Native. Projetado para ter um design zero, extensível e poder lidar com dados e relacionamentos complexos. Ele é disponibilizado como um pacote npm.

Mais informações podem ser encontradas [aqui](https://unform.dev/).

## Objetivos

Oferecer uma biblioteca baseada em hooks para expor suas configurações sem que o usuário precise se preocupar em criar funções para preencher, validar e lidar com dados e relacionamentos complexos, possuir também, a possibilidade de integração com qualquer biblioteca de formulários, como React Select e React Datepicker, e por fim, ser possível integre-se de forma fácil  com bibliotecas de IU ou soluções CSS-in-JS para criar componentes de formulário e exibir erros, alterar cores, adicionar ícones e usar seu guia de estilo.

## Contexto

Como o unForm se trata de uma biblioteca, os usuários finais são os desenvolvedores de *software*, que a importam em seus projetos e assim fazem uso de suas funcionalidades.

Em relação à comunicação com sistemas externos, a principal interação realizada é com outras bibliotecas definido pelo usuário. Essas bibliotecas podem ser de estilos ou que provem alguma API para interação.

O diagrama de contexto abaixo ilustra quais entidades interagem com o unForm.
 
