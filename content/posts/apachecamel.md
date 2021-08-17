+++
title = "Documento Arquitetural - Apache Camel"
date = 2021-08-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Lucas Abrantes Furtado Silva.

- Matrícula: 118111727
- Contato: lucas.abrantes.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/apache/camel

# Descrição Arquitetural -- Apache Camel

Este documento descreve a arquitetura do [Apache Camel](https://github.com/apache/camel).
As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Apache Camel

O Apache Camel é um framework open source que permite realizar a integração de sistemas, aplicando regras de roteamento e mediação em uma linguagem específica de domínio baseada em Java, através de arquivos xml geralmente baseados em Spring ou Blueprint, obtendo um preenchimento inteligente das regras de roteamento. Mais detalhes sobre o projeto podem ser vistos [neste link](https://github.com/apache/camel).

## O Serviço de integração de sistemas do Apache Camel

### Objetivo Geral

Criar integrações de forma padronizada, aplicando regras de roteamento. Permitindo, deste modo, que o desenvolvedor faça integrações entre sistemas de uma forma mais simples.

### Objetivos Específicos

Auxiliar no desenvolvimento de projetos que trabalham com integrações de sistemas.

### Contexto

Como o Apache Camel se trata de um framework, os usuários finais são os desenvolvedores de software, que fazem a comunicação de diferentes projetos.

A comunicação com sistemas externos é realizada através de arquivos xml, usando URIs para permitir uma integração mais fácil com todos os tipos de transporte ou modelo de mensagem, incluindo HTTP, ActiveMQ, JMS, JBI, SCA, MINA ou CXF

O Apache Camel permite trabalhar com a mesma API independente do tipo de transporte, possibilitando a interação com todos os componentes fornecidos prontos para uso, com um bom conhecimento da API.

![contexto](apachecamel-context-diagram.png)

### Containers

O Apache Camel faz a comunicação entre sistemas e através de seus containers ele filtra as rotas, faz validações e atua conectando diferentes endpoints a outros sistemas

Além disso, O Apache Camel tem amplo suporte de teste, permitindo que você teste facilmente a unidade de suas rotas.

![container](apachecamel-container-diagram.png)

##### Filter Processor

Esse container cuida dos endpoints, tratando da validação, mediação, rastreamento, escolhendo a melhor rota para a conexão dos sistemas.

##### Camel Components

É responsavel por unificar os endpoints, conectando de fato ao sistema através dele. Seja HTTP, JMS, SCA, etc.

### Componentes

Os componentes do Apache Camel são referências usadas para colocar um componente em uma montagem. Essas referências oferecem serviços de mensagens, envio de dados, notificações e vários outros serviços que podem não apenas resolver mensagens e transferência de dados fáceis, mas também fornecer proteção de dados.

A lista de todos os componentes pode ser encontrada [aqui](https://camel.apache.org/components/3.4.x/index.html#_core_components).

Nesse caso, esses componentes são visualizados no diagrama de uma forma mais ampla, sem muito aprofundamento, uma vez que o Apache Camel possui centenas de componentes, mas que em resumo fazem o que foi citado anteriormente.

![componente](apachecamel-component-diagram.png)

##### Routing Engine

É a partir dela que os terminais são conectados, formando as rotas.

##### Processors

Trata do roteamento, transformação, mediação, enriquecimento, validação e intercepção entre os endpoints.

##### Components

Realiza a conexão entre os endpoints, seja enviando ou recebendo dados.

## Visão de Informação

Ao ser iniciado em um serviço, através do Apache Camel é possível implementar métodos doStart, doStop, doSuspend, doResume.

Com isso, o serviço após iniciar pode ficar suspenso e retornar ou ficar suspenso e ser desligado. Ao ficar suspenso, são feitas as devidas validações em rotas e testes para o serviço voltar ou não a funcionar.

Também é possível que o serviço seja pausado logo após ser inicializado e volte a funcionar posteriormente dependendo da lógica dos métodos que o desenvolvedor implementou. Ou que simplesmente o serviço seja pausado e desligado sem que o mesmo volte a funcionar. Este é o ciclo de vida de um serviço no Apache Camel.

![informacao](apachecamel-visao-informacao.png)