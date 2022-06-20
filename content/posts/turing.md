+++
title = "Documentação Arquitetural - Turing"
date = 2022-06-06
tags = []
categories = []
+++

# Autores

Este documento foi produzido pela equipe abaixo:

---
- Nome: Nayara Silva Pereira de Souza
- Matrícula: 118110390
- Contato: nayara.souza@ccc.ufcg.edu.br
---
- Nome: Luciano Erick Sousa Figueiredo Filho
- Matrícula: 118110400
- Contato: luciano.erick.filho@ccc.ufcg.edu.br
---
- Nome: Jaciane de Oliveira Cruz
- Matrícula: 118110412
- Contato: jaciane.cruz@ccc.ufcg.edu.br
---
- Nome: Francisco Igor de Lima Mendes
- Matrícula: 119110609
- Contato: francisco.mendes@ccc.ufcg.edu.br

# Descrição Arquitetural do Turing AI

Este documento descreve parte da arquitetura do projeto [Turing IA](https://github.com/openturing/turing).

## Descrição Geral sobre Turing AI

O Viglet Turing AI é uma solução open source que tem como principais funcionalidades a Navegação Semântica e o Chatbot. O usuário pode escolher entre vários NLPs para enriquecer os dados. Todo o conteúdo é indexado no Solr como uma ferramenta de busca.

## Container

O Sistema tem acesso a 4 funcionalidades: Chatbot, Processamento de Linguagem Natural (PLN), Navegação Semântica e Mecanismo de Busca.

A fonte original de PLN é incorporada através do Open NLP, mas o usuário pode alterar e importar de fontes externas, como: [OpenText Content Analytics](https://www.opentext.com/), [CoreNLP](https://stanfordnlp.github.io/CoreNLP/), [SpaCy](https://spacy.io) e [Polyglot NLP](https://polyglot.readthedocs.io). Isso serve como uma maneira de enriquecer os dados, melhorando assim a tomada de decisão.

!["Container 1"](https://raw.githubusercontent.com/nayarasps/arqsoft-blog/nayara.souza/content/posts/turing/container-1.png)

Na navegação semântica há o uso de um banco de dados externo da Apache que segue o conceito de [Sqoop](https://sqoop.apache.org), com o intuito de criar consultas complexas e mapear atributos com o objetivo de realizar a indexação baseada no resultado.

!["Container 2"](https://raw.githubusercontent.com/nayarasps/arqsoft-blog/nayara.souza/content/posts/turing/container-2.png)

## Visão de informação

O diagrama abaixo descreve a máquina de estados do chatbot. Ao iniciarmos uma conversa, o agente espera um input nosso, no caso, uma frase. Com a frase em mãos, ele usa o motor de busca para descobrir a intenção da frase. Nesse ponto, o agente possui uma lista de intenções com a qual está apto a responder, caso o motor de busca não consiga relacionar a frase usada a uma previamente treinada, o agente não entenderá a frase e não responderá. No caso da intenção ser validada, uma resposta é montada de acordo com as frases de resposta.

!("Máquina de estados chatbot")[https://raw.githubusercontent.com/joaoarthurbm/arqsoft-blog/a23ed778cc00bea228962c2a8cc079047f3a9b76/content/posts/turing/Maquina%20de%20estados%20chatbot.png]