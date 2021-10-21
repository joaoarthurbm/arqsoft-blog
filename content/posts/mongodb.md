+++
title = "Arquitetura do MongoDB"
date = 2021-10-19
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Yally de Lima Galdino.

- Matrícula: 116211039
- Contato: yally.galdino@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/mongodb/mongo


# Descrição Arquitetural -- Banco de Dados MongoDB.

O MongoDB é um software de banco de dados NoSQL, orientado a documentos livre, é opensource, permite que outros servidores repliquem sua database, tem alto desempenho e é flexível.

## Descrição Geral sobre o MongoDB

O MongoDB é um software de banco de dados NoSQL, que é orientado a documentos livre, é opensource, permite que que outros srvidores repliquem seu database, tem alta performace e é flexível.

## O banco de dados MongoDB

### Objetivo Geral

O objetivo do MongoDB consiste em permitir que dados sejam indexados e sejam fáceis de serem buscados, mesmo quando estão complexos hierarquicamente, permitindo que a modelagem por parte das aplicações ocorra de forma mais natural.

### Objetivos Específicos

O MongoDB, por ser AdHoc, permite, realizar buscas por campo, intervalo e expressões regulares, utilizar funções JavaScript, visualizar amostras aleatórias. 
Além disso, por realizar replicação dos seus dados, o MongoDB tem alta disponibilidade. 
Também é oferecida a indexação primária e secundária dos campos em documentos.
Outra funcionalidade oferecida ao usuário do MongoDB é utilizar JavaScript no lado do servidor.
Por fim, o MongoDB oferecer suporte a transações ACID multi-documento.

### Contexto

Para ocorrer o funcionamento, um usuário, através de um browser ou outra aplicação, fará uma requisição para o Driver ou App com funcionamento como um plugin e se conectará com o Banco de Dados. O MongoDB executará e retornará operações, gerenciando os processos.
![fig1](contexto.png)

### Containers

O MongoDB possui os seguintes sistemas: 
- Mongod
- Mongos
- Mongo 

O principal processo de MongoDB é o Mongod, responsável pelas requisições, gerenciamento de formatos de dados e execução de operações de gestão. Já o Mongos, tem função de controller, roteamento de consulta e de configurações e de determinar a localização dos dados. Por fim, o Mongo é o shell interativo do MongoDB.

![fig2](container.png)

### Componentes

Há dois principais componentes na aplicação do mongod:
- replSet: consiste em um servidor que realiza réplica do MongoDB
- qtconsole: realiza a configuração do particionamento de dados (realiza consultas e determina localização)

![fig3](componente.png)

### Visão de informação

Como foi visto anteriormente, o MongoDB é um banco de dados não-relacional de documentos (JSON). Ele tem como características aninhar documentos, criar links artificiais e tem operações de escrita atômica em um nível de um único documento.

As etapas a seguir irão demonstrar como usar o shell do MongoDB. Nesse caso, em um sistema Linux.

- Conectar-se ao MongoDB;
- Listar os bancos de dados presentes no servidor;
- Usar ou criar um banco de dados;
- Exibir o banco de dados atual;
- Criar uma coleção;
- Criar um documento;
- Listar coleções do banco de dados atual;
- Listar todos os documento da coleção.

![fig4](informacao.png)