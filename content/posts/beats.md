+++
title = "Documentação Arquitetural - Beats"
date = 2019-10-22
tags = []
categories = []
+++

***
Este documento tem por finalidade descrever a plataforma [_Beats_](https://www.elastic.co/pt/beats/) sob diversos níveis (visões) arquiteturais. Em verdade, _Beats_ descreve um conjunto de serviços ou *agentes* para exportação de dados em alta escala de fontes heterogêneas.

***

# Autores

Este documento foi produzido por Emanuel Joívo Bezerra Martins.

- Matrícula: 116110919
- Contato: emanuel.martins@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/elastic/beats

# Descrição Arquitetural -- Data shippers

Este documento descreve parte da arquitetura da plataforma [_Beats_](https://www.elastic.co/pt/beats/), atentando o olhar nos core [_shippers_](https://www.elastic.co/guide/en/beats/libbeat/current/beats-reference.html). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Beats

O Beats é uma plataforma que tem como objetivo "capturar todo tipo de dado operacional tais quais logs, métricas ou dados de pacote de rede" e assim criar um workflow padronizado de envio para plaformas de agregação e indexação de dados como, respectivamente, o [_logstash_](https://www.elastic.co/pt/logstash) e o [_elasticsearch_](https://www.elastic.co/pt/what-is/elasticsearch) podendo, posteriormente, obter uma visualização de tais dados via um dashboard como o [_kibana_](https://www.elastic.co/pt/kibana). Mais detalhes sobre o projeto podem ser vistos [neste link](https://github.com/elastic/beats).

## Data shippers - Agentes de dados de finalidade única

### Objetivo Geral

Implementação de uma plataforma para coleta e envio automáticos de dados a partir de fontes de dados específicas e heterogêneas. Tais dados são comumente gerados por outros sistemas, ou seja, são dados operacionais tais quais logs, métricas, informações de tráfego de rede, eventos de sistema etc.

### Objetivos Específicos

A intenção parece ser a de abstrair a extração de dados através de agentes com interfaces padronizadas para a coleta de dados de sistemas heterogêneos e envio desses em larga escala para plataformas de agregação tais quais o logstash e o elasticsearch para análise e pesquisa centralizada e simplificada.

### Contexto

Em linhas gerais, esse sistema pretende estruturar uma plataforma para coleta e envio de dados de fontes específicas tais quais métricas de sistemas e serviços, eventos, logs, etc. O core do sistema está no componente libbeat que descreve uma interface de mais alto nível os quais os _beats_ têm de satisfazer, além de prover canais de comunicação e protocolos de recuperação de falha na troca de mensagens. Por essa arquitetura quase como um Lego, ou _building blocks_ novos _Data Shippers_ podem ser criados ou os existentes customizados, tendo em vista que é um projeto Open Source, de modo a satisfazer um caso de uso não esperado pelos _Data Shippers_ core. Todo o input do sistema é gerado através das coletas dos dados via os _beats_, enviados para a libbeat que por sua vez redireciona tanto para o logstash quanto para o elasticsearch, no segundo caso, ficando assim disponível para consulta/buscas.

![fig1](context.png)

### Containers

Cada Beat é simplesmente um binário Go que é instalado no servidor alvo de onde se quer exportar dados. Por exemplo,o [WinlogBeat](https://www.elastic.co/beats/winlogbeat), _Shipper_ que coleta logs de eventos de sistemas Microsoft Windows precisa estar instalado no server. Cada Beat se comunica com um cluster Elasticsearch e/ou Logstash para exportação dos dados e, por conseguinte, a visualização dos mesmos via chamadas HTTP/REST como segue no diagrama abaixo.

![fig2](containers.png)

### Componentes

Para esta sessão, escolheu-se o *zoom* em um Beat em específico para detalhamento de seus componentes internos. Filebeat é um _shipper_ para coleta e exportação de logs de sistema ou de serviços.
Segue abaixo diagrama de componente do Filebeat.

![fig3](components.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Retomando o caso do Filebeat, a informação em questão são logs produzidos por sistemas e/ou serviços. 
Após a especificação dos arquivos de logs no Input, o Filebeat vai manter seus Harvesters assistindo a mudanças nos arquivos e coletando as atualizações. Após isso, cada Harvester publica as mudanças no Spooler que por sua vez envia os eventos dos logs em batch numa única transação por vez.


![fig4](information.png)

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
