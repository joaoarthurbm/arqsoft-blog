+++
title = "Documentação Arquitetural - OpenGrok"
date = 2021-08-02
tags = []
categories = []
+++

![Logo do OpenGrok](opengrok/logo.png)

# Autores

Este documento foi produzido por Matheus Silva Medeiros.

- Matrícula: 117110412
- Contato: matheus.medeiros@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/oracle/opengrok

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [OpenGrok](https://github.com/oracle/opengrok). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o OpenGrok

OpenGrok é um mecanismo de pesquisa e referência cruzada de código-fonte rápido e utilizável, desenvolvido em Java. Ele compreende vários formatos de arquivo de programa e histórico de muitos sistemas de gerenciamento de código-fonte, o que permite permite que você "grok" (profundamente entenda) o código-fonte.