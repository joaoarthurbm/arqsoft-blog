+++
title = "Descrição Arquitetural Animavita"
date = 2021-08-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Arthur Stevam de Azevêdo Costa

- Matrícula: 119210939
- Contato: arthur.stevam.costa@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/animavita/animavita

# Descrição Arquiterual - Animavita

## Descrição Geral Sobre o Animavita

O Animavita é um aplicativo mobile, criado com o objetivo de ajudar seus usuários 
a adotarem um pet. O aplicativo permite o cadastro de animais para adoção, especificando
nome, raça, porte, dentre outras características que ajudem na escolha do pet pelos
usuários que desejarem adotar.

## O Aplicativo Animavita

### Objetivo Geral

Desenvolver um aplicativo que facilite a adoção de animais, permitindo que pessoas cadastrem
animais para adoção e que procurem por animais para adotar. 

### Objetivos Específicos

Proporcionando facilidade de encontrar e de escolher um animal para adoção, o Animavita
centraliza informações úteis na hora da adoção em um único aplicativo, permitindo que o
usuário possa visualizar o animal a ser adotado e que saiba informações adicionais como 
nome, idade, sexo e porte. Além disso, o aplicativo auxilia com que animais de rua encontrem um lar para viver.


### Contexto

Buscando facilitar o ato de adoção de animais em um único aplicativo, o Animavita permite que os Usuários realizem login, cadastrem animais para adoção, busquem por um animal para adotar ou até mesmo entrem em contato para combinar a adoção.

O animavita utiliza de um serviço externo fornecido pelo **Facebook** para realização da autenticação dos seus usuários. 

![contexto](animavita-contexto.png)


### Containers

O **Animavita** é composto por diversos containers, nosso módulo principal foi criado utilizando o expo, para desenvolvimento mobile utilizando React Native, esse módulo roda diretamente no dispositivo do usuário e para sua construção faz uso de outros módulos. 

Um dos módulos utilizados pelo core do aplicativo Animavita é o **i18n**, módulo responsável por realizar toda configuração de linguagem escolhida pelo usuário. E dois módulos que auxiliam na montagem e estilização das telas, que são os módulos de **UI** e **Theme**, que interagem entre sí e fornecem rescursos para o core.

Entrando nos módulos que rodam nos servidores do Animavita, temos o nosso **Banco de Dados**, que é feito com **MongoDB** e tem seus dados acessados e fornecidos ao core do Animavita por meio de uma **API GraphQL**, produzida em TypeScript.

![container](animavita-containers.png)


## Componentes

Vamos demonstrar um pouco melhor como funciona a arquitetura do módulo GraphQL do Animavita. Para começar, o **Usuário** se comunica com o aplicativo **Animavita** e acessa suas funcionalidades. O frontend do Animavita é reponsável por fazer chamadas ao módulo GraphQL para assim acessar e escrever dados do **Banco de Dados**.

No GraphQL temos dois principais módulos que se comunicam com o Banco de Dados para escrever e ler seus dados, um deles é o **Gerenciador de Usuário**, onde são realizadas atividades como guardar um perfil de usuário, pegar informações sobre um determinado usuário, atualizar e até mesmo autenticar um usuário. Como segundo módulo, temos o **Gerenciador de Adoção**, esse módulo se responsabiliza por atividades de criação e resgate de adoções.

![components](animavita-components.png)


## Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>


## Visão de Informação

Demonstraremos a seguir o fluxo de informação no momento em que é requisitada uma lista de Adoções realizada pelo usuário. No primeiro momento por segurança é realizada a autenticação do usuário, autenticado o fluxo segue para o resgate de usuário, onde pegamos um usuário e suas informações, para a partir daí pegar as listas de adoções referentes apenas ao usuário específico.

![informacao](animavita-informacoes.png)