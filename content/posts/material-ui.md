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
e reutilizalção de código em todo o projeto. Isso de deve ao fato de que os componentes
do Material-UI funcionam isoladamente. Eles são independentes, e só irão injetar os
estilos que eles precisam para exibir.

Abaixo segue o diagrama de contexto do Material UI:

![fig1](context-diagram.png)

### Containers

Analisando a documentação do projeto dessa biblioteca, identificamos pelo menos quatro
containers no projeto principal: componentes, estilos, sistema e customização.

**COMPONENTES:** Os componentes são todos os elementos que são utilizados na criação
das interfaces dos usuários. Este container divide-se em algumas categorias, em cada uma delas iremos encontrar componentes do Material UI que lidam especificamente com aquela
parte do desenvolvimento da interface.

**ESTILOS:** É o container responsável pela forma como são adicionados estilos adicionais
e costumizáveis aos componentes do Material UI.

**SISTEMA:** Este container refere-se aos aspectos gerais da interface, como: exibição,
dimensionamento, espaçamento e tipografia.

**CUSTOMIZAÇÃO:** Essa é a parte do Material UI que lida com os temas e as paletas de cores do projeto, bem como também a densidade dos componentes e estilos globais.

No diagrama de containers abaixo podemos identificá-los dentro do Material UI.

![fig1](containers-diagram.png)

### Componentes

Ampliando a visualização em cada um dos containers e em cada uma das categorias dos
componentes, podemos visualizar os componentes únicos do Material UI. Esses componentes
que estão sendo mostrados são a nível de código, ou seja, existe um componente *Box* no
Material UI que pode ser adicionado em um componente do ReactJS, por exemplo.

![fig1](components-diagram.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Como foi explicado anteriormente, o objetivo do Material UI é facilitar o desenvolvimento
de interfaces web que utilizam ReactJS. Portanto, não há um fluxo complexo de informação entre os componentes. A comunicação entre os componentes é feita apenas a partir de passar e/ou receber propriedades como parâmetro do componente.

Vejamos o exemplo de código abaixo:

```
import React from 'react';
import { Button } from '@material-ui/core';

function App() {
  return <Button color="primary">Hello World</Button>;
}
```

Este é um exemplo extremamente simples, temos o componente *App* que possui apenas um componente dentro dele, o *Button*. A propriedade *color* é definida dentro do componente ao qual o *Button* pertence. Em projetos complexos, o que acontece é que componentes como o *App*, constituem-se a partir de diversos outros componentes complexos. A comunicação entre cada um deles é feita exclusivamente dessa forma, recebendo como parâmetro alguma propriedade, que pode ser um número, uma string, uma função, ou até mesmo um outro componente.