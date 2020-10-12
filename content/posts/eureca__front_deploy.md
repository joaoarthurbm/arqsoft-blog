+++
title = "Documento referente à arquitetura do Frontend e Deploy do projeto Eureca"
date = 2020-10-06
tags = []
categories = []
+++

***

***

# Autores

Este documento foi produzido por Hércules Rodrigues Anselmo.

- Matrícula: 117210908
- Contato: hercules.anselmo@ccc.ufcg.edu.br
- Projeto documentado: [Eureca Frontend](https://github.com/computacao-ufcg/eureca-frontend) & [Eureca Deploy](https://github.com/computacao-ufcg/eureca-deploy)

# Descrição Arquitetural -- Serviço Eureca

Este documento descreve parte da arquitetura do projeto [Eureca](https://github.com/computacao-ufcg). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar, não será descrita toda a arquitetura do Eureca. O foco aqui é a descrição do serviço Frontend e Deploy.

## Descrição Geral sobre o Eureca-Frontend e Eureca-Deploy

O Eureca-Frontend é um projeto que tem como objetivo separar a parte visual do projeto Eureca. Atualmente está sendo possível visualizar apenas um dos sub-módulos do Eureca, que é o sub-módulo Estatísticas.

O Eureca-Deploy é um projeto com principal objetivo efetuar o Deploy do Eureca, além de fazer todo o processo de configuração, escalabilidade e scripts para o Banco de Dados.

## O Serviço Eureca

### Objetivo Geral

Servir uma plataforma administradora para coordenadores de cursos da UFCG. A princípio está sendo desenvolvida para o curso de Ciências da Computação - UFCG. Esta plataforma tem como principal objetivo aumentar a eficiêcia e a facilidade para o coordenador com respeito aos discentes do curso. Ela contará com diversos serviços que auxiliará o coordenador na sua administração, sendo estes:

- Monitoramento
- Estatísticas
- Comunicação
- Serviços

### Objetivos Específicos

Queremos implantar os dados obtidos através do eureca-coleta-dados em um banco de dados para que este possar ser acessado por um outro projeto Eureca (eureca-backend), que servirá uma API para ser acessada pelo eureca-frontend, sendo este, responsável por mostrar visualmente todos os serviços disponíveis na plataforma.

### Contexto

### Containers

### Componentes

### Código

### Visão de Informação

# Contribuições Concretas
