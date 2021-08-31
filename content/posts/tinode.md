+++
title = "Descrição arquitetural do Tinode chat"
date = 2021-07-31
tags = []
categories = []
+++

---

<img src="./logo.svg" style="width:25%; display: flex; margin: 0 auto"/>
O Tinode chat é um aplicativo multiplataforma de mensagens instantâneas

---

# Autores

Este documento foi produzido por Matheus Oliveira Pereira

- Matrícula: 117110434
- Contato: matheus.pereira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/tinode/chat

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [Tinode](https://github.com/tinode/chat). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral

O Tinode chat é um aplicativo multiplataforma de mensagens instantâneas, com ênfase em comunicação mobile. Uma de suas motivações é criar uma plataforma que seja descentralizada, se tornando muito mais difícil de ser rastreada e bloqueada por governos. Mais informações sobre o produto podem ser encontradas [neste link](https://github.com/tinode/chat).

## O Tinode

### Objetivo Geral

Criar uma plataforma de serviço de chat que seja descentralizada, se tornando muito mais difícil de ser rastreada e bloqueada (por exemplo, por governos).

### Objetivos Específicos

Além de oferecer as funcionalidades básicas de um mensageiro, a ideia é também oferecer liberdade de suporte a diferentes tipos de conexão (pelo usuário) e liberdade de suporte a backends de autenticação personalizados (pelo implantador do sistema). O sistema oferece três abstrações que servem de base em toda a sua implementação, são elas:

- Sessão: conexão entre um client e o servidor (conexão pode ser via gRPC, websocket ou long polling)

- Tópico: canal de comunicação que roteia conteúdo entre sessões. Tópicos podem ser do tipo peer-to-peer (para conversas entre duas pessoas) ou do tipo grupo (para conversas com mais de 2 participantes);

- Usuário: uma pessoa que se conecta ao servidor por meio de uma sessão. Usuários se inscrevem em tópicos para receber mensagens.

### Contexto

O Tinode Chat é uma aplicação de mensageria multiplataforma, em que usuários podem utilizar o serviço uma vez que tenham uma conta no mesmo, existindo a possibilidade de criação de contas anônimas. Usuários podem enviar mensagens para outros usuários ou para grupos compostos por usuários. O Tinode Chat faz uso de um outro serviço da Tinode, chamado Tinode Push Gateway, para fazer o envio e o recebimento de notificações do tipo push.

<img src="./context.png" style="width:115%; display: flex; margin: 0 auto"/>

### Containers

<img src="./containers.png" style="width:175%; display: flex; margin: 0 auto"/>

##### Clients

Proveem a interação do usuário com o servidor do Tinode Chat, por meio de três tipos de conexão, sendo eles: HTTPS (método long polling), WebSocket e gRPC (por meio de sockets TCP ou Unix). As principais funcionalidades fornecidas são:

- Possibilidade de uso multiplataforma, oferencendo opções de uso via Android, iOS, Web ou linha de comando;
- Conversas particulares ou em grupo;
- Pesquisa por usuários específicos;
- Formatação de mensagens estilo markdown;
- Envio de arquivos;
- Formulários e mensagens com template, facilitando o uso de chatbots;
- Possibilidade de checar o status de uma mensagem, que pode ser: entregue ao servidor, recebida, lida ou sendo digitada;
- Usuários anônimos;
- Opção de utilizar plugins para estender funcionalidades do sistema.

##### Authentication Service

Responsável pela autenticação de usuários no servidor. Além de já possuir uma implementação própria, também provê interfaces que possibilitam a integração com soluções de autenticações customizadas.

##### Database

Responsável por armazenar informações de usuários, tópicos e mensagens.

##### Tinode Chat Server

Responsável por responder a todas as requisições dos clientes, bem como manter a aplicação atualizada em tempo real. Aceita conexões via HTTPS (método long polling), WebSocket e gRPC (por meio de sockets TCP ou Unix). Os endpoints oferecidos são:

- /v0/channels para conectar-se ao servidor via websocket
- /v0/channels/lp para conectar-se ao servidor via long polling
- /v0/file/u para realizar upload de arquivos
- /v0/file/s para realizar download de arquivos

Uma vez realizada a conexão entre cliente e servidor, a comunicação entre eles se dá pelo envio de mensagens. Mensagens possuem tipos específicos e bem definidos, como por exemplo:

- Mensagem do tipo {pub}:

```
pub: {
  id: "1a2b3", // id da mensagem
  topic: "grp1XUtEhjv6HND", // tópico ao qual a mensagem está endereçada
  head: { key: "value", ... }, // configurações
  content: { ... }  // conteúdo a ser publicado no tópico (textos, arquivos, etc)
}
```

Esse tipo de mensagem é utilizado por usuários para publicar conteúdo em um tópico. Ao publicar o conteúdo em um tópico, todos os usuários cadastrados naquele tópico irão receber aquele conteúdo.

- Mensagem do tipo {leave}:

```
leave: {
  id: "1a2b3",  // id da mensagem
  topic: "grp1XUtEhjv6HND",   // nome do tópico a ser deixado
}
```

Esse tipo de mensagem é utilizada quando um usuário quer deixar de participar de um tópico em específico. Ao fazer isso, o usuário deixa de receber mensagens entregues àquele tópico.

- Mensagem do tipo {login}:

```
login: {
  id: "1a2b3",     // id da mensagem
  scheme: "basic", // esquema de autenticação
  secret: base64encode("username:password"), // senha criptografada
  cred: [
    {
      meth: "email", // método de verificação (como email, celular, captcha, etc)
      resp: "178307" // resposta da verificação
    },
  ...
  ],
}
```

Esse tipo de mensagem é utilizada quando um usuário quer fazer login no servidor.

### Componentes

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

<img src="./components.png" style="width:175%; display: flex; margin: 0 auto"/>

##### Session Module

Responsável por requisitar o envio de mensagens e também receber mensagens. Além disso, também faz as requisições para subscrição em tópicos pelos usuários.

##### Database Adapter

Provê a interface responsável pela comunicação com o banco de dados da aplicação. A partir desse componente, é possível coletar e atualizar dados do banco da aplicação.

##### Topic Module

Responsável por lidar com a lógica relacionada a tópicos, como por exemplo, receber mensagens e também fazer o envio (broadcast) de mensagens para todos os usuários que estão inscritos em um tópico.

##### Push Module

Provê a interface responsável pela comunicação com o Tinode Push Gateway, que é o serviço de envio de notificações do tipo push feito pela Tinode. A partir desse componente, é possível fazer requisições para o envio de notificações do tipo push para clientes específicos.

##### User Module

Responsável por lidar com a lógica relacionada a usuários, como por exemplo, realizar a criação de contas de usuários, realizar login e realizar requisição para envio de mensagens a um tópico.

##### Authentication Module

Provê a interface responsável pela comunicação com o serviço de autenticação utilizado pela aplicação. Por meio desse componente, é possível fazer requisições relacionadas à autenticação de usuários, como por exemplo: login, logout, criação de conta de usuário e deleção de conta de usuário.

### Visão de Informação

<img src="./info.png" style="width:115%; display: flex; margin: 0 auto"/>

Mensagens são as informações mais importantes na aplicação do Tinode. Ao utilizar o Tinode Chat, é possível visualizar determinados estados em que uma mensagem pode se encontrar, são eles:

- Em digitação: enquanto um usuário está digitando uma mensagem, pessoas inscritas no tópico em que aquela mensagem será enviada poderão visualizar que uma mensagem está sendo escrita;

- Enviada: a mensagem, após escrita, é enviada ao servidor;

- Recebida: a mensagem enviada ao servidor chega ao tópico destino com sucesso. Esse estado é alcançado quando todos os usuários inscritos no tópico recebem a mensagem;

- Perdida: em casos de problema de conexão, uma mensagem pode não ser enviada e um erro é mostrado ao usuário que fez a tentativa de envio;

- Lida: esse estado é alcançado quando todos os usuários inscritos no tópico leem a mensagem.
