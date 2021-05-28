+++
title = "Documento arquitetural do Sequelize"
date = 2021-04-14
tags = []
categories = []
+++


# Autores

Este documento foi produzido por José Thiago dos Santos Silva.

- Matrícula: 116110537
- Contato: jose.thiago.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/sequelize/sequelize

# Descrição Arquitetural -- Sequelize

Este documento descreve parte da arquitetura do projeto [Sequelize](https://github.com/sequelize/sequelize). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o Sequelize

O sequelize é um ORM - Mapeamento Objeto Relacional (Object Relational Mapping) para Node.js baseado em promises, que suporta transações sólidas, relacionamentos, eager e lazy loading, replicação para leitura, entre outras funcionalidades. É uma ferramenta que é utilizada para fazer a ponte entre o banco de dados e objetos conhecidos pela linguagem de programação. O sequelize tem suporte para o JavaScript e TypeScript.
