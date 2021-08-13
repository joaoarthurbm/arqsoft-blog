+++
title = "Docker - Documentação arquitetural usando o modelo C4"
date = 2021-07-27
tags = []
categories = []
+++

------------

![](hamburg-3021820.jpg)

###### Imagem de [Julius Silver](https://pixabay.com/pt/users/julius_silver-4371822/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3021820) por [Pixabay](https://pixabay.com/pt/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3021820)

<!-- Imagem de <a href="https://pixabay.com/pt/users/julius_silver-4371822/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3021820">Julius Silver</a> por <a href="https://pixabay.com/pt/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3021820"> </a> -->

**TLDR:** Este documento apresenta uma sugestão para a documentação arquitetural do sistema de
conteinerização Docker usando o modelo C4.
Entender bem como funciona esse sistema é importante, visto que os conceitos de containers linux
podem ser muito úteis para pessoas que trabalham com desenvolvimento de software.
É importante destacar que esse documento não descreve todos os detalhes da arquitetura do Docker.

------------

## Autor

Este documento foi produzido por Vinicius Barbosa da Silva.

- Matrícula: 117210708
- Contato: vinicius.barbosa.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/docker/docker-ce

------------

## O que é o Docker?

Docker é um sistema de conteinerização que utiliza recursos do linux como namespaces e cgroups
para criar pacotes de software que são leves, isolados e que agrupam código, bibliotecas e
arquivos de configuração. A aplicação que roda em um container tem a impressão que o sistema
está sendo usado apenas por ela e, dessa forma, não consegue acessar os recursos e processos
de outros containers. Esse isolamento existe graças a funcionalidade de namespaces do linux.

O modelo de conteinerização pode ser muito eficaz para executar aplicações que não requerem uso exclusivo
dos servidores, já que são executados pelo mesmo kernel de um sistema operacional,sendo uma
ótima alternativa a virtualização tradicional com máquinas virtuais que levantam o SO inteiro
e acabam desperdiçando recursos.

Os containers são inicializados com uma Imagem base que pode vir de registro privados ou públicos
como o [docker hub](https://hub.docker.com/). As imagens são construídas por camadas e podem vir 
pre-configuradas com um software de interesse da aplicação que rodará no container. exemplos de imanges: mysql, ubuntu, alpine, nginx, apache, etc. 
Mais detalhes sobre o projeto Docker e sobre containers podem ser vistos [aqui](https://www.docker.com/resources/what-container).

![docker-multilayer](docker-filesystems-multilayer.png)

###### Imagem retirada de [[3](https://ragin.medium.com/docker-what-it-is-how-images-are-structured-docker-vs-vm-and-some-tips-part-1-d9686303590f)]. Nela, podemos ver que o container roda em cima de uma imagem composta por diversas camadas, onde cada uma possui um software específico. É importante mencionar que na base existe um "mini sistema operacional", nesse caso do exemplo o alpine linux

## Diagrama de Contexto

No centro temos o sistema principal, o Docker, que prove serviços para criar, executar, atualizar, gerenciar containers linux.

O Docker pode ser usado de duas maneiras: via CLI ou usando a API diretamente. Ambas as formas produzem o mesmo resultado, apenas a forma de fazer que muda.
Isso permite que sistemas externos como o [Kubernetes](https://kubernetes.io/pt-br/) usem o Docker com facilidade. 

O sistema Docker utiliza um serviço externo de registro de imagens, que pode ser público (como o [Dockerhub](https://hub.docker.com/)) ou um registro privado de uma empresa particular

![context_diagram](diagrama-contexto.png)

## Diagrama de Containers

Os componentes internos do Docker incluem a **CLI**, **API application** e o **Docker storage directory**.

A **CLI** é implementada em golang e [usa a biblioteca Cobra](https://github.com/docker/cli/blob/master/cli/cobra.go)([ver library](https://github.com/spf13/cobra)) para se comunicar com a RESTful API application.

A RESTful **API application** fornece seus serviços por meio do protocolo HTTP ([ver mais](https://docs.docker.com/engine/api/)). Essa api faz a conexão entre a CLI ou aplicação que usa a api diretamente com o deamon do Docker (chamado [Docker Engine API](https://docs.docker.com/engine/api/v1.41/#)), que é o core do Docker e que será melhor descrito no diagrama de componentes.

O **Docker storage directory** é responsável por armazenar os dados dos containers (o filesystem e seus volumes) e as imagens que foram baixadas do registro. Por default, o repositório se encontra em `/var/lib/docker`, mas pode ser trocado para qualquer outro diretório
no sistema de arquivos do servidor, por ex, em um disco externo: `/mnt/disk3/docker`.

![container_diagram](diagrama-container.png)

## Diagrama de Componentes

Os componentes internos da **API Application** foram representados por: **Docker Daemon**, **Kernel Component**, **Container Component** e **Image Component**.

O **Docker Component** é responsável por receber as requisições da API e utilizar os demais componentes internos (Kernel, Image, Container component) para entregar resultado para o cliente, isto é, criar e gerenciar os containers.

O **Kernel Component** existe para lidar com o sistema operacional linux e pedir recursos para a criação de containers como namespaces e cgroups.

O **Container Component** lida com o gerenciamento dos containers.

O **Image Component** lida com o gerenciamento, criação de imagens localmente e download/envio de imagens para o registro.

![components_diagram](diagrama-componentes.png)

## Diagrama da Visão de Informação 

### Ciclo de vida de um container

Os containers docker possuem 5 estados principais: `CREATED`, `RUNNING`, `PAUSED`, `STOPPED` e `DELETED`.

O primeiro estado, **CREATED**, é atingido através do comando *docker create*, estando pronto para seguir para um dos proximos estados: **RUNNING** (via *docker start*) ou **DELETED** (via *docker rm*)

O container quando está no estado **RUNNING**, pode ter diversos caminhos:

- ser pausado e passar para o estado **PAUSED** (via *docker pause*) e possivelmente voltar para o estado **RUNNING** (via *docker unpause*)

- ser reiniciado via *docker restart*

- ser parado e passar para o estado **STOPPED** (via *docker kill* ou *docker stop*)

E por fim, temos o estado **DELETED**, que é atingido ao usarmos o comando *docker rm*.

![components_diagram](event_state.png)
###### Diagrama do ciclo de vida dos containers feito por [Docker Saigon](http://docker-saigon.github.io/post/Docker-Internals) [2]

## Referencias

1. https://www.docker.com/products/container-runtime
2. http://docker-saigon.github.io/post/Docker-Internals
3. https://ragin.medium.com/docker-what-it-is-how-images-are-structured-docker-vs-vm-and-some-tips-part-1-d9686303590f