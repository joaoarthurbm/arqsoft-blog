+++
title = "Documento Arquitetural do Compcult Mobile"
date = "2021-04-15"
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Adiel Andrade Rocha.

- Matrícula: 114110411
- Contato: adiel.rocha@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/CompCult/compcult-mobile

# Descrição Arquitetural -- CompCult Mobile

Este documento descreve a arquitetura do [Compcult Mobile](https://github.com/CompCult/compcult-mobile).
As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

## Descrição Geral

O Compcult Mobile é um aplicativo base feito com o framework [Flutter](https://flutter.dev/), para dispositivos Android e Ios. Sendo então aplicativo de compartilhamento e aprendizado dinâmico através de atividades didáticas em mundo real e virtual, utilizando assim de uma estrategia de gamificação em realidade alternada. O aplicativo conecta o professor e o aluno, onde o professor tem acesso a um painel web onde ele configura as missões, quizzes e mini-games disponiveis para seu alunos, e ficam assim disponiveis para o aluno realiza-los no aplicativo.

O Compcult Mobile conta com as seguintes funcionalidades:

- Criação de conta
- Login
- Responder missões onde podem ser enviado fotos, videos, audio, geolocalização e texto
- Responder quizzes
- Mini-games(jogo da memoria)
- Criação de Grupos

Mais informações podem ser encontradas [aqui](https://github.com/CompCult/compcult-mobile#readme).

## CompCult Mobile

## Objetivos

Oferecer um aplicativo de ensino em realidade alternada que conecta alunos e professores para dispositivos Android e Ios. Capaz se adaptar as mudanaças necessarias para cada cliente

## Contexto

![fig1](DiagramaContexto.png)

O sistema da aplicação do CompCult Mobile é utilizado por um unico tipo de usuario (Estudantes). Ele interagem com o sistema atráves de um aplicativo mobile (Android, Ios). O qual se comunica com um webservice que tem como usuario principal o usuario do tipo (Professor). 

## Containers

![fig2](DiagramaContainer.png)

O aplicativo é a porta principal de acesso com os usários, a comunicação do aplicativo com o container Backend é feita via http/dio utilizando de json como modelo de dados. A comunicação entre o backend e o Mongo Atlas é feita via http. O Heroku é PaaS que hospeda e orquestra toda a infraestrutura de processos do CompCult Mobile. 


## Componentes


![fig3](DiagramaComponentes.png)


O Compcult mobile se expande e divide-se em quatro componentes: Screens, Controllers, Repositoryies e Models. A Screen consiste em ser o componente visual do aplicativo, renderiazando as interfaces presentes. O component controlles é o responsavel por fazer as chamadas ao repositories e tambem por conter a logica de negocio da aplicação. O Repositories é responsavel por fazer as requisições via http/Dio para o serviço backend CompCult-Api, ja o Models, é responsavel por manter os modelos de dados da aplicação.

### Código


Em breve.


## Visão de Informação

![fig4](Diagrama_de_informações.png)

A máquina de estados acima representa os possíveis estados que as atividades dos estudantes podem assumir. Ele acessa as atividades, e pode realizar varias missoes, quisses ou mini-games.

## Contribuições Concretas

Nenhuma contribuição realizada ate o momento

