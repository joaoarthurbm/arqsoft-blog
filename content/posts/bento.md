+++
title = "Descrição Arquitetural do Bento"
date = 2021-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Daniel Bezerra Galvão Mitre.

- Matrícula: 116110274
- Contato: daniel.mitre@ccc.ufcg.edu.br
- Projeto documentado: https://gitlab.cs.washington.edu/sm237/bento

# Descrição Arquitetural -- Bento

Este documento descreve a arquitetura do framework [Bento](https://gitlab.cs.washington.edu/sm237/bento). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral do Bento

O Bento é um *framework* desenvolvido para permitir desenvolvimento ágil de sistemas de arquivos no *kernel* Linux. Suas interfaces implementadas em [Rust](https://www.rust-lang.org/pt-BR) garantem uma interação segura com mecanismos do *kernel* e a compilação para espaço do usuário, facilitando os testes e depuração do sistema de arquivos sem abrir mão da performance. Mais informações podem ser encontradas em seu [paper original](https://www.usenix.org/system/files/fast21-miller.pdf).
