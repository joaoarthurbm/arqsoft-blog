+++
title = "Documentação Arquitetural - Elasticsearch"
date = 2021-08-02
tags = []
categories = []
+++


# Autores

Este documento foi produzido por Túlio Araújo Cunha.

- Matrícula: 118210965
- Contato: tulio.cunha@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/elastic/elasticsearch

# Descrição Arquitetural -- Serviço de análise do Elasticsearch

Este documento descreve parte da arquitetura do projeto [Elasticsearch](https://github.com/elastic/elasticsearch). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Elasticsearch

O Elasticsearch é uma ferramenta para realização de buscas e análise de dados construída para trabalhar com grandes volumes de dados, permitindo indexar documentos e realizar buscas nesses documentos em quase tempo real. Com ele é possível trabalhar com dados de variados tipos, como textuais, numéricos, geoespaciais, estruturados e não estruturados. Além disso, é o componente central do Elastic Stack, que é um conjunto de ferramentas para ingestão, enriquecimento, armazenamento, análise e visualização de dados.