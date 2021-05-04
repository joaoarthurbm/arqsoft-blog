+++
title = "fzf - command-line fuzzy finder"
date = 2020-10-07
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Bruno Roberto Silva de Siqueira.

- Matrícula: 118110854
- Contato: bruno.siqueira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/junegunn/fzf

# Descrição Arquitetural -- Filtro para commandline

Este documento - feito através de texto e diagramas aos moldes do [modelo c4](https://c4model.com) - descreve o programa para commandline [fzf](https://github.com/junegunn/fzf), sua interação com o shell, outros programas, e até comunicação com plugins.

* Importante destacar que haverá um foco apenas no shell unix.

## Descrição Geral sobre o fzf

O fzf é um programa utilizado para filtrar informações de um input no shell, de maneira interativa, inclusive com suporte a multiseleção e previews.

Ao receber uma entrada qualquer de texto, invocado o comando `fzf`, o usuário pode digitar uma string qualquer para executar uma busca do tipo [fuzzy](https://en.wikipedia.org/wiki/Approximate_string_matching). Filtradas as linhas relevantes, o usuário poderá selecionar a linha desejada, a qual será devolvida ao shell.

Apesar de aparentemente simplório, todas as operações acima descritas são completamente customizáveis. É possível utilizar regexes, em vez de fuzzy; selecionar múltiplas linhas; executar operações nas linhas antes de devolvê-las ao shell; expor previews; customizar a exibicão das linhas; dentre várias outras customizações.

Também, por ser um programa de commandline, operando com strings puras, a integracão com outras ferramentas, via plugins, é bastante fácil de ser implementada via sub processos.

Dados os pontos acima expostos, o fzf é uma ferramenta bastante poderosa para a commandline. Age em muitos casos como uma interface interativa para alguns programas de commandline, um *de facto* [TUI](https://en.wikipedia.org/wiki/Text-based_user_interface), como para [git](https://github.com/bigH/git-fuzzy), [sed](https://github.com/ms-jpq/sad), [docker](https://medium.com/@calbertts/docker-and-fuzzy-finder-fzf-4c6416f5e0b5), entre outros.

## A filtragem interativa

### Objetivo Geral

Implementar um programa que opere com stdin/stdout, permitindo a busca interativa por linhas relevantes no conteúdo de entrada.

### Objetivos Específicos

A busca e interface devem ser inteiramente customizáveis, permitindo a utilização **com** e **por** outros programas.

### Contexto

Nesta seção eu espero duas coisas: o diagrama de contexto e um texto curto descrevendo em mais detalhes o contexto do sistema. Isso inclui as fronteiras do sistema, os sistemas/serviços externos com os quais ele se comunica etc.

Abaixo estão dois exemplos de diagramas de contexto.

O `fzf` é um processo que vive inteiramente no terminal. Este pode ser invocado pelo usuário de diversas formas:

1. Via um pipe, como método de busca e seleção de output: `$ comando1 args | fzf | comando2`
2. Diretamente, invocando um comando padrão pré-configurado (por default o `find`): `$ fzf`
3. Via subprocesso, quando algum outro processo shell quer aproveitar seu mecanismo de busca e seleção (ou diretamente pelo usuário neste modo: `$ comando $(fzf)`): `kill -9 <tab>`
4. Via integração com o próprio shell, a exemplo do `bash` e `zsh`: `vim **<tab>`

![fig1](./fzf_context.png)

### Containers

Por ser uma aplicação shell auto-contida, o `fzf` não dispõe de muitos containeres. Apenas podemos dividir a parte gráfica da aplicação, a *tui* (*terminal user interface*) e sua parte *core* - o programa de fato.

Funcionalidades como argumentos passados pelo usuário, flags, dentre outros, serão geridas pelo *core*, via a leitura do comando invocado, em interação direta com o *shell*. A *tui* apenas desenha gráficos já enviados pelo *core*, bem como provê ao usuário feedback para seus filtros, aatual opção selecionada e os previews (enviados prontos pelo *core*).

![fig2](./fzf_containers.png)

### Componentes

O `fzf` conta com três componentes principais dentro do seu core: o *Terminal*, *Matcher* e o *EventBox*, porém há muitos outros instanciados na sua execução.

Apesar de ser o *Terminal* que interpreterá os comandos do usuário, e irá expor comandos de renderização para a *tui*, estes são intermediados pelo *EventBox*.

O *EventBox* é um componente utilitário que detecta pressionamento de teclas e cliques do usuário na interface gráfica. Os eventos então são observados pelo *Terminal* (aqui dito como o componente interno do `fzf`), que reage quando algum comando é solicitado por exemplo. Também reage a movimentação do usuário para renderizar novos previews, executar subprocessos, dentre outros.

Detectadas pressionamentos de teclas *char* diretas, é visto que o usuário está executando uma busca, que então é enviada para o *Matcher*.

O *Matcher* é quem de fato faz a comunicação com o algoritmo de busca e devolve resultados para a interface, novamente, via eventos.

![fig3](./fzf_components.png)
