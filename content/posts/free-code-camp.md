+++
title = "Documentação arquitetural para a plataforma freeCodeCamp"
date = 2019-10-29
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Arthur Silva Lima Guedes.

- Matrícula: 118110410
- Contato: arthur.guedes@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/freeCodeCamp/freeCodeCamp

# Descrição Arquitetural -- freeCodeCamp

Este documento descreve a arquitetura da plataforma [freeCodeCamp](https://github.com/freeCodeCamp/freeCodeCamp). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que o foco nessa descrição são os módulos *api-server* e *client* do repositório acima.


## Descrição Geral sobre o freeCodeCamp

freeCodeCamp é uma comunidade sem fins lucrativos com o propósito de ajudar no processo de aprendizagem de desenvolvimento de software. Através de uma plataforma web de aprendizagem interativa (e outros meios como fóruns e posts), milhares de pessoas tem a oportunidade de aprender sobre desenvolvimento web, análise de dados, *machine learning*, entre diversos outros assuntos, tudo isso de forma 100% gratuita. Algumas respostas para perguntas frequentes podem ser encontradas [aqui](https://www.freecodecamp.org/news/about/).

## A plataforma de freeCodeCamp

### Objetivo Geral

Implementar uma plataforma de aprendizagem interativa que torne acessível aos usuários assuntos das mais diversas áreas da computação.

### Objetivos Específicos

É de extremo interesse acompanhar o progresso do aluno em relação ao *curriculum* (similar a um guia de conteúdos), o quanto o mesmo está progredindo nas lições e nos desafios.

### Contexto

Abaixo, é possível observar o diagrama de contexto do sistema. Nele, temos um usuário que, em nosso contexto, é descrito como o estudante (ou potencial estudante) da área de programação. A plataforma freeCodeCamp usa o AWS SES (um dos sistemas externos) para o envio de emails para os estudantes, além de um sistema de pagamentos (o PayPal) para os usuários que desejam realizar doações para ajudar a comunidade.

<img class="center" src="contexto.png" alt="Diagrama de contexto - freeCodeCamp" style="width:60%">

### Containers

Abaixo, observamos o diagrama de container para a plataforma freeCodeCamp:

![Diagrama de container - freeCodeCamp](container.png)

A partir da imagem acima, infere-se que o container **freeCodeCamp-Client** (parte da aplicação que é executada no lado do cliente; o frontend) é acessado diretamente pelo usuário do sistema. O container **API-Server** expõe uma *API REST* que será usada pelo *client* para ter acesso a toda parte executada no servidor. A API ainda usa um banco de dados NoSQL, para operações de escrita e leitura (em relação aos schemas). Abaixo, tem-se uma descrição mais detalhada dos containers explicitados:

* freeCodeCamp-Client: Nesse container, são executadas funções solicitadas pelo cliente. É responsável também por lidar com os eventos desencadeados pelas ações do usuário. Além disso, renderiza os componentes que, juntos, constroem as páginas da plataforma e fornecem para o usuário um ambiente interativo e prático. Comunica-se com a API usando o protocolo *HTTP*.
* API-Server: Container que engloba toda a parte do servidor da aplicação. Define os models, rotinas de inicialização do sistema, templates para emails, etc. Além disso, preocupa-se com a lógica de aspectos como autenticação (usando *OAuth*) e doações. Como dito acima, esse container fornece uma API REST para ser, consequentemente, consumida pelo container do Client.
* Database: Container que provê um armazenamento para os dados do sistema, como as informações dos usuários. A aplicação usa o *Compose*, uma plataforma *cloud database*, que torna o gerenciamento da DB mais prático e fácil. O banco de dados usado aqui é o Mongo, um banco de dados não relacional (NoSQL). O MongoDB no compose é oferecido através do serviço de *cloud* da IBM.

Sobre a implantação do sistema, os containers freeCodeCamp-Client e API-Server traduzem-se em máquinas virtuais na núvem, providas pela plataforma Azure. Detalhes dos pipelines de testes de aceitação e CI podem ser vistos com mais detalhes através dos seguintes links:
* [Azure DevOps](https://dev.azure.com/freeCodeCamp-org/freeCodeCamp/_build)
* [Travis CI](https://travis-ci.org/github/freeCodeCamp/freeCodeCamp/branches).
