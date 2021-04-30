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

A função de auditar a veracidade dos pedidos de reembolso pode ser uma tarefa inumana pela quantidade de pedidos todos os meses e a quantidade de variáveis envolvidas. O Serenata de Amor automatiza esse procedimento de auditoria para criar alertas sobre notas fiscais com valores duvidosos e auxiliar esse trabalho de forma muito mais barata e rápida.

#### Mas como isso é feito?

O projeto possui dois grandes módulos. Um [(Rosie)](https://twitter.com/RosieDaSerenata) para auditar notas fiscais de pedidos de reembolsos e outro [(Jarbas)](https://jarbas.serenata.ai/) para listar os dados auditados de forma fácil.

Em geral, um usuário precisa acionar a Rosie para que, com base em dados anteriores e já avaliados, ela classifique dados entregues pelo governo federal a cada mês e em seguida insira o conjunto de dados classificados no banco de dados do Jarbas para que ele exiba-os e também crie alertas no twitter sobre casos suspeitos.

#### Rosie

Robô que tem sua construção baseada na [toolbox do serenata de amor](https://github.com/okfn-brasil/serenata-toolbox).
A Rosie faz auditoria em notas fiscais que são cadastradas na base de dados do governo federal e classifica cada nota com uma flag de suspeita ou não.

A classificação das notas é feita com base em diversas de variáveis como:

- Gastos exagerados com alimentação, combustível, passagens etc
- Estar em dois lugares ao mesmo tempo
- Valores exorbitantes em localidades que cobram um valor diferente do que a nota fiscal diz
- Valores superfaturados
- ...

O processo, em uma visão modular, é simples. A Rosie é alimentada com dados previamente classificados em mêses e anos anteriores, é feito um treinamento em um modelo para que ele seja utilizado para classificar dados futuros.

#### Jarbas

Painel de controle que exibe os dados auditados pela Rosie de forma organizada.
O Jabas também é responsável por criar posts de alerta no twitter, indicando pedidos de reembolso suspeitos.

## Serviço de auditoria de cotas parlamentares

### Objetivo

Implementar um serviço que possa auditar notas fiscais cadastradas na base de dados do governo federal que sejam relacionadas a cota de gastos parlamentares e relacionar cada nota à variáveis que indiquem se cada uma delas é suspeita de fraude ou não.

### Objetivos Específicos

Treinar modelos, com base em dados auditados anteriormente, para classificação de cada nota fiscal que for utilizada para pedidos de reembolso para indicar se cada nota pode ser considerada suspeita e interagir em rede social criando alertas sobre gastos suspeitos através do módulo Jarbas.

### Contexto

A comunicação e contexto gerais dos sitema acontecem entre os dois elementos principais (Rosie e Jarbas) em conjunto com a publicação de mensagens com alertas no twitter.

Os dados devem ser lidos da base de dados do governo federal referente a dados de cota parlamentar. Em seguida, a Rosie deve ser ativada para classificar os dados de acordo com as regras que conhece e indicar se a nota fiscal atrelada ao pedido de reenbolso é suspeita. Por fim, o banco de dados do Jarbas deve ser alimentado com os novos dados classificados pela Rosie e então o Jarbas irá lista-los e criar posts de tempos em tempos para todas as suspeitas encontradas.

![fig1](contexto.svg)

### Containers

A Rosie é constituída por um conjunto de classificadores de notas fiscais de pedidos de reembolso. É basicamente um módulo python que utiliza Scikit para criar classificadores.

Classificadores:
- Despesas eleitorais
- Empresas irregulares no lançamento das notas fiscais
- Despesas com refeições
- Limite de subcota parlamentar mensal
- Gastos com combustível

Em uma visão mais detalhada dos containers, podemos entender como se dá a comunicação dos dois módulos.

![fig2](containers-rosie-jarbas.svg)

A implantação do sistema é feita em [Droplets da Digital Ocean](https://www.digitalocean.com/products/droplets/) e não há muitos detalhes aqui a não ser observar os arquivos de configuração docker-compose que definem quais serviços serão instanciados no Droplet da Digital Ocean.

Apenas o jarbas deve permanece online 24 horas por dia. Por simplicidade, a Rosie é acionada apenas algumas vezes ao mês de forma manual e a base de dados do Jarbas é atualizada com os dados novos também manualmente.

O Jarbas é apenas um dashboard que expõe os dados classificados e que não chegam na casa dos milhões. Logo, a arquitetura de implantação deve-se manter simples pois traz baixo custo e facilidade de implantação.

### Componentes

A Rosie utiliza como base o conjunto de ferramentas da Toolbox e é organizada em pacotes relativos a cada tipo de classificação que será feita.
No momento atual, a câmara dos deputados é o principal ponto de análise e todos os outros módulos que venham a ser criados devem seguir o mesmo padrão, então vamos focar apenas no módulo de classificação da câmara dos deputados.

Cada pacote de classificadores utiliza o sklearn para treinar um modelo utilizando como base dados que foram classificados e resolvidos anteriormente. Assim, quanot mais o tempo passar, cada vez mais a Rosie irá criar modelos para classificação mais aprimorados.

A Visão mais abstrata dos componentes da Rosie pode ser visualizada em seguida:

![fig3](componentes-rosie.svg)

O Jarbas, por simplicidade é apenas um serviço Python-Django que lê a lista de dados de reembolso e expõe uma ai simples para busca e filtro dessa listagem.
Além de sua função de listagem e filtro, o jarbas cria posts no twitter para denunciar pedidos que estejam classificados como suspeitos e marca-os como denunciados.

O único caso particular que teremos aqui é a limitação da quantidade de posts por hora da api do Twitter que é utilizada pelo jarbas. Há um [limite](https://developer.twitter.com/en/docs/twitter-api/v1/rate-limits#:~:text=Standard%20API%20v1.&text=You%20can%20only%20post%20300,id%20endpoint%20during%20that%20period.) e ele é considerado na criação dos posts.

Cada dado de reembolso carrega a informação do ID do requerente e links para detalhes que são apontados para o sistema do governo federal.

A API exposta pelo Jarbas é apenas uma rota com opcionais de filtragem para visualização dos dados:

- GET /api/chamber_of_deputies/reimbursement/<document_id>/receipt/
- GET /api/chamber_of_deputies/reimbursement/<document_id>?<filtros>
- GET /api/chamber_of_deputies/reimbursement

Os filtros em forma de query que podem ser utilizados podem ser visualizados no [repositório oficial do projeto](https://github.com/okfn-brasil/serenata-de-amor/tree/main/jarbas#json-api-endpoints).

Os componentes do jarbas são os seguintes:

![fig4](componentes-jarbas.svg)

### Visão de Informação

As informações mais importantes para o funcionamento do Serenata de Amor são basicamente todas as informações ligadas à um pedido de reembolso:

- Pedido de Reembolso
- Nota Fiscal
- Empresa (CNPJ, Endereço etc)
- Parlamentares

Abaixo podemos entender alguns pontos idispensáveis para a compreensão do uso da informação no sistema.

#### Dados de estabelecimentos com localização e dados relacionados ao cadastro de pessoa jurídica no governo federal.

A Rosie precisa entender qual tipo de estabelecimento, se ele está cadastrado na base de dados do governo federal e qual a região onde se localiza para aprender sobre qual valor de despesa é considerado normal.

#### Dados de cada parlamentar ligado a cada pedido de reembolso

Além da importâcia de entender qual o parlamentar requerente, é interessante que o Jarbas conheça esse dado para criar alertas e faça associação ao parlamentar no twitter.

#### Dados que foram auditados anteriormente

Para o passo inicial do sistema a Rosie necessita de um conjunto de dados previamente classificados/auditados que indique os dois estados de um pedido de reembols. Logo, os dados gerados até o momento do iníio da rosie servem de base de treinamento para o modelo de classificação e posteriormente serão somados a esse conjunto de dados os dados auditados pela prória Rosie para continuar aumentando a acurácia das classificações da Rosie.

#### Fluxo da informação no Jarbas para postagem de alertas no twitter

Por mais que seja simples, um diagrama de estados nos ajuda a manter claro como isso deve ser feito no twitter.

![fig5](fluxo-de-alerta-jarbas.svg)

# Contribuições Concretas
