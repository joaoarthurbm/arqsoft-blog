+++
title = "jsonwebtoken - Documentação arquitetural"
date = 2021-08-02
tags = []
categories = []
+++


# Autores

Este documento foi produzido por Jonathan Allisson De Lima Silva.

- Matrícula: 117110926
- Contato: jonathan.allisson.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/auth0/node-jsonwebtoken

# Descrição Arquitetural -- jsonwebtoken
Este documento descreve parte da arquitetura do projeto [jsonwebtoken](https://github.com/auth0/node-jsonwebtoken). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral 

JSON Web Token é uma estrutura de dados no formato json, compacto, seguro e pode trafegar na URL sem prejudicar seu conteúdo. Seu conteúdo é composto por claims. As Claims são um conjunto de chave/valor. Fornecem ao client ou API informações sobre o usuário que está consumindo seus serviços. Ele comumente utilizado para transferir dados através do protocolo HTTP.