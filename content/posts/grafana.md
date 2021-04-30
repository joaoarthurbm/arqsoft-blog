+++
title = "Grafana"
date = 2021-04-14
tags = []
categories = []
+++


# Autores

Este documento foi produzido por Áxel Crispim e Medeiros.

- Matrícula: 117111889
- Contato: axel.medeiros@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/grafana/grafana

# Descrição Arquitetural -- Grafana

Este documento descreve parte da arquitetura do projeto [Grafana](https://github.com/grafana/grafana). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do Grafana. O foco aqui é a descrição de um serviço específico de análise do GRafana, que é parte fundamental do projeto.


## Descrição Geral sobre o Grafana


O Grafana é um projeto que tem como objetivo ser uma plataforma para visualização e monitoramento de dados, possibilitando com a construção de "dashboards" dinâmicos e reutilizáveis. Portanto, a ferramenta possui integração os principais bancos de dados disponíveis no mercado, como descrito [neste link](https://grafana.com/docs/grafana/latest/datasources/), além disso, é possível adicionar múltiplos “datasources” para o mesmo “dashboard”.

