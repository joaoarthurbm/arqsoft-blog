+++
title = "Documentação arquitetural - Anki"
date = 2021-04-16
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Igor Seabra.

- Matrícula: 117210304
- Contato: igor.seabra@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ankitects/anki

# Descrição arquitetural -- Anki

Este documento descreve a arquitetura do aplicativo [Anki](https://github.com/ankitects/anki). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Sobre o Anki

[Anki](https://apps.ankiweb.net/) é um serviço open source para auxiliar na memorização de conteúdos de forma eficiente, automática e customizável.

Ele permite ao usuário estudar cartões (compostos geralmente por uma pergunta na frente e sua resposta no verso) através de um sistema de repetição espaçada, ou seja, mostrando os cartões novamente em intervalos de tempo baseados no quão bem o usuário sabe o conteúdo daquele cartão. Os cartões podem possuir texto, imagens, áudio e vídeo, permitindo que o Anki seja usado para estudar praticamente qualquer tipo de conteúdo, como idiomas, conteúdo acadêmico ou artístico.

Os usuários podem criar seus próprios baralhos com qualquer conteúdo nos cartões ou usar baralhos prontos criados por outros usuários, disponíveis na plataforma [AnkiWeb](https://ankiweb.net/shared/decks/).