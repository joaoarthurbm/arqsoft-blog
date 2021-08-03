+++
title = "Descrição Arquitetural do Locust"
date = 2021-08-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Guilherme de Melo Carneiro.

- Matrícula: 118210938
- Contato: guilherme.carneiro@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/locustio/locust

# Descrição Arquitetural -- Locust

Este documento descreve parte da arquitetura do projeto [Locust](https://github.com/locustio/locust). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre Locust

O [Locust](https://locust.io) é uma solução open-source para testes de performance de aplicações. Com ele é possível estressar sistemas através da implementação(em python) de comportamento de "usuários-fantasmas", que interagem com a aplicação de maneira a levá-la ao limite, extraindo assim suas métricas de desempenho.
