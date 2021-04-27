+++
title = "Documentação Arquitetural do Appwrite"
date = 2021-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Jessé Souza Cavalcanti Neto.

- Matrícula: 117110637
- Contato: jesse.neto@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/appwrite/appwrite

# Descrição Arquitetural -- Appwrite

Este documento descreve a arquitetura do serviço [Appwrite](https://github.com/appwrite/appwrite).
As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

É importante destacar que o foco principal da análise será o serviço de _Users_ do Appwrite, entretanto, será possível entender como funciona a estrutura monolítica + microserviços adotado pelo projeto, uma vez que os outros serviços seguem a mesma lógica.

## Descrição Geral sobre o Appwrite

O Appwrite é um servidor backend end-to-end que tem como objetivo abstrair grande parte da complexidade, muitas vezes repetitivas, na construção de aplicativos modernos. O serviço é composto por um conjunto de APIs, ferramentas e um console para gerenciamento que auxiliam no desenvolvimento de diversas features, tais como:

 - Gerenciamento de conta
 - Autenticação
 - Preferências do usuário
 - Persistência de banco de dados
 - Funções de nuvem
 - Manipulação de Imagens
 - Dentre outros serviços

Além disso tudo, o Appwrite é **cross-platform**, ou seja, é possível executar em qualquer lugar independente de sistema operacional, linguagem de programação, framework ou plataforma, permitindo uma fácil integração com vários serviços distintos.

## O Serviço de Users

### Objetivo Geral

Fornecer o serviço de cadastro, autenticação e gerenciamento de usuários a aplicação do usuário, permitindo que o mesmo possa implementar um sistema de cadastro/login na aplicação (página web, aplicativo IOS/Flutter/Android ou mesmo outro servidor) sem se preocupar com a implementação e persistência dos dados.

### Objetivos Específicos

O sistema de usuários do Appwrite permite que o desenvolvedor gerencie os usuários que consomem sua aplicação, permitindo que o mesmo possa criar, procurar, bloquear usuários, visualizar informações de sessão, revisar últimas atividades ou até mesmo obter informações do User Agent do usuário somente através do consumo da API REST.

## Contexto

O objetivo principal do Appwrite é fornecer grande parte das funcionalidades que um backend normalmente proveria, permitindo ser usado tanto em ambiente de desenvolvimento para prover suporte ao desenvolvimento do Frontend Web, como também pode ser usado em produção devido a sua alta escalabilidade.

Dito isso, o sistema principal do Appwrite se comunica com o usuário tanto através de sua interface web quanto por meio do consumo de sua API REST (diretamente ou através de suas SDKs).

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-contexto.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 1 - Diagrama de Contexto do Appwrite
    </span>
</div>

## Container

O serviço de usuários do Appwrite envolve basicamente os 3 componentes que serão descritos abaixo:

O **Console** é o container responsável por fornecer uma interface web para que o desenvolvedor consiga ter acesso a parte dos serviços do Appwrite, dentre eles, o gerenciamento de usuários. O console segue o padrão MVC e foi implementado utilizando PHP e HTML (para as views), além da framework [Utopia PHP](https://github.com/utopia-php/framework). A comunicação com o serviço de _Users_ se dá por meio do protocolo HTTP.

O **Database** é o container responsável por armazenar, de forma estruturada, as informações referentes a todos os serviços e workers disponibilizados pelo Appwrite. O banco de dados utilizado é o MariaDB e os dados de cada serviço é separado através de _collections_ distintas.

O **Users** é o container responsável pelo gerenciamento do serviço de usuários na aplicação. O serviço disponibiliza uma API REST para que outros serviços e sistemas possam consumir seus recursos. Foi implementado utilizando o Utopia PHP. 

A API do serviço de **Users** disponibiliza 11 endpoints para gerenciamento de usuários que podem ser acessados diretamente via HTTP ou pelo uso de uma das suas [SDKs](https://appwrite.io/docs/sdks). Segue uma breve descrição de alguns dos endpoints:


**`POST /v1/users`**
- **Descrição:** Cria um novo usuário.

- **_Request_**
    - **`email`:** Email de cadastro do usuário.
    - **`password`:** Senha do usuário.
    - **`name`:** Nome do usuário.

- **Exemplo de _Payload_**
    ```json
    { 
        "$id": 1,
        "name": "exemplo",
        "registration": 181058,
        "status": 1,
        "email": "email@email.com",
        "emailVerification": "emailver@email.com",
        "prefs": {}
    }
    ```

**`GET /v1/users/{userId}`**
- **Descrição:** Retorna um usuário a partir do id.

- **_Request_**
    - **`userId`:** Identificador único do usuário.

- **Exemplo de _Payload_**
    ```json
    { 
        "$id": 1,
        "name": "exemplo",
        "registration": 181058,
        "status": 1,
        "email": "email@email.com",
        "emailVerification": "emailver@email.com",
        "prefs": {}
    }
    ```

**`DELETE /v1/users/{userId}`**
- **Descrição:** Remove um usuário a partir do id.

- **_Request_**
    - **`userId`:** Identificador único do usuário.

- **Exemplo de _Payload_**
    ```json
    204
    ```

A lista completa dos endpoints de usuário fornecidos pode ser encontrado neste [link](https://appwrite.io/docs/server/users).

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-containers.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 2 - Diagrama de Containers do Appwrite
    </span>
</div>

## Componentes

Olhando os containers descritos acima, é possível subdividi-los em componentes mais específicos. 

O **Console** pode ser subdividido em **Views** e **Console Controller** seguindo o padrão MVC. As **Views** contém os templates HTML + PHP que serão retornados ao usuário quando o mesmo acessa uma rota X, por exemplo, caso o usuário acesse `/console/account`, é retornada a view _account_. Já o **Console Controller** é o responsável por receber as requisições e retornar as **Views**.

Já o **Users** possui somente um componente que seria o próprio **Users Controller**. Ele é o responsável por receber as requisições HTTP de outros serviços (internos e externos), além de conter a lógica de negócios necessária para o gerenciamento dos usuários, como o tratamento e o acesso ao **Database**.

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-componentes.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 3 - Diagrama de Componentes do Appwrite
    </span>
</div>


## Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

## Visão de Informação

Como o foco deste documento é analizar o Appwrite com foco na funcionalidade de usuários, a informação analisada será os dados cadastrados do usuário.

Os dados cadastrais do usuário podem sofrer alguns eventos, são eles:

- Criação
- Edição dos status
- Edição das preferências
- Edição das sessões
- Remoção do usuário

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-info.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 1 - Diagrama de informação dos dados de usuário
    </span>
</div>

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.

