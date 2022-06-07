+++
title = "Documento Arquitetural - Lombok"
date = 2022-06-06
tags = []
categories = []
+++

# Autores

Este documento foi produzido por:

Augusto Gomes dos Santos

- Matrícula: 118210273
- Contato: augusto.santos@ccc.ufcg.edu.br

Lucas Brasileiro Raposo

- Matrícula: 119110321
- Contato: lucas.raposo@ccc.ufcg.edu.br

Renildo Dantas Melo

- Matrícula: 118210324
- Contato: renildo.melo@ccc.ufcg.edu.br

Wander Medeiros de Brito Junior

- Matrícula: 118210940
- Contato: wander.junior@ccc.ufcg.edu.br



Projeto documentado: https://github.com/projectlombok/lombok

## Descrição Geral sobre o Lombok

O [Lombok](https://github.com/projectlombok/lombok) é uma biblioteca em Java baseada em anotações, que permite ao usuário reduzir código "boilerplate". Lombok oferece várias anotações voltadas para substituir código Java, que são bem conhecidos por serem replicados em diversos trechos do código, evitando um trabalho repetitivo e tedioso de se escrever. Permitindo, com o uso do Lombok, evitar criar construtores sem argumentos, ou com todos os argumentos, manualmente, e métodos toString(), equals(), hashCode(), getters e setters, por meio de uma simples adição de uma anotação.
A mágica acontece durante o tempo de compilação, quando a biblioteca injeta o bytecode representando o código "boilerplate", nos arquivos .class. Ainda possibilitando ao usuário conectar a biblioteca a sua IDE, o que permite a ele ter a mesma "experiência" como se o próprio tivesse escrito o código.

