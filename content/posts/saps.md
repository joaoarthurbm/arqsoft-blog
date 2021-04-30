+++
title = "Documentação arquitetural para o SAPS"
date = 2020-10-10
tags = []
categories = []
+++

***

<img src="./logo.png" style="width: 50%; display: flex; margin: 0 auto;"/>
Projeto SAPS para construção de uma plataforma automatizada que realize o cálculo do método SEBAL utilizando imagens de satélite.

***

# Autores

Este documento foi produzido por Thiago Yuri Evaristo de Souza.

- Matrícula: 117211156
- Contato: thiago.souza@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ufcg-lsd/saps-engine

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [SAPS](https://github.com/ufcg-lsd/saps-engine). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o SAPS

O SAPS é um projeto que tem como objetivo processar imagens de satélite utilizando o [método SEBAL](https://en.wikipedia.org/wiki/SEBAL) de forma a facilitar o usuário (geralmente um pesquisador) que deseja realizar analises sobre os resultados obtidos pelo seu processamento automático. Mais detalhes sobre o projeto podem ser vistos [neste link](https://www.sciencedirect.com/science/article/pii/S0098300419302961).

### Imagem de satélite

Imagem de satélite é um arquivo de imagem ([TIFF](https://en.wikipedia.org/wiki/TIFF)) obtido por sensoriamento remoto a partir de um satélite artificial. Existem diferentes satélites de recolha de imagens, os mais conhecidos são QuickBird, Ikonos, Landsat e Spot.

No contexto do SAPS, a única família de satélite com suporte é a [Landsat](https://en.wikipedia.org/wiki/Landsat_program).

### Método SEBAL

SEBAL (Surface Energy Balance Algorithm for Land) é um algoritmo que usa o balanço de energia de superfície para estimar aspectos do ciclo hidrológico, mapeando então informações como evapotranspiração, crescimento de biomassa, déficit hídrico e umidade do solo.

Essa quantificação do balanço de energia é calculado usando dados de satélite que originam características da superfície terrestre, como albedo da superfície, índice de área foliar, índice de vegetação e temperatura da superfície. Além das imagens de satélite, o modelo SEBAL requer dados meteorológicos, como velocidade do vento, umidade, radiação solar e temperatura do ar relativos a região de analise.

### Scripts

O SAPS é composto de 3 grandes partes para realizar seus processamentos, são eles:
- inputdownloading: responsável pela aquisição dos dados a serem utilizados, como dados de elevação, metereológicos ou até mesmo as próprias imagens de satélite.
- preprocessing: responsável pela preparação dos dados obtidos como por exemplo, extração de pixels de nuvens/sombra de nuvens, [reprojeção de imagens](https://docs.qgis.org/2.14/pt_BR/docs/user_manual/working_with_projections/working_with_projections.html) e entre outros.
- processing: responsável pela aplicação do algoritmo final (por exemplo, SEBAL) nos dados preprocessados para geração de novos dados uteis para o usuário a fim de realizar analise e extração de informações.

Essas fases são selecionadas pelo usuário formando um pipeline de processamento, cada uma dessas fases é implementada e executada utilizando containers Docker configurados e preparados para execução do passo necessitando somente dos dados de entrada.

## SAPS

### Objetivo geral

Implementar uma plataforma em que usuários possam requisitar/acompanhar/recuperar processamentos de imagens de satélite em um determinado intervalo de tempo e localização, que serão realizados de forma automática.

### Objetivos específicos

Ter uma plataforma abrangente, que possa processar imagens de diversos tipos de familias de satélite (LANDSAT, ...) e computar diversos métodos de processamentos de imagens, além do SEBAL.

### Contexto

![diagrama-contexto](contexto.svg)

No diagrama de contexto é apresentado como se da a interação dos demais elementos com a plataforma SAPS. Primeiramente temos os clientes, que requisitam processamentos de imagens de satélite (em um intervalo de tempo e lugar), depois os mesmos acessam para acompanhar a execução do seu processamento e por fim depois que finalizar, recuperar os dados calculados pelo SAPS a partir das imagens fornecidas na entrada.

Temos também o serviço de e-mail que é utilizado pelo SAPS para envio de mensagens para o usuário, principalmente dos dados finais de um processamento. Além dos datasets (imagens de satélite, dados de elevação e dados meteorológicos) que são bastante uteis para obtenção de informações para o processamento. O serviço de storage serve para armazenar dados finais ou parciais dos processamentos feitos pelo SAPS, isto é destinado a um serviço externo que possui uma boa tecnologia que lida melhor com questões de segurança e persistência dos dados.

Por último, o serviço de execução de trabalhos que é responsável por receber um workload e executa-lo, e depois enviar informações sobre a execução. Por exemplo, selecionar uma VM com 2GB ram e 4 CPUs, levantar um container docker X (no caso do SAPS será os algoritmos dos passos de inputdownloading, preprocessing ou processing) e executar os comandos Y e Z com os argumentos A e B. Por fim, o serviço vai acompanhar a execução e coletar os exitcodes de cada comando e concluir se o trabalho foi bem sucedido ou falho. O que é importante nesse serviço é sabe o estado final da execução e manter os resultados em um local acessível e seguro.

Existe uma coisa complicada associada entre os datasets e o serviço de execução de trabalhos que será abordado na visão de componentes.

### Containers

![diagrama-containers](containers.svg)

No diagrama de containers, o sistema SAPS é amplicado em três novos blocos:
- GUI: Responsável por interagir com o usuário de forma facilitada e gerar workload
- API da aplicação: Responsável por interagir com os pedidos da GUI de workload ou obtenção de informação e processa-las
- Database: Responśavel por registrar informações sobre processamentos e usuários

#### GUI

A GUI possui uma interface com algumas operações simples como:
- **Submeter nova requisição de processamento** gerando workload a aplicação do SAPS
- **Acompanhar processamento** verificando os estados do processamento fazendo com que a aplicação do SAPS gere uma listagem das informações para o usuário
- **Obter resultados** gerando workload a aplicação do SAPS para organização dos dados resultantes e disponibização dos mesmos por meio de um email


#### API da aplicação

A API possui algumas operações simples como:
- Adicionar nova requisição de processamento
- Adicionar novo usuário
- Recuperar informações sobre processamentos
- Enviar resultados de processamentos

#### Database

O banco de dados é responsável por manter os dados do usuário e processamentos.

### Componentes

![diagrama-componentes](componentes.svg)

No diagram de componentes são apresentados três componentes principais pertencentes a aplicação:
- Dispatcher: Responsável por registrar novos processamentos ou usuários, e obtenção dos mesmos, além de envio de email para o usuário obter os resultados dos processamentos
- Archiver: Responsável por obter processamentos finalizados e prontos para arquivamento dos dados resultantes/parciais no serviço de storage
- Scheduler: Responsável por agendar as execuções dos passos do processamento com o serviço de execução de trabalhos

#### Por que existe uma camada a mais entre os datasets e o serviço de execução de trabalhos?

Como dito na seção sobre o modelo de contexto, o serviço de execução de trabalhos executa um workload enviado pelo SAPS (Scheduler) que irá ser processado em um ambiente. Esse ambiente por sua vez irá rodar os algoritmos dos passos de inputdownloading, preprocessing e processing que estão em containers Dockers.

Na execução desses algoritmos (principalmente de fase inputdownloding), irá ser feito a obtenção dos dados presentes nos datasets de imagens de satélite, de dados de elevação e metereológicos, no caso, ainda existe uma pequena camada do SAPS no que está sendo executado representada pelos algoritmos rodados no serviço de execução de jobs para comunicação com esses datasets.

Importante ressaltar que essa seção é útil para enchar a introdução vista na visão geral com a plataforma SAPS em questões de como o dado é obtido, não sendo feito por nenhum dos componentes, mas por um algoritmo que é executado dentro do serviço de execução de trabalhos.

### Visão da informação


<img src="./fluxo-informacao.svg" style="width: 50%; display: flex; margin: 0 auto;"/>

No diagrama de fluxo de informação é descrito os estados que o processamento pode atingir, começando no estado **created** e finalizando (se bem sucedido) em **archived**. Existem alguns pontos de falha nos estados de downloading, preprocessing, processing e archiving, que são originados por:
- downloading: os arquivos relativos ao processamento não foram encontrados nos datasets de imagens de satélite, metereológicos ou dados de elevação, ou estão corrumpidos. Também pode acontecer por uma situação inesperada que ocorreu nessa fase.
- preprocessing/processing: os arquivos baixados não estão como esperado, ou estão ausentes, ou alguma situação inesperada
- archiving: os arquivos a serem armazenados apresentam problemas para enviar ao serviço de storage, ou algum problema inesperado

# Contribuições concretas

Não realizei a submissão do PR por questões de idioma, as informações/documentações feitas pelo SAPS são em Inglês. Num futuro próximo, pretendo realizar essa contribuição.