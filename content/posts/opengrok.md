+++
title = "Documenta��o Arquitetural - OpenGrok"
date = 2021-08-02
tags = []
categories = []
+++

![Logo do OpenGrok](opengrok/logo.png)

# Autores

Este documento foi produzido por Matheus Silva Medeiros.

- Matr�cula: 117110412
- Contato: matheus.medeiros@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/oracle/opengrok

# Descri��o Arquitetural

Este documento descreve parte da arquitetura do projeto [OpenGrok](https://github.com/oracle/opengrok). Essa descri��o foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descri��o Geral sobre o OpenGrok

OpenGrok � um mecanismo de pesquisa e refer�ncia cruzada de c�digo-fonte r�pido e utiliz�vel, desenvolvido em Java. Ele compreende v�rios formatos de arquivo de programa e hist�rico de muitos sistemas de gerenciamento de c�digo-fonte, o que permite permite que voc� "grok" (profundamente entenda) o c�digo-fonte.