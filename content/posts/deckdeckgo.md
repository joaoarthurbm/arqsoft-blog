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

### Contexto

![fig1]()

### Containers

![fig2]()

### Componentes

![fig3]()

### Visão de Informação

Os slides são a informação mais fundamental da aplicação. É o foco da plataforma e outras entidades são criadas em volta das apresentações. Por exemplo, a aplicação também lida com votações, mas estas são apenas uma feature criada para complementar os slides. Abaixo segue uma descrição textual e um diagrama explicando sobre os estados desta informação.

Após o slide ser criado, ele pode ser selecionado pelo usuário e aplicação abre uma tela de edição do slide. Dentro do perfil do usuário estão listados os slides criados por ele e estes podem ser editados ou duplicados enquanto ainda não tiverem sido publicados.

Uma vez publicados, os slides ficam disponíveis através de um link no estado em que estavam quando o usuário clicou em publicar. Caso o usuário faça mais alterações no slide, elas estarão disponíveis apenas no rascunho, a menos que o usuário clique em publicar novamente e gere uma nova versão do slide publicado, que está disponível no mesmo link.

Uma vez publicado, o slide continua podendo ser duplicados, mas agora também podem ser deletados pelo usuário.

![fig4](visao_da_informacao.png)
