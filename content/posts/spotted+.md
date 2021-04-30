+++
title = "Documentação arquitetural para o SAPS"
date = 2019-10-22
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Vítor Alves Correia Lima de Aquino.

- Matrícula: 116211457
- Contato: vitor.aquino@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/caiosbl/spotted 

## Descrição Arquitetural - APP Spotted+

Este documento descreve parte da arquitetura do APP SPOTTED+. Este documento tem uma descrição é baseada no modelo C4, ao qual permite que diferentes stakeholders possam compreender o funcionamento com ajuda de visões arquiteturais.

### Descrição Geral sobre o Spotted

O Spotted++ é um aplicativo desenvolvido para dispositivos mobile onde permite que o usuário envie spotteds para os alunos da UFCG, 
confirir quais eventos acadêmicos estão rolando, ficar informado sobre os acontecimentos internos da instituição e ainda sobre o que 
acontece de bom nos finais de semana da região.
Em linhas gerais, é um app de integração, onde tenta otimizar o que a pagina @spottedUFCG no instagram faz.


## Objetivo Geral

O objetivo do projeto é disponibilizar um serviço para divulgação e facilidade de informar aos estudantes acontecimentos internos da instituição, sobre o que acontece na cidade e região, além de conhecer novas pessoas, tirar duvidas, buscar necessidades pontuais.

## Objetivo Específicos

A ideia é, principalmente, facilitar e interagir os estudantes da UFCG, fazendo com que os estudantes possam fazer publicações, seja de duvidas ou informativas, possam ter mais entreterimento e algumas outras diversidades. Podemos concluir que o APP tem a intenção de captar todo "tipo" de estudante, com quaisquer finalidade.

## Contexto

Como o Spotted+ é uma aplicativo que podemos equipará-lo a uma rede social, os usuários serão alunos da graduação. Onde eles fazem o login e a API retorna as requisições.

[fig1](diagramaContexto.png)

Diante do que foi exposto no diagrama de contexto, o SPOTTED+ utiliza de uma API interna que fornece todas as rotas para as funcionalidades.