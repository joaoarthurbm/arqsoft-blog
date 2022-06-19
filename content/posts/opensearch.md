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
Este documento descreve parte da arquitetura do projeto [OpenSearch](https://opensearch.org/). Essa descrição foi baseada principalmente no modelo C4.

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

### Containers

O OpenSearch, usa de uma API REST para realizar as suas comunicações com outros serviços. Através dessas requisições, é possível inserir, buscar, deletar e alterar documentos, também é possível mudar a maioria das configurações, checar o estado do cluster, coletar estatísticas, entre várias outras operações. Um cluster OpenSearch pode ser constituído de inúmeros nós e esses podem ser do tipo Gerenciador de Cluster, de Ingestão e de Dados. 
O nó Gerenciador de Cluster é responsável por gerenciar as operações no cluster e acompanhar o estado do mesmo, isso inclui criar e excluir índices, monitorar a entrada, saída e o estado de nós. Já o nó de Dados, é responsável por armazenar os dados e executar todas as operações relacionadas aos dados locais, sendo essas operações, a indexação, pesquisa, agregação. Por fim, os nós de Ingestão, eles são responsáveis pelo pré-processamento dos dados, que é feito antes de armazená-los em um índice específico, dentro do cluster. Na documentação do OpenSearch não está disponível como a comunicação entre os nós do cluster é feita.

![Diagrama de Containers](c4_containers_opensearch.png)

### Componentes 

Avançando para entender a estrutura interna dos nós, temos que existem diversos índices em um único nó, a fim de organizar os dados. Cada índice é uma coleção de documentos do tipo JSON, tal documento ao ser alocado a um índice terá ao seu conteúdo alguns metadados adicionados, como o nome do índice, o tipo, o id e outras informações que serão necessárias quando a busca for realizada. 
Com a finalidade de não permitir a existência de nós muito grandes e de garantir backup aos dados, o OpenSearch separa a divisão de dados de um índice dentro de fragmentos(Shards), que podem ser armazenados em diferentes nós e cada índice também terá diversos shards. É importante ressaltar que cada Shard também funciona como um índice, uma implementação do Lucene index, e cópias desses Shards são criadas e distribuídas para outros nós, garantindo o backup do conteúdo caso algum nó pare de funcionar.

![Diagrama de Componentes](c4_componentes_opensearch.png)
