+++
title = "Documentação arquitetural do Fobow"
date = 2021-07-30
tags = []
categories = []
+++

---

Este é um documento explica aspectos da arquitetura de um serviço de nuvens federadas.

---

# Autores

Este documento foi produzido por Anderson Kleber Dantas.

- Matrícula: 117110537
- Contato: anderson.dantas@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/fogbow/resource-allocation-service

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto Fogbow. Essa descrição é baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral

O Fogbow é um middleware para federação de nuvens. Por meio da sua API, é possível que um usuário consiga alucar recursos em diversas nuvens (AWS, Azure, Openstack, etc) Através de endpoints simples e bem documentados.
