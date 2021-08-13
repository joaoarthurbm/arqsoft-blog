+++
title = "Documentação Arquitetural do Material UI"
date = 2021-07-28
tags = []
categories = []
+++

***

Este post tem como objetivo documentar, através do modelo C4,
a arquitetura do Material UI.

***

# Autores

Este documento foi produzido por Misael Augusto Silva da Costa.

- Matrícula: 117110525
- Contato: misael.costa@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/mui-org/material-ui

# Descrição Arquitetural -- Material UI

Este documento descreve parte da arquitetura do projeto [Material UI](https://github.com/mui-org/material-ui). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Material UI

Material UI é uma biblioteca de componentes customizáveis para desenvolvimento de
interfaces de uma forma mais ágil, bonita e acessível a aplicações que utilizam o
framework ReactJS. Nele você pode criar o seu próprio *Design System*, como também
iniciar com o *Material Design*.

## Objetivo

O Material UI foi desenvolvido com o objetivo de ser o mais simples possível de
adicioná-lo em um projeto que utilize o framework ReactJS e com poucas linhas de
código, adicionar componentes prontos, customizáveis e reutilizáveis para construir interfaces bonitas e responsivas.

### Contexto

Essa biblioteca é utilizada por desenvolvedores front-end que trabalham em projetos
que utilizam o framework ReactJS. A linguagem de programação é indiferente, podendo
ser tanto javascript, quanto typescript. Ao adicionar o Material UI em um projeto,
o desenvolvedor ou a empresa tem alinhado em mente que essa decisão arquitetural
irá impactar, principalmente, a agilidade na construção das interfaces e uma padronização
e reutilizalção de código em todo o projeto.

![fig1](context-diagram.png)

### Containers

Analisando a documentação do projeto dessa biblioteca, identificamos pelo menos cinco
containers no projeto principal: componentes, api de componentes, estilos, sistema e customização.

No diagrama de containers abaixo podemos identificá-los dentro do Material UI.

![fig1](containers-diagram.png)

### Componentes

![fig1](components-diagram.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação