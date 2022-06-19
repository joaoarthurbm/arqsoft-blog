+++
title = "Documento Arquitetural - DeckDeckGo"
date = 2022-06-05
tags = []
categories = []
+++

# Autores

Este documento foi produzido por:

Cayo Vinicíus Viegas

- Matrícula: 118110448
- Contato: cayo.viegas@ccc.ufcg.edu.br

Fernando Lisboa Costa

- Matrícula: 119110403
- Contato: fernando.costa@ccc.ufcg.edu.br

Mateus Cavalcante de Almeida Farias Aires

- Matrícula: 118210131
- Contato: mateus.aires@ccc.ufcg.edu.br

Maurício Marques da Silva Monte

- Matrícula: 118110914
- Contato: mauricio.monte@ccc.ufcg.edu.br

Projeto documentado: https://github.com/deckgo/deckdeckgo

# Descrição Arquitetural -- DeckDeckGo

Este documento descreve parte da arquitetura da plataforma DeckDekGo, com foco no editor online de slides, ora denominado como [DeckDeckGo Studio](https://deckdeckgo.com/en/). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o DeckDeckGo

O DeckDeckGo é um editor open source de apresentações de slides online. Ele funciona em qualquer dispositivo (desktop, mobile ou tablets) sem a necessidade de qualquer instalação prévia. Ele também permite interação entre o apresentador e o público através de votações ao vivo.

Ao contrário de outros softwares de apresentação, os slides são publicados como aplicativos online, com o objetivo de tornar mais fácil seu compartilhamento.

Outras features do DeckDeckGo podem ser encontrados nesse [link](https://deckdeckgo.com/en/features).

## A plataforma DeckDeckGo Studio

### Objetivo Geral

Implementar uma plataforma em que seja possível criar e apresentar slides.

### Objetivos Específicos

Fornecer de ferramentas que deixam a apresentação mais interativa e mais fácil de disponibilizada para outras pessoas, sem precisar cadastro por parte dos espectadores, e podendo ser compartilhada com apenas um link.

