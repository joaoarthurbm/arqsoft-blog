+++ 
title = "Documentação Arquitetural - OpenSearch" 
date = 2022-06-06 
tags = [] 
categories = [] 
+++

# Autores
Este documento foi produzido pelos alunos:
- Caetano Albuquerque
  - Matrícula: 119110355
  - Contato: caetano.albuquerque@ccc.ufcg.edu.br
- Caio Silva
  - Matrícula: 119110875
  - Contato: caio.silva@ccc.ufcg.edu.br
- Holliver Costa
  - Matrícula: 118210493
  - Contato: holliver.costa@ccc.ufcg.edu.br 
- Sávio Medeiros
  - Matrícula: 119111373
  - Contato: savio.medeiros@ccc.ufcg.edu.br 

- Projeto documentado: https://github.com/opensearch-project/OpenSearch

# Descrição arquitetural - OpenSearch

## Descrição Geral sobre o OpenSearch
- De acordo com o aws.amazon, o maintener do OpenSearch:
> O OpenSearch é um conjunto distribuído de pesquisa e análise usado para uma ampla variedade de casos de uso. O OpenSearch fornece um sistema altamente escalável para fornecer acesso rápido e resposta a grandes volumes de dados com uma ferramenta de visualização integrada, o OpenSearch Dashboards, que facilita a exploração de dados pelos usuários. Como Elasticsearch e o Apache Solr, o OpenSearch é alimentado pela biblioteca de pesquisa Apache Lucene. O OpenSearch e o OpenSearch Dashboards foram originalmente derivados do Elasticsearch 7.10.2 e do Kibana 7.10.2.

---

### Objetivo Geral

O OpenSearch é uma aplicação capaz de armazenar dados e, graças ao seu sistema de indexação eficiente, essa aplicação consegue prover um mecanismo de busca eficaz e otimizado. Também está disponível uma interface de usuário (OpenSearch Dashboards), capaz de exibir os dados de variadas formas. A aplicação pode trabalhar com uma variedade de plugins, aprimorando a eficiência da pesquisa, da segurança, análise da performance, entre outros. 

### Objetivos Específicos

Normalmente o OpenSearch é utilizado para armazenar, gerenciar e visualizar dados de uma forma simples e contínua. Esses recursos são amplamente utilizados para casos de uso baseados em pesquisas de aplicação, análise de dados, métricas e logs. O OpenSearch se aplica a qualquer sistema que necessita de um monitoramento contínuo, a partir do OpenSearch Dashboards, que fornece visualizações gráficas dos dados a fim de facilitar toda a análise.

### Contexto

O OpenSearch é capaz de armazenar dados utilizando indexação a fim de tornar o processo de busca mais ágil. De forma geral, qualquer aplicação pode utilizar do OpenSearch a fim de armazenar seus dados e consumi-los depois. Os dados de qualquer aplicação genérica passará por um injetor de dados, a fim de serem processados e enviados para onde o OpenSearch estará em execução. O mantenedor do OpenSearch oferece o Data Prepper como um injetor de dados padrão, porém outros podem ser utilizados, como por exemplo o FluentBit. 
Com o objetivo de consumir os dados de forma mais estruturada, o OpenSearch Dashboards oferece ferramentas para gerar diversas visualizações gráficas sobre o conteúdo e como eles se distribuem e se relacionam. Porém, o usuário pode acessar os dados diretamente da API REST do OpenSearch, garantindo uma flexibilidade maior para diversos usos.

![Diagrama de Contexto](c4_contexto_opensearch.png)