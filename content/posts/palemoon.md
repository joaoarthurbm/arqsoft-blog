+++
title = "Documentação da arquitetura do navegador Pale Moon"
date = 2021-04-16
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Amanda Vivian Alves de Luna e Costa.
- Matrícula: 116210896
- Contato: amanda.costa@ccc.ufcg.edu.br
- Projeto documentado: https://repo.palemoon.org/MoonchildProductions/Pale-Moon e http://www.palemoon.org/


# Descrição Arquitetural -- Navegador Pale Moon

Este documento descreve parte da arquitetura do navegador [Pale Moon](http://www.palemoon.org/). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o navegador Pale Moon

Pale Moon é um navegador de código aberto Goanna-based disponível para Microsoft Windows e Linux (com outros sistemas operacionais em desenvolvimento), com foco em eficiência e personalização.

Pale Moon oferece a você uma experiência de navegação em um navegador totalmente construído a partir de sua própria fonte desenvolvida de forma independente, que foi bifurcada do código do Firefox / Mozilla há alguns anos, com recursos e otimizações cuidadosamente selecionados para melhorar a estabilidade do navegador e a experiência do usuário. 

Um dos seus maiores diferenciais é não expor seus dados de maneira nativa. Para tal, alguns recursos padrão dos browsers foram simplesmente eliminados e, o principal motivo das pessoas o utilizarem é a sua garantia de mais segurança dos dados pessoais durante o uso, uma das features que asseguram isso é não possuir telemetria, um recurso que tem acesso a quase todos os dados do seu computador, como por exemplo, qual seu hardware,sistema operacional,entre várias outras coisas.

