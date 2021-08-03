+++
title = "Documento Arquitetural do Asperathos"
date = 2021-07-27
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Diego Alves Gama.

- Matrícula: 117110223
- Contato: diego.gama@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ufcg-lsd/asperathos

# Descrição Arquitetural -- Asperathos

Este documento descreve a arquitetura do projeto [Asperathos](https://github.com/ufcg-lsd/asperathos). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

#TODO.

## Descrição Geral sobre o Asperathos

O Asperathos é uma plataforma de controle e orquestração para aplicações replicáveis em ambientes de nuvem (como AKS, AWS ou GKE). A sua principal função é controlar a replicação de uma aplicação na infraestrutura de nuvem escolhida, de maneira a equilibrar métricas configuradas nele, sejam elas de *Quality of Service* (QoS) geral ou específicas da aplicação. 

Por exemplo, para um software executando na AWS, e que analisa remessas de exames médicos com prazos, o Asperathos pode controlar as réplicas do software de forma a atender à demanda dentro do *deadline*, mas também de maneira a minimizar o custo da infraestrutura.

### Contexto

O Asperathos é imerso em um contexto naturalmente de nuvem. Seu objetivo é atender às necessidades de controle de pessoas que desejam que suas aplicações sejam controladas para garantia de QoS, e apenas para aplicações replicáveis. Isto é, aplicações que ou sejam *stateless* ou cujo estado interno não atrapalhe replicação automática de si mesma.

Assim, o Asperathos é usado por um cliente interessado através de algum software que o utilize, e que pode submeter um arquivo especificando o job e como ele acontecerá. Aqui, um job representa uma carga de trabalho a ser executada em **batch** (uma carga por job, com *deadline*) ou em **streaming** (em sequência sob demanda do cliente, por tempo indefinido).

Após isso, o Asperathos recebe o job, e começa a se comunicar com algum cluster Kubernetes acessível para controlar a replicação. O Kubrentes e aplicações auxiliares do Asperathos criadas nele enviam periódicas informações sobre o job e sobre a aplicação, e utilizando elas o Asperathos decide se deve haverá **scale-up** (aumento de réplicas) ou **scale-down** (diminuição de réplicas) de forma a gerir QoS e economia de recursos, e gerencia essas aplicações auxiliares.

É também possível que o cliente utilize suas próprias implementações específicas para os componentes do Asperathos, mas esses detalhes são mais profundos e serão tratados em seguida. O diagrama abaixo ilustra essa interação entre os contextos

![fig1](contexto_asperathos.png)
