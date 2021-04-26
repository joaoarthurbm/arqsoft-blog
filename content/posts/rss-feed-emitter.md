+++
title = "Arquitetura do RSS Feed Emitter"
date = 2021-04-25
tags = []
categories = []
+++
 
# Autores
 
Este documento foi produzido por Bruno Rodrigo Pinheiro de Meneses.
 
- Matrícula: 116211401
- Contato: bruno.meneses@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/filipedeschamps/rss-feed-emitter
 
# Descrição Arquitetural - RSS Feed Emitter
 
Neste documento, é descrito um agregador de RSS, o [RSS Feed Emitter](https://github.com/filipedeschamps/rss-feed-emitter). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).
 
## Descrição geral sobre o RSS Feed Emitter
O RSS Feed Emitter é uma biblioteca que disponibiliza um agregador RSS, onde podem ser registrados sites que oferecem RSS.

 
### Objetivos Específicos
 
Disponibilizar uma forma fácil de acompanhar toneladas de feeds e receber eventos para cada novo item publicado.