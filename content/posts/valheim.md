+++
title = "Documentação arquitetural para o Valheim" 
date = 2021-04-15 
tags = [] 
categories = [] 
+++

***

Este documento descreve a arquitetura do projeto Valheim server docker.

***

# Autores

Este documento foi produzido por André Filipe Queiroz.

- Matrícula: 116210818
- Contato: andre.soares@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/lloesche/valheim-server-docker

# Descrição Arquitetural -- Servidores Dedicados para Valheim


Este documento foi produzido para a disciplina de Arquitetura de Software da UFCG, descrevendo parte da arquitetura do projeto [Valheim Server Docker](https://github.com/lloesche/valheim-server-docker) e usando como descrição principalmente o modelo [C4](https://c4model.com/).


## Descrição Geral sobre o Valheim Server Docker

O Valheim Server Docker é um projeto Open-Source que permite ao usuário configurar como desejar um servidor dedicado no jogo eletrônico Valheim, utilizando comandos via terminal.

## Servidores Dedicados para o Valheim Utilizando Docker

### Objetivo Geral

Implementar  e configurar com o auxílio da plataforma Docker permitindo um processo repetível e configurável para gerenciar a execução de servidor(es) dedicado(es) para o jogo Valheim.

### Objetivos Específicos

Valheim tem hospedagem “peer-to-peer”, mas se o host se desconectar, o mundo não estará mais acessível a ninguém e todos os outros serão removidos do mundo. Hospedar um servidor Valheim dedicado resolve isso sendo acessível 24 horas por dia e 7 dias por semana, para que seus amigos possam jogar mesmo se você não estiver online, tornando a experiência ainda melhor.
Além disso, se precisarmos atualizar o servidor, simplesmente o reconstruiremos em um único comando com o Docker. Como um contêiner do Docker, o servidor pode ser executado em qualquer computador que também execute o Docker. Isso significa que é fácil mover o servidor para outro computador, se necessário.

### Contexto

Com o Docker instalado na máquina host, este é executado por linha de comando, no terminal. Depois de executar o comando de execução do Docker, com isso será puxado a imagem do Valheim Server mais recente do repositório do Docker que com isso você poderá se conectar ao servidor Valheim localmente ou pela Internet e Conectar-se pela Internet significa que seus amigos também podem se conectar ao servidor Valheim ou criar uma imagem nova personalizada.

![fig1](contexto.png)

### Containers

Sabendo disso, usamos a interface de linha de comando (CLI) do Docker chamada docker para executar a aplicação, ademais o Docker usa uma arquitetura cliente-servidor, em que o cliente Docker se comunica com o daemon Docker , que faz o trabalho pesado de construir, executar e distribuir seus containers Docker. O Docker fornece também Dockerfiles(construção de imagens automaticamente lendo instruções) assim podendo fazer uma nova imagem Docker que inicie automaticamente o servidor Valheim sem ter que entrar no contêiner e inserir comandos manualmente. Assim, a imagem Docker do servidor Valheim deve ser o mais genérica possível, permitindo ao usuário personalizar o comportamento específico do servidor em tempo de execução.

![fig2](container.png)

### Componentes

No diagrama de componentes (localizado abaixo) temos os componentes, além de seus relacionamentos.  O Dockerfile é um documento de texto que contém todos os comandos que um usuário pode chamar na linha de comando para montar uma imagem, nada mais é do que um meio que utilizamos para criar nossas próprias imagens. Os volumes são o mecanismo preferencial para persistir os dados gerados e usados por containers Docker, assim os volumes são totalmente gerenciados pelo Docker. Sabendo disso, para poder compartilhar dados entre o contêiner e o host usamos o recurso Volumes do Docker, já com a montagem de ligação, o diretório a ser criado na máquina host é montado em um contêiner. Então por padrão, o contêiner Updater irá verificar se há atualizações do servidor Valheim a cada 15 minutos se nenhum jogador estiver conectado ao servidor e o de backup O contêiner será inicializado e criará periodicamente um backup do worlds/diretório.

![fig3](componentes.png)

### Visão de Informação

No diagrama de informação é descrito os estados que o processamento pode atingir, ao iniciarmos você pode copiar um mundo existente(já existindo uma imagem Docker) ou você pode criar um novo mundo do zero manualmente com as configurações de sua preferência. A imagem Docker do servidor Valheim deve ser o mais genérica possível, permitindo ao usuário personalizar o comportamento específico do servidor em tempo de execução, isso significa que escrevemos um script personalizado para iniciar o servidor Valheim que controla como o servidor é iniciado e encerrado. Sabendo que ao criarmos uma imagem Docker do servidor Valheim, então precisamos executá-lo como um contêiner e que por fim Hospedar um servidor dedicado requer permitir conexões de entrada das portas que o servidor Valheim usa.

![fig4](visao.png)


