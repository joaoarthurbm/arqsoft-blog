+++
title = "Documentação arquitetural para o Youtube-dl"
date = 2019-10-12
tags = []
categories = []
+++

***

Este documento descreve a arquitetura do projeto youtube-dl

***

# Autores

Este documento foi produzido por Thaís Nicoly Araújo Toscano.

- Matrícula: 115111596
- Contato: thais.toscano@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ytdl-org/youtube-dl

# Descrição Arquitetural -- Youtube-dl

Este documento descreve parte da arquitetura do projeto [Youtube-dl](https://github.com/ytdl-org/youtube-dl). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

<p style="font-size:12px">É importante destacar que as informações são baseadas no pouco tempo para estudo e dedicação ao sistema e aprendizagem do modelo, podendo não conter informações precisas.</p>

## Descrição Geral sobre o Youtube-dl

O Youtube-dl é um programa de linha de comando para baixar vídeos do YouTube.com e de alguns outros sites.

## O Serviço de download do youtube-dl

### Objetivo Geral

Facilitar o download de videos para o usuário.

### Contexto

Primeiramente, o usuário irá fornecer a url para o sistema via linha de comando 

<p style="font-size:15px">(youtube-dl [ OPTIONS ]* URL [ URL... ])</p>

Após isso, o youtube-dl irá identificar o sistema externo a qual a url vem e irá fazer uma requisição para saber se existe algum video vindo da url que foi lhe passada.
Caso exista um video, o sistema externo irá passar as informações e nossa api irá retornar para o usuário o download do video. 

<p style="font-size:12px">*vide readme do projeto para ver as opções</p>
<br>

<img class="center" src="c4-context.png" style="width:60%;background-color:#FFFF">

### Containers

Este sistema é uma API que recupera dados dos sistemas externos e faz o download para o usuário final, sendo assim não tendo contaners com front/back/database para visualização no diagrama.

<img class="center" src="c4-containers.png" style="width:50%;background-color:#FFFF">

### Componentes

O sistema inicia através do arquivo main.py, o arquivo init.py inicia as configurações do projeto. Quando o usuário entra com a url, o componente extractor buscará no sistema externo primeiro se a url contém video, identificando-o traz as informações necessárias (algumas impostas pelo usuário na linha de comando na seção options) e envia para o componente postprocessor que irá pegar estas informações, modelar e enviar para o component downloader que efeturá o download do video.

Abaixo um exemplo de diagrama de componente para o sistema externo Youtube.

<img class="center" src="c4-componentes.png" style="width:100%;background-color:#FFFF">


