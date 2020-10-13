+++
title = "Documentação arquitetural para a plataforma freeCodeCamp"
date = 2019-10-29
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Arthur Silva Lima Guedes.

- Matrícula: 118110410
- Contato: arthur.guedes@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/freeCodeCamp/freeCodeCamp

# Descrição Arquitetural -- freeCodeCamp

Este documento descreve a arquitetura da plataforma [freeCodeCamp](https://github.com/freeCodeCamp/freeCodeCamp). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o freeCodeCamp

freeCodeCamp é uma comunidade sem fins lucrativos com o propósito de ajudar no processo de aprendizagem de desenvolvimento de software. Através de uma plataforma web de aprendizagem interativa (e outros meios como fóruns e posts), milhares de pessoas tem a oportunidade de aprender sobre desenvolvimento web, análise de dados, *machine learning*, entre diversos outros assuntos, tudo isso de forma 100% gratuita. Algumas respostas para perguntas frequentes podem ser encontradas [aqui](https://www.freecodecamp.org/news/about/).

## A plataforma de freeCodeCamp

### Objetivo Geral

Implementar uma plataforma de aprendizagem interativa que torne acessível aos usuários assuntos das mais diversas áreas da computação.

### Objetivos Específicos

É de extremo interesse acompanhar o progresso do aluno em relação ao *curriculum* (similar a um guia de conteúdos), o quanto o mesmo está progredindo nas lições e nos desafios.

### Contexto

Abaixo, é possível observar o diagrama de contexto do sistema. Nele, temos um usuário que, em nosso contexto, é descrito como o estudante (ou potencial estudante) da área de programação. A plataforma freeCodeCamp usa o AWS SES (um dos sistemas externos) para o envio de emails para os estudantes, além de um sistema de pagamentos (o PayPal) para os usuários que desejam realizar doações para ajudar a comunidade.

<img class="center" src="contexto.png" alt="Diagrama de contexto - freeCodeCamp" style="width:60%">
