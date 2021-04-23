+++

title = "Documentação arquitetural do BrasilAPI"

date = 2021-04-16

tags = []

categories = []

+++

# Autores

Este documento foi produzido por Izaquiel Nunes do Nascimento.

- Matrícula: 117111446
- Contato: izaquiel.nascimento@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/BrasilAPI/BrasilAPI

# Descrição Arquitetural -- BrasilAPI

Este documento descreve a arquitetura do projeto [BrasilAPI](https://github.com/BrasilAPI/BrasilAPI). Essa descrição, assim como a produção de seus diagramas, foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o BrasilAPI

O BrasilAPI tem como objetivo disponibilizar de forma rápida e prática informações públicas como CEP, DDD, feriados nacionais, dados do IBGE, entre outros. Esse projeto centraliza e disponibiliza endpoints modernos com baixíssima latência utilizando tecnologias como Vercel Smart CDN responsável por fazer o cache das informações em atualmente 23 regiões distribuídas ao longo do mundo (incluindo Brasil).