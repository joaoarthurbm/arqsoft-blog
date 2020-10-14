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

Nesta seção eu espero duas coisas: o diagrama de containers e  texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.

![fig3](c4-containers.png)
![fig4](parlametria-container.png)
![fig5](c4-implantacao.png)
![fig6](parlametria-implantacao.png)

### Componentes

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig7](c4-componentes.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Aqui você deve descrever as informações importantes que são coletadas, manipuladas, armazenadas e distribuídas pelo sistema. Você não precisa descrever todas as informações, somente uma parte que seja essencial para o sistema. Por exemplo, se eu estivesse tratando do instagram, faria algo relacionado aos posts.

Além da descrição gostaria de ver aqui um diagrama para descrever os estados (ex: máquina de estados) de uma informação de acordo com as ações do sistema.

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.