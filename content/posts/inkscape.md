+++
title = "Inkscape"
date = 2020-10-13T20:00:32-03:00
images = []
tags = []
categories = []
+++

### Autores

Este documento foi produzido por Gustavo Alves.

- Matrícula: 117110919

- Contato: gustavo.daniel.alves@ccc.ufcg.edu.br

- Projeto documentado: https://gitlab.com/inkscape/inkscape | https://gitlab.com/inkscape/extensions

# Descrição Arquitetural – InkEx API

Este documento descreve parte da arquitetura do projeto Inkscape. Essa descrição foi baseada principalmente no modelo C4.

É importante destacar que não será escrita toda a arquitetura do Inkscape. O foco principal é descrever a InkEx, API que permite a criação e utilização de extensões no programa.

## Descrição geral sobre o Inkscape

O Inkscape se define como um editor de gráficos vetoriais open source. O programa funciona de forma similar a aplicativos famosos como Adobe Illustrator e Corel Draw, com a diferença de utilizar como forma nativa o padrão aberto SVG (Scalable Vector Graphics).

## A InkEx

#### Objetivo geral

Permitir a extensão por parte dos usuários das funcionalidades do Inkscape a partir de uma API.

#### Objetivo específico

Expor uma API que permita que os usuários adicionem funcionalidades ao Inkscape sem necessitar conhecer C++ e GTK, porém apenas Python e XML, tornando-a mais acessível e sem necessidade de compilação prévia.

#### Contexto

<img src="Diagrama de contexto.svg" class="center" style="height: 700px;">

Por padrão o Inkscape dá suporte a diferentes fluxos de trabalho, desde a sua utilização para a criação de novos vetores como para o processamento dos já pré-existentes. Apesar disto, é sempre interessante permitir que o usuário expanda as funcionalidades do software aumentando a sua produtividade ou abrindo um novo leque de possibilidades de criação.

Para isto, o Inkscape fornece uma API que permite integrar scripts de funcionalidade ao fluxo de trabalho do programa.

#### Containers

<img src="Diagrama de contêineres.svg" class="center">

As extensões do Inkscape são acessados pelo próprio Inkscape, sendo expostas a partir dos front-ends disponíveis (GUI e CLI). Ao aplicar a funcionalidade de uma extensão, o back-end envia o SVG para a extensão que deverá processá-la e retornar o SVG modificado para o back-end.

#### Componentes

<img src="Diagrama de componentes.svg" class="center">

As extensões do Inkscape são compostas de dois componentes:

##### Descritores

Os descritores são arquivos Inkscape XML (.inx) que fornecem informações ao Inkscape referentes aos parâmetros, interface, strings para tradução, configuração e identificação da extensão.

##### Scripts

Os scripts são os arquivos Python que serão utilizados para realizar o processamento dos arquivos. Eles recebem o SVG a partir de um caminho ou pela entrada padrão. Após finalizar os processamento do arquivo, os scripts podem tanto salvar o arquivo modificado ou reenviá-lo ao Inkscape pela saída padrão. Apesar de não aconselhável, os scripts podem chamar o Inkscape da mesma forma para realizar alguma operação específica.

#### Implementação

> Nesta etapa não faremos diagramas que apresentam detalhes da
> implementação. Faremos isso mais adiante.

#### Informação

O fluxo e estados da informação são bastante simples. O SVG é recebido via arquivo ou entrada padrão, é feito uma cópia que se processada corretamente é escrita no arquivo ou na saída padrão.

<img src="Visão de informação.png" class="center">

### Contribuições concretas
