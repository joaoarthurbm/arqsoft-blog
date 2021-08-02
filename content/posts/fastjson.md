+++
title = "Documentação Arquitetural Fastjson"
date = 2021-08-02
tags = []
categories = []
+++

***

Esse documento visa apresentar e documentar o projeto opensource Fastjson

***

# Autores

Este documento foi produzido por Levi Rios Gomes.

- Matrícula: 117210339
- Contato: levi.gomes@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/alibaba/fastjson

# Descrição Arquitetural -- Serviço de análise do twitter

Este documento descreve a arquitetura do projeto [Fastjson](https://github.com/alibaba/fastjson). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Fastjson

O Fastjson é um projeto que tem como objetivo "Converter Objetos em Java para uma sua representação JSON". Mais detalhes sobre o projeto podem ser vistos [neste link](https://github.com/alibaba/fastjson/wiki).

## Conversão de objetos de Java para JSON

### Objetivo Geral

Prover métodos simples de conversão de Java Objects para JSON, e vice-versa.

### Objetivos Específicos

- Prover métodos toJSONString() e parseObject() para converter objetos em Java para JSON, e vice-versa
- Permitir representações customizadas de objetos
- Prover suporte para objetos complexos(alto uso de hierarquias de herança e uso de tipos genéricos)
- Suporte para Java Generics