+++
title = "Documentação Arquitetural - Binance"
date = 2022-06-06
tags = []
categories = []
+++

***

Este documento tem por finalidade descrever aspectos de conexões instantâneas e segurança da plataforma [_Binance_](https://www.binance.com/) sob a visão do modelo arquiterual [C4](https://c4model.com/). Entender bem como funciona esse sistema é importante, visto que tais conceitos são importantes para o Desenvolvedor de Software. Vale destacar que esse documento não descreve todos os detalhes da arquitetura da Binance.

***

# Autores

Este documento foi produzido por:

| Matrícula | Contato |
|--- |--- |
| 117210327 | joao.pedro.barbosa@ccc.ufcg.edu.br |
| 119210052 | luiz.felipe.farias@ccc.ufcg.edu.br |
| 119210936 | luiz.nery@ccc.ufcg.edu.br |
| 119210656 | matheus.oliveira@ccc.ufcg.edu.br |
+ Projeto documentado: https://github.com/tiagosiebler/binance

## Descrição Geral sobre a Binance
A Binance é uma corretora de criptomoedas, sendo a plataforma com maior volume mundial diário de negociação de criptomoedas. Mais detalhes sobre a empresa podem ser vistos [neste link](https://www.binance.com/pt-BR/about).

### Objetivo Geral
Oferecer um ferramental robustico, utilizando o Node.js, para consumir APIs e WebSockets da Binance, com suporte a TypeScript e browser, para desenvolvimento de aplicações back-end de forma simples, permitindo a criação de rotas para comunição via requisições HTTP.

### Objetivos Específicos
