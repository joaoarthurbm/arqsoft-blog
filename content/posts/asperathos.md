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

## Descrição Geral sobre o Asperathos

O Asperathos é uma plataforma de controle e orquestração para aplicações replicáveis em ambientes de nuvem (como AKS, AWS ou GKE). A sua principal função é controlar a replicação de uma aplicação na infraestrutura de nuvem escolhida, de maneira a equilibrar métricas configuradas nele, sejam elas de *Quality of Service* (QoS) geral ou específicas da aplicação. 

Por exemplo, para um software executando na AWS, e que analisa remessas de exames médicos com prazos, o Asperathos pode controlar as réplicas do software de forma a atender à demanda dentro do *deadline*, mas também de maneira a minimizar o custo da infraestrutura.