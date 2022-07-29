+++
title = "Documentação arquitetural - Saloon Time"
date = 2021-08-02
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Redson Farias.

- Matrícula: 116110895
- Contato: redson.filho@ccc.ufcg.edu.br
- Projeto documentado: 
  - https://github.com/thallysonjsa/saloon-time-api
  - https://github.com/thallysonjsa/saloon-time

## Descrição Arquitetural – Saloon Time
Este documento descreve a parte da arquitetura do projeto Saloon Time. A descrição arquitetural aqui apresentada foi construída tendo como base o modelo C4.

## Descrição Geral sobre o Saloon Time
Saloon Time é uma plataforma de gerenciamento e agendamento de salões, onde o usuário pode ser um salão ou um cliente. Usuários do tipo salão conseguem gerenciar os seus agendamentos, além de gerenciar seus funcionários e serviços, já os usuarios do tipo cliente conseguem ver e agendar com os serviços dos salões cadastrados na plataforma.

## Objetivos Específicos
Aumentar a visibilidade dos salões, além de facilitar o gerenciamento interno dos mesmos através da automatização dos agendamentos e da praticidade de gerenciar seus funcionários e serviços.

## Contexto
O diagrama de contexto apresentado a seguir mostra uma visão geral dos sistemas com os quais o Saloon Time se comunica e os perfis de usuários que interagem com o sistema.

![fig1](context.png)

A comunicação pode ser resumida da seguinte forma:
  - O Saloon Time se comunica com a amazom s3 para armazenar as imagens.
  - O Saloon Time se comunica com base de dados para permitir os serviços de login e cadastro e para coletar as informações necessárias.

## Containers
O diagrama de containers apresentado a seguir mostra os elementos internos existentes no Saloon Time e como se comunicam com os serviços internos e externos.

![fig2](conteiner.png)

O sistema é composto por dois containers: o frontend e o backend. Suas responsabilidades podem ser resumidas da seguinte forma:
  - Frontend possibilita a interação com o usuário, realizada através de uma interface desenvolvida em React Native.
  - Backend responsável pela comunicação externa com o banco de dados para gerenciar os dados referentes ao usuário, é feito utilizando Nodejs.

## Componentes
O diagrama de componentes apresentado a seguir mostra os elementos internos existentes no backend do Saloon Time e como se comunica com os serviços internos e externos.

![fig3](componente.png)

O componente backend  é composto por quatro componentes: o gerenciador de salões, gerenciador de clientes, gerenciador de funcionários e o gerenciador de serviços. Suas responsabilidades podem ser resumidas da seguinte forma:
  - Gerenciador de salões é responsável pelo controle dos salões, realizando atividades como cadastro e atualização.
  - Gerenciador de clientes é responsável pelo controle dos clientes, realizando atividades como cadastro e atualização.
  - Gerenciador de funcionários é responsável pelo controle dos funcionários, realizando atividades como cadastro e atualização.
  - Gerenciador de eventos é responsável pelo controle dos eventos, realizando atividades como cadastro e atualização.

## Código
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.

## Visão de Informação
O diagrama apresentado a seguir mostra o fluxo da informação no Saloon Time para o agendamento de um serviço.
![fig4](informacao.png)