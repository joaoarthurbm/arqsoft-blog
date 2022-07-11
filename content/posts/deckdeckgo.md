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
- **Firebase Cloud Functions**: Realiza operações de inserção, modificação e remoção em banco de dados na nuvem.

![Diagrama de Contexto](diagrama_contexto.png)

### Containers

O Studio é onde as edições são feitas. Ele usa Stencil, que é uma ferramenta usada para sistemas de design em JavaScript. Esse container faz chamadas API num backend hospedado em AWS. Esse backend na AWS também se comunica com o WebRTC, que é usado pelo Controle remoto através de dados enviados peer-to-peer em tempo real. O Controle remoto também usa Stencil, além do Ionic PWA, que utiliza recursos modernos da Web para oferecer experiências rápidas de aplicativos nativos, sem lojas de aplicativos ou downloads, e todas as vantagens da Web. Tanto o Studio quanto o Controle remoto usam o Firebase Cloud Functions como banco de dados em nuvem. A página principal do DeckDeckGo utiliza JavaScript e Gatsby.

![Diagrama de Containers](diagrama_containers.png)

### Componentes

O Studio, foco dessa análise, permite a criação e edição de slides, a partir da interação com o componente de apresentação. É possível inserir Gifs nas apresentações, que são providos pelo Provedor de Gifs. O Publisher busca informações do usuário para criar uma estrutura de diretórios nos quais serão salvas as apresentações de slide, além de criar seus respectivos links (deckdeckgo.com/{nome_do_usuário}/{nome_da_apresentação}. 

![Diagrama de Componentes](diagrama_componentes.png)

### Visão de Informação

Os slides são a informação mais fundamental da aplicação.
Após o usuário criar um slide, este é considerado como rascunho, podendo ser editado. Também é possível duplicá-lo ou deletá-lo.
Ao duplicar um rascunho, um novo rascunho de slide é gerado no mesmo estado em que estava o rascunho original.

Uma vez que o usuário clique em publicar, o rascunho é publicado e os slides ficam disponíveis através de um link, no estado em que estavam quando o usuário realizou esta ação. Caso o usuário faça mais alterações no rascunho do slide publicado, estas alterações estarão disponíveis apenas no rascunho, a menos que o usuário clique em publicar novamente, gerando uma nova versão do slide publicado.

É importante destacar que, atualmente, um slide publicado não pode ser deletado, mesmo que o rascunho que gerou o slide tenha sido deletado.

![Visão da Informação](visao_da_informacao.png)
