+++
title = "Turing AI - Documentação Arquitetural"
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

O Viglet Turing AI é uma plataforma que utiliza processamento de linguagem natural (NLP) e aprendizado de máquina para fornecer dados mais inteligentes, possui como principais funcionalidades a Navegação Semântica e o Chatbot. O usuário pode escolher entre vários NLPs para enriquecer os dados. Todo o conteúdo é indexado no Solr como uma ferramenta de busca.

## Contexto
A aplicação é baixada em um arquivo jar, onde, depois de executado, a Turing fornece acesso remoto à administração, configuração e gerenciamento por meio de suas interfaces de aplicativos da Web.

A Aplicação Web permite ao usuário acesso as funcionalidades do sistema, onde muitas delas são interligadas e compartilham informações com as outras. 

* A funcionalidade de NLP possui diferentes configurações de ferramentas para extrair dados por Processamento de Linguagem Natural, o usuário pode inserir esses dados em um modelo de Machine Learning pré configurado, como também pode configurar um novo modelo de acordo com sua preferência.
* O Turing AI utiliza uma Search Engine pré configurada para armazenar e recuperar dados de Converse (Chatbot) e Sites de Navegação Semântica. O Turing também fornece a adição de outras Search Engines para sua execução, assim como a novas configurações das propriedades que dependem dele.

!["Diagrama de Contexto"](contexto.png)

        
 ## Containers

O Sistema tem acesso a 4 funcionalidades: Chatbot, Processamento de Linguagem Natural (PLN), Navegação Semântica e Mecanismo de Busca.

A fonte original de PLN é incorporada através do Open NLP, mas o usuário pode alterar e importar de fontes externas, como: [OpenText Content Analytics](https://www.opentext.com/), [CoreNLP](https://stanfordnlp.github.io/CoreNLP/), [SpaCy](https://spacy.io) e [Polyglot NLP](https://polyglot.readthedocs.io). Isso serve como uma maneira de enriquecer os dados, melhorando assim a tomada de decisão.

!["Container 1"](container-1.png)

Na navegação semântica há o uso de um banco de dados externo da Apache que segue o conceito de [Sqoop](https://sqoop.apache.org), com o intuito de criar consultas complexas e mapear atributos com o objetivo de realizar a indexação baseada no resultado.

!["Container 2"](container-2.png)

## Visão de informação

O diagrama abaixo descreve a máquina de estados do chatbot. Ao iniciarmos uma conversa, o agente espera um input nosso, no caso, uma frase. Com a frase em mãos, ele usa o motor de busca para descobrir a intenção da frase. Nesse ponto, o agente possui uma lista de intenções com a qual está apto a responder, caso o motor de busca não consiga relacionar a frase usada a uma previamente treinada, o agente não entenderá a frase e não responderá. No caso da intenção ser validada, uma resposta é montada de acordo com as frases de resposta.

!["Máquina de estados chatbot"](maquina_de_estados_chatbot.png)