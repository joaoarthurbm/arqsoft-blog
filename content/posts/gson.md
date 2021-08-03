+++
title = "Documento arquitetural - Biblioteca Gson"
date = 2021-07-29
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Jerônimo Jairo Silva de Araújo.

- **Matrícula**: 117211387
- **Contato**: jeronimo.araujo@ccc.ufcg.edu.br	
- **Projeto documentado**: https://github.com/google/gson	

## Descrição Geral

O [Gson](https://github.com/google/gson) é uma biblioteca Java que é usada para *serializar* objetos Java em suas representações JSON e para *deserializar* uma string JSON em um equivalente objeto Java.

## Objetivo geral

- Prover uma interface simples, onde o usuário consiga serializar/deserializar objetos em JSON (e vice-versa), facilmente, sem a necessidade de anotações (pois quando não se tem acesso ao código se torna um problema).

## Objetivos específicos

- Prover uma interface simples para realizar a serialização de objetos e deserialização de strings JSON através dos métodos toJson() e fromJson(), respectivamente.
- Trabalhar com objetos que não se tem acesso ao código.
- Permitir que objetos não modificáveis sejam serializáveis e deserializáveis.
- Dar suporte à Java Generics e objetos arbitrariamente complexos (que contém alto nível de herança e uso extensivo de Generics Types).
- Permitir representações customizáveis de objetos.

Agora será dada uma visão do projeto utilizando o modelo C4.

## Contexto

## Containers

## Componentes

## Código

```
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
```

## Visão de informação