+++
title = "Documento Arquitetural - Create React App"
date = 2021-07-27
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Gabriel Nascimento Santos.

- Matrícula: 117211346
- Contato: gabriel.nascimento.santos@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/facebook/create-react-app

# Descrição Arquitetural - create-react-app

Este documento descreve parte da arquitetura do projeto create-react-app. Essa descrição foi baseada principalmente no modelo C4

## Descrição Geral sobre o Create React App

O Create React App é um projeto desenvolvido pelo Facebook que tem a proposta de gerar um boilerplate inicial para projetos em ReactJS, com o objetivo de ser uma única dependência sem que seja necessária nenhuma configuração mas que também seja totalmente customizável. Mais informações [neste link](https://create-react-app.dev/).

## Objetivo Geral

Implementar um serviço que facilite a criação e configuração de projetos em React.

## Objetivos Específicas

Ter uma base sólida o suficiente para o usuário poder usar no mesmo momento mas também ter a flexibilidade do próprio customizar caso deseje.

## Contexto

O Create React App(CRA) usa o npm ou yarn como gerenciadores de pacote dependendo da preferência do usuário mas caso tenha yarn na sua máquina e não for especificado ele vai automaticamente escolher o Yarn. Ele é um comando que rodamos no terminal para sua inicialização e é chamado uma command line interface que vai informar ao usuário caso tenha algum erro e também mostrar de maneira visual o progresso do download das dependências e pacotes do node_modules.
![create-react-app](cra-context.png)

## Containers

Temos a comunicação com o npm que é feita através do protocolo https, os react-scripts passam por um processo de passar dados para json e temos um banco de dados da Azure que roda um sistema de testes automatizados para testar o CRA nos sistemas operacionais mais populares para desktops/laptops que temos(Linux rodando Ubunto, MacOS e Windows), verificando assim sua compatibilidade e interface em todos os ambientes para seu possível uso.

Temos as configurações no cache local também de sistemas como o Babel que traz compatibilidade para browsers mais antigos, outra configuração que é feita é do Jest que é para testes unitários, ESLint que que está relacionado com o estilo do código a partir de regras que você passa para ele e o o Webpack que é um grande empacotador de módulos de Javascript.
![create-react-app](cra-container.png)

## Componentes

## Visão de informação
