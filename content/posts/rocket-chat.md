+++
title = "Descrição Arquitetural - Rocket.Chat"
date = 2022-06-04
tags = []
categories = []
+++

# Autores

Este documento foi produzido por:

- Gabriel Menezes Cabral
  - Matrícula: 119110372
  - Contato: gabriel.cabral@ccc.ufcg.edu.br
- Marcos Vinícius Santos Silva
  - Matrícula: 119111008
  - Contato: marcos.silva@ccc.ufcg.edu.br
- Adeildo Lucas Guerra Pereira
  - Matrícula: 119110614
  - Contato: adeildo.pereira@ccc.ufcg.edu.br
- Anderson de Lima Leite
  - Matrícula: 120110679
  - Contato: anderson.leite@ccc.ufcg.edu.br

- Projeto documentado: https://github.com/RocketChat/Rocket.Chat

# Descrição Arquitetural -- Rocket.Chat

Este documento descreve a arquitetura do projeto [Rocket.Chat](https://github.com/RocketChat/Rocket.Chat). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Rocket.Chat

O Rocket.Chat é uma plataforma de comunicação open-source com código totalmente personalizável desenvolvida em JavaScript para organizações ou usuários comuns que desejam um alto padrão de segurança de dados.
Conhecida por ser uma alternativa open-source à plataformas como Slack, Zendesk for Service, Intercom e Sendbird, possui os seguintes objetivos: permitir conversas em tempo real entre colegas, com outras empresas ou com clientes; fornecer ferramentas de gerenciamento de projetos e tarefas visando o aumento da produtividade dos usuários; proporcionar total segurança e controle dos dados ao cliente; disponibilizar uma plataforma de comunicação de fácil personalização e integração através de APIs, plugins e webhooks.