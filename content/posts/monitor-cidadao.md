+++
title = "Mini-projeto 1"
date = 2019-10-22
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Beatriz Bezerra de Souza.

- Matrícula: 117110233
- Contato: beatriz.souza@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/analytics-ufcg/monitor-cidadao-dados

# Descrição Arquitetural -- Serviço de predição de risco de contratos públicos

Este documento descreve parte da arquitetura do projeto [Monitor Cidadão](https://github.com/analytics-ufcg/monitor-cidadao-dados). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do Monitor Cidadão. O foco aqui é a descrição de um serviço específico de predição de risco de contratos públicos.


## Descrição Geral sobre o Monitor Cidadão

O Monitor Cidadão é um projeto que tem como objetivo "possibilitar aos cidadãos o acompanhamento dos contratos realizados pelos municípios dos estados da Paraíba e do Rio Grande do Sul". Mais detalhes sobre o projeto podem ser vistos [neste link](https://github.com/analytics-ufcg/monitor-cidadao-dados).

## O Serviço de predição de risco de contratos públicos

### Objetivo Geral

Implementar um serviço para receber dados e realizar predição de risco de contratos públicos para serem usados no Monitor Cidadão.

### Objetivos Específicos

Queremos ter acesso a dados, provenientes de diferentes fontes, relacionados a contratos públicos. Além disso, queremos estimar o risco associado a contratos públicos. Para nós, o conceito de risco está associado a chance que um contrato possui de ser *rescindido*, *paralisado*, *sustado* ou *impedido*. E as características dos contratos são construídas a partir do comportamento passado e dados cadastrais das empresas responsáveis pelos contratos.

### Contexto

 O Monitor Cidadão é composto por três camadas: dados, back-end, e front-end, como apresentado no diagrama de contexto abaixo.

 A camada de dados recebe dados de serviços externos, trata os dados recebidos, e realiza previsões sobre os riscos associados a contratos. Atualmente, os provedores de dados para o Monitor Cidadão são Sagres, TCE-RS, IBGE, e Tramita.

 O back-end recebe os dados tratados e as previsões e os repassa para o front-end, que exibe as informações em um formato mais compreensível para os usuários.

![fig1](context.png)

### Containers

O diagrama abaixo apresenta os conteiners do Monitor Cidadão. A camada de dados, que contém o serviço de predição que queremos descrever, é composta por cinco componentes: um fetcher, um transformador, um preditor, e dois bancos de dados.

O fetcher, o transformador, e o preditor são sistemas desenvolvidos em R. Os dois bancos de dados são relacionais, fazem uso do postgres. O fetcher é responsável por buscar os dados em suas fontes. O transformador utiliza o tradutor, um serviço interno responsável por traduzir os dados para um formato tabular, e em seguida realiza manipulações, como joins, nos dados. O preditor encapsula diversas funções para a realização das predições em torno dos contratos públicos.

Falar dos DAOs

![fig2](containers.png)

#### Implantação

![fig3](implantacao.png)

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
