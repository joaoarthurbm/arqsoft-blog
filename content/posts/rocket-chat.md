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

## Contexto

O sistema do Rocket.Chat interage com alguns serviços e aplicações externas no seu funcionamento. Selecionamos os principais para descrever e representar as interações no diagrama de contexto abaixo. Basicamente, um usuário/cliente utiliza o RocketChat para enviar e receber mensagens em tempo real com segurança e criptografia. O RocketChat utiliza o MongoDB para armazenar e consultar diversos dados na aplicação. Além disso, o sistema utiliza o serviço LogEntries para realizar o monitoramento e gerenciamento dos logs da aplicação. O Heroku é utilizado para fazer o processo de build e deploy da aplicação. Para o envio e recebimento de SMS, o Rocket.Chat utiliza os serviços do Twilio. E, por fim, o usuário possui a possibilidade de importar suas informações do Slack, fazendo com que o sistema se comunique com o Slack também.

![Diagrama de contexto](rocketchat-context-diagram.png)

## Containers
O rocket-chat pode ser apresentado em apenas um container principal, no qual apresenta as chamadas e o fluxo das mesmas. Evidenciando o que já é deixado claro no diagrama de contexto: Diversas chamadas a apis externas. O rocket possui tanto aplicação mobile (Android e IOS) desenvolvida em react native quanto web (html e css), ambas se comunicam com a api rest através do protocolo http.

![containers](rocketchat-container-diagram.png)

## Visão de Informação

Uma parte essencial para o sistema é como ele lida com mensagens criptografadas para fornecer comunicações seguras. Ele funciona da seguinte maneira, ao clicar duas vezes no nome de usúario do contato, abre uma janela de canal. Ele habilita o Off-the-Record Messaging para enviar mensagens criptografadas. Quando o transmissor habilita o OTR, o sistema alerta o receptor para habilitar o OTR em sua janela de canal para receber essas mensagens criptografadas. Em segundo plano, o software rapidamente divide suas mensagens em pacotes criptografados pela Signal Protocol Library. Os pacotes são enviados para o lado do receptor através do Internet Relay Chat. Quando os pacotes são recebidos, eles são descriptografados pela Signal Protocol Library. Finalmente, a mensagem aparece na janela do receptor.

<h4 align="center"> Diagrama Máquina de Estados para Mensagens Criptografadas </h4>

![Diagrama Máquina de Estados para Mensagens Criptografadas](rocketchat-diagrama-maquina-de-estados.png)
