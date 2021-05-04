+++
title = "Documento arquitetural do Sequelize"
date = 2021-04-14
tags = []
categories = []
+++


# Autores

Este documento foi produzido por José Thiago dos Santos Silva.

- Matrícula: 116110537
- Contato: jose.thiago.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/sequelize/sequelize

# Descrição Arquitetural -- Sequelize

Este documento descreve parte da arquitetura do projeto [Sequelize](https://github.com/sequelize/sequelize). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o Sequelize

O sequelize é um ORM - Mapeamento Objeto Relacional (Object Relational Mapping) para Node.js baseado em promises, que suporta transações sólidas, relacionamentos, eager e lazy loading, replicação para leitura, entre outras funcionalidades. É uma ferramenta que é utilizada para fazer a ponte entre o banco de dados e objetos conhecidos pela linguagem de programação. O sequelize tem suporte para o JavaScript e TypeScript.

## O serviço do Sequelize

### Objetivo Geral

Servir como ponte para consultas e manipulação de dados em um banco de dados, através de objetos do Javascript ou Typescript.

### Objetivo Específico

O Sequelize é um ORM que visa facilitar a integração com banco de dados relacionais no Node.js. Ele prover funcionalidades simples, desde a criação de um banco de dados com poucas tabelas, sem muita complexidade, até suporte a transações sólidas, realcionamentos, replicação de leitura e outras mais.


### Contexto

Os ORM surgiram para facilitar e aumentar a produtividade do desenvolvimento, proporcionando para a linguagem de programação uma forma mais intuitiva e de fácil manutenção, de se comunicar com o banco de dados. Antes da adoção dos ORM, utilizava-se _queries_, através da programação direta na linguagem do banco de dados para realizar ações ações como criar tabelas, fazer consultas e inserir, atualizar e deletar dados. Isso proporcionava dificuldades aos desenvolvedores, pois além de saber a linguagem de programação que escolheu para desenvolver tal projeto, era necessário saber também a linguagem de programação do banco de dados escolhido. Por tanto, os ORM propiciaram a organização dos projetos, fazendo com que a linguagem de programação e a linguagem do banco de dados não se misturem, melhorando a qualidade do código.


O Node.js, ambiente para executar código JavaScript, pode ser utilizado para a criação de CLIs (_Command Line Interface_), aplicações desktop e até mesmo de redes neurais, no entanto, ele se tornou bastante popular nos últimos anos pricinpalmente no desenvolvimento de aplicações web. Diante disso, o Sequelize surge para servir de ponte entre o Node.js e banco de dados relacionais como o PostgreSQL, MySQL, MariaDB, SQLite e MS SQL Server.

O diagrama de contexto do Sequelize pode ser visto abaixo.


![fig1](Context_Diagram.png)
## Containers

Por se tratar de uma biblioteca, o Sequelize, tem  uma implantação bem mais simples que aplicações web, pois não precisam se preocupar com coisa como: persistir dados, rodar o serviço em várias maquinas para uma maior escalabilidade, se comunicar com outras aplicações entres outros fatores. A implantação do Sequelize, é composta por um uníco container, que servirá de ponte da aplicação Node.js, que está usando a biblioteca, com o banco de dados. Esse container possui todos os componentes da biblioteca.

Na imagem abaixo poder visto o diagrama de container  com as informações de implantação.

![fig2](Container_Diagram.png)

## Componentes

O Sequelize tem vários componentes que se conectam para formar a biblioteca, os principais são:

__Sequelize__ - Fornece a instância da biblioteca com os métodos e atributos necessários. Responsável também por acomplar e gerenciar os outros componentes.

__Models__ - Responsável pelas operações básicas do sequelize que vão manipular os dados como: findAll, create, delete, update entre outros. Além disso, pode ser utilizado para definir a estrutura do banco de dados, como também definir os objetos da linguagem.

__Associations__ - Define como os *models* se relacionam entre si. As associações são do tipo: *belongsToMany*, *belongsToOne*, *hasOne* e *hasMany*.

__Query__ - Uma opção para realizar a query na linguagem de banco de dados direta.

__Validator__ - Faz as validações se os atributos e as instâncias estão sendo definidas corretamente.

__Operators__ - Componente que auxília definindo os símbolos que são utilizados para construir as *queries*.

__Dialects__ - Faz a conexão direta com o banco de dados criando as consultas de acordo com os detalhes de cada linguagem. É nesse componente que o resultado das consultas serão mapeados para json, um objeto conhecido da linguagem.

Segue a imagem com a relação entre os componentes.

![fig3](Components_Diagram.png)

## Código

Dentre todas as funcionalidades do Sequelize, foi escolhido para demonstrar o fluxo de informação da biblioteca a seguinte função:

`const foos = await foo.findAll()`

O fluxo pode ser visto na seguinte imagem.

![fig4](Code_Diagram.png)