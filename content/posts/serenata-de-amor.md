+++
title = "Serenata de Amor - Documentação arquitetural "
date = 2020-10-04
tags = ['corrupcao','governo','auditoria']
categories = []
+++

***

<img src="./logo.png" style="width: 50%; display: flex; margin: 0 auto;"/>

Projeto de auditoria automática para a cota de auxílio parlamentar de reembolsos para gastos.

# Autores

Este documento foi produzido por Nicácio Oliveira de Sousa.

- Matrícula: 115111897
- Contato: nicacio.sousa@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/okfn-brasil/serenata-de-amor

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [Serenata de Amor](https://github.com/okfn-brasil/serenata-de-amor) e tem como base o modelo [C4](https://c4model.com/).

É importante destacar que este documento visa expor de forma mais abstrata como funciona o conjunto de ferramentas da aplicação e não necessariamente explicará em detalhes a sua implementação.

## Descrição Geral sobre o Serenata de Amor

O serenata de amor é um projeto que visa [auditar gastos públicos](https://brasil.elpais.com/brasil/2017/01/23/politica/1485199109_260961.html) relacionados a cota de auxílio parlamentar a qual é utilizada pelos parlamentares para requerirem reembolsos dos gastos que são relacionados a função parlamentar. Um reembolso pela cota parlamentar pode ser requerido para qualquer tipo de atividade do parlamentar como o gasto com alimentação, passagens aéreas, combustível, aluguéis, assinaturas etc.

A função de auditar a veracidade dos pedidos de reembolso pode ser uma tarefa inumana pela quantidade de pedidos todos os meses. O Serenata de Amor automatiza esse procedimento de auditoria com classificadores para criar alertas sobre notas fiscais com valores duvidosos.

#### Mas como isso é feito?

O projeto possui dois grandes módulos. Um [(Rosie)](https://twitter.com/RosieDaSerenata) para auditar notas fiscais de pedidos de reembolsos e outro [(Jarbas)](https://jarbas.serenata.ai/) para listar os dados auditados de forma fácil.

Um usuário precisa manipular a Rosie para que ela classifique dados entregues pelo governo federal a cada mês e em seguida inserir o conjunto de dados classificados no banco de dados do Jarbas para que ele exiba-os e crie alertas no twitter sobre casos suspeitos.

#### Rosie

Robô que tem sua construção baseada na [toolbox do serenata de amor](https://github.com/okfn-brasil/serenata-toolbox).
A Rosie faz auditoria em notas fiscais que são cadastradas na base de dados do governo federal e classifica cada nota com uma flag de suspeita ou não.

A classificação das notas é feita com base em milhares de variáveis como:

- Gasto exagerados com alimentação, combustível, passagens etc
- Estar em dois lugares ao mesmo tempo
- Valores exorbitantes em localidades que cobram um valor diferente do que a nota fiscal diz
- Valores superfaturados
- ...

#### Jarbas

Painel de controle que exibe os dados auditados pela Rosie de forma organizada.

## Serviço de auditoria de cotas parlamentares

### Objetivo

Implementar um serviço que possa auditar notas fiscais cadastradas na base de dados do governo federal que sejam relacionadas a cota de gastos parlamentares e relacionar cada nota a variáveis que indiquem se cada uma delas é suspeita ou não.

### Objetivos Específicos

Fazer com que a inteligência artificial Rosie consiga interpretar valores e situações de cada nota fiscal que requere reembolso para indicar se cada nota pode ser classificada como suspeita e interagir em rede social criando alertas sobre gastos suspeitos.

### Contexto

A comunicação e contexto gerais dos sitema acontecem entre os dois elementos principais (Rosie e Jarbas) em conjunto com a publicação de mensagens com alertas no twitter.

Os dados devem ser lidos da base de dados do governo federal referente a dados de cota parlamentar. Em seguida, a Rosie deve classificar os dados de acordo com as regras que conhece e mante-los na base de dados em conjunto com o Jarbas. Por fim, a Rosie deve fazer posts de alerta para cada nota fiscal suspeita no twitter.

![fig1](c4-contexto.svg)

### Containers

A Rosie é constituída por um conjunto de classificadores para pedidos de reembolso. É basicamente um módulo python que utiliza Scikit para criar classificadores.

Classificadores:
- Despesas eleitorais
- Empresas irregulares no lançamento das notas fiscais
- Despesas com refeições
- Limite de subcota parlamentar mensal
- Gastos com combustível

---
##### *colocar imagem do container*

##### *ver possibilidade de criar diagrama de implementação*
---

### Componentes

Os componentes da rosie são os seguintes:

Os componentes do jarbas são os seguintes:



### Código

<pre>
    Nesta etapa não faremos diagramas que apresentam detalhes da
    implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação


# Contribuições Concretas
