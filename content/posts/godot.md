+++
title = "Documentação de Arquitetura da Engine de Jogos: GODOT"
date = 2021-04-24
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Thomaz Morais.

- Matrícula: 117211053
- Contato: thomaz.morais@computacao.ufcg.edu.br
- Projeto documentado: https://github.com/godotengine/godot


## Descrição Geral sobre o GODOT

O Godot é uma engine de criação de jogos 2d e 3d gratuita e de código aberto. Ela é capaz de exportar jogos para a maior parte das plataformas disponíveis na atualidade (video games, mobile, desktop e web) e ela traz uma série de ferramentas que facilitam na hora de desenvolver jogos. O objetivo deste projeto é fazer uma descrição arquitetural desta engine. Mais detalhes sobre o projeto podem ser vistos [neste link](https://godotengine.org/).

### Objetivo Geral
Criar jogos multiplataforma através de sistemas de scriptagem e programação visual que sejam intuitivos para os desenvolvedores e competitivo com outras engines de jogos. 

### Objetivos Específicos
Compilar, utilizando os arquivos estruturados pelo programa (sons, imagens, scripts e nodes), jogos. Nesta documentação em específico será feito um panorama geral de como funciona o GODOT na questão dos arquivos, compilação e desenvolvimento de um projeto.

### Contexto

O GODOT é uma aplicação que não possui muitos serviços ao redor dele. A engine de desenvolvimento de jogos está dividida basicamente na própria aplicação de desenvolvimento e nos compiladores de plataformas específicas. Ilustrados na Figura 1 temos a demonstração do diagrama de contexto da aplicação onde há um usuário que utiliza o GODOT para desenvolvimento, e neste caso específico temos o GODOT se utilizando das ferramentas do visual studio para gerar uma aplicação executável que poderá ser testada pelo próprio desenvolvedor.

![fig1](context.png)
Figura 1 - Diagrama de contexto do GODOT

### Containers

O GODOT é composto por um único container que contém todas as ferramentas dentro dele próprio.

Ele é composto pelo editor de nodes. Nodes são a únidade básica do projeto. Tudo que existe dentro de um projeto é uma node. O personagem, a fase, objetos físicos, estáticos, objetos que reproduzem som, tudo isto é chamado de node dentro de um projeto do godot. O editor de nodes por sua vez possui um sistema de edição de scripts para adicionar funcionalidades a determinados nodes. Além disso o GODOT conta com um sistema de importação de arquivos para administrar os arquivos que serão utilizados nos projetos (e.g. música, modelos, imagens, etc) e esse sistema de arquivo é composto por diretórios e arquivos que estão apenas organizados por pastas dentro de um projeto do GODOT.

Por fora, o GODOT utiliza das ferramentas do visual studio community 2017 para executar a compilação do projeto para windows, criando assim um arquivo executável do projeto.

![fig1](containers.png)
Figura 2 - Diagrama de Containers


### Componentes
O GODOT roda dentro da máquina do usuário, na aplicação o usuário é capaz de editar configurações do projeto, nodes, scripts e importar arquivos. Temos também a parte de configuração de projeto que pode alterar para qual plataformas queremos exportar o projeto que (neste caso para desktop) utiliza as ferramentas do visual studio community para compilar o projeto para a plataforma windows.

![fig1](components.png)
Figura 3 - Diagrama de Componentes


### Visão da Informação
A informação que o GODOT lida em si é o projeto do jogo. O projeto do jogo é um conjunto de arquivos de nodes, sons, imagens, vídeos, modelos 3d, etc que compõem um projeto de jogo. Na Figura 4 é demonstrado um diagrama de visão da informação que mostra os possíveis estados de um projeto. A princípio temos a criação do projeto, em seguida temos o projeto em desenvolvimento (onde o usuário poderá editar o projeto adicionando imagens, códigos e implementando features), depois desta etapa temos a compilação. A compilação pode resultar em erro (e o projeto vai retornar ao desenvolvimento) ou na geração de um arquivo executável do projeto. Se no projeto estiver faltando features ele volta ao desenvolvimento. Se não o projeto está pronto para lançamento ou compartilhamento em uma plataforma qualquer que o desenvolvedor decidir lançar.

![fig1](visao.png)
Figura 4 - Diagrama da Informação
