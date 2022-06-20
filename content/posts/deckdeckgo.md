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

# Descrição Arquitetural - DeckDeckGo

Este documento descreve parte da arquitetura da plataforma DeckDekGo, com foco no editor online de slides, ora denominado como [DeckDeckGo Studio](https://deckdeckgo.com/en/). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o DeckDeckGo

O DeckDeckGo é um editor open source de apresentações de slides online. Ele funciona em qualquer dispositivo (desktop, mobile ou tablets) sem a necessidade de qualquer instalação prévia. Além disso, permite a interação entre o apresentador e o público através de votações ao vivo.

Ao contrário de outros softwares de apresentação, os slides são publicados como aplicativos online, com o objetivo de tornar mais fácil seu compartilhamento.

Outras features do DeckDeckGo podem ser encontrados nesse [link](https://deckdeckgo.com/en/features).

## A plataforma DeckDeckGo Studio

### Objetivo Geral

A aplicação oferece um serviço de criação e distribuição de slides de forma online, interativa e multiplataforma.

### Objetivos Específicos

O DeckDeckGo dispõe de ferramentas que permitem às apresentações serem mais interativas e facilmente disponibilizadas para o público, podendo ser compartilhada com apenas um link, sem a necessidade de cadastro por parte dos espectadores. É possível ainda criar slides a partir de diferentes formatos como por exemplo Markdown ou HTML.

### Contexto

O DeckDeckGo estabelece comunicações com serviços de Cloud como AWS e Firebase, além de receber e gerenciar informações em real-time com o WebRTC. Para o armazenamento, utiliza um banco de dados não relacional (NoSQL), permitindo maior velocidade em suas consultas.

- **AWS**: Plataforma em nuvem onde o backend da aplicação está hospedada. Permite, entre outros, maior estabilidade de perfomance em diversos dispositivos.
- **WebRTC**: Permite que dados sejam enviados no formato _peer-to-peer_ em tempo real. A tecnologia está disponível em todos os navegadores modernos, no DeckDeckGo é utilizada para computar votações ao vivo, por exemplo.
- **Firebase Cloud Functions**: Realiza operações de iserção e remoção em banco de dados na nuvem.

![Diagrama de Contexto](diagrama_contexto.png)

### Containers

![Diagrama de Containers](diagrama_containers.png)

### Componentes

![Diagrama de Componentes]()

### Visão de Informação

Os slides são a informação mais fundamental da aplicação. É o foco da plataforma e outras entidades são criadas em volta das apresentações. Por exemplo, a aplicação também lida com votações, mas estas são apenas uma feature criada para complementar os slides. Abaixo segue uma descrição textual e um diagrama explicando sobre os estados desta informação.

Após o slide ser criado, ele pode ser selecionado pelo usuário e aplicação abre uma tela de edição do slide. Dentro do perfil do usuário estão listados os slides criados por ele e estes podem ser editados ou duplicados enquanto ainda não tiverem sido publicados.

Uma vez publicados, os slides ficam disponíveis através de um link no estado em que estavam quando o usuário clicou em publicar. Caso o usuário faça mais alterações no slide, elas estarão disponíveis apenas no rascunho, a menos que o usuário clique em publicar novamente e gere uma nova versão do slide publicado, que está disponível no mesmo link.

Uma vez publicado, o slide continua podendo ser duplicados, mas agora também podem ser deletados pelo usuário.

![Visão da Informação](visao_da_informacao.png)
