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

A classificação das notas é feita com base em diversas de variáveis como:

- Gastos exagerados com alimentação, combustível, passagens etc
- Estar em dois lugares ao mesmo tempo
- Valores exorbitantes em localidades que cobram um valor diferente do que a nota fiscal diz
- Valores superfaturados
- ...

#### Jarbas

Painel de controle que exibe os dados auditados pela Rosie de forma organizada.
O Jabas também é responsável por criar posts de alerta no twitter indicando pedidos de reembolso suspeitos.

## Serviço de auditoria de cotas parlamentares

### Objetivo

Implementar um serviço que possa auditar notas fiscais cadastradas na base de dados do governo federal que sejam relacionadas a cota de gastos parlamentares e relacionar cada nota a variáveis que indiquem se cada uma delas é suspeita de fraude ou não.

### Objetivos Específicos

Fazer com que a inteligência artificial Rosie consiga interpretar valores e situações de cada nota fiscal que requere reembolso para indicar se cada nota pode ser classificada como suspeita e interagir em rede social criando alertas sobre gastos suspeitos.

### Contexto

A comunicação e contexto gerais dos sitema acontecem entre os dois elementos principais (Rosie e Jarbas) em conjunto com a publicação de mensagens com alertas no twitter.

Os dados devem ser lidos da base de dados do governo federal referente a dados de cota parlamentar. Em seguida, a Rosie deve ser ativada para classificar os dados de acordo com as regras que conhece e indicar se a nota fiscal atrelada ao pedido de reenbolso é suspeita. Por fim, o banco de dados do Jarbas deve ser alimentado com os novos dados classificados pela Rosie e então o Jarbas irá lista-los e criar posts de tempos em tempos para todas as suspeitas encontradas.

![fig1](contexto.svg)

### Containers

A Rosie é constituída por um conjunto de classificadores de notas fiscais de pedidos de reembolso. É basicamente um módulo python que utiliza Scikit para criar classificadores.

Classificadores esperados:
- Despesas eleitorais
- Empresas irregulares no lançamento das notas fiscais
- Despesas com refeições
- Limite de subcota parlamentar mensal
- Gastos com combustível

Em uma visão mais detalhada dos containers, podemos entender como se dá o funcionamento dos dois módulos.

![fig1](containers-rosie-jarbas.svg)

A implantação do sistema é feita em Droplest da digital ocean e não há muitos detalhes aqui a não ser um docker-compose para instanciar containers das tecnologias utilizadas em uma única máquina virtual da Digital Ocean.

Apenas o jarbas deve ficar no ar 24 horas por dia. Por simplicidade, a Rosie é acionada apenas algumas vezes ao mês de forma manual e a base de dados do Jarbas é atualizada com os dados novos também manualmente.

O Jarbas é apenas um dashboard que expõe os dados classificados e que não chegam na casa dos milhões. Logo, a arquitetura de implantação deve-se manter simples pois traz baixo custo e facilidade de implantação.

### Componentes

Os componentes da rosie são os seguintes:

![fig1](componentes-rosie.svg)

Os componentes do jarbas são os seguintes:

![fig1](componentes-jarbas.svg)

### Código

<pre>
    Nesta etapa não faremos diagramas que apresentam detalhes da
    implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação


# Contribuições Concretas
