+++
title = "Arquitetura do JupyterLab"
date = 2021-08-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Helena Mylena Cunha Dantas.

- Matrícula: 117210323
- Contato: helena.dantas@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/jupyterlab/jupyterlab

# Descrição Arquitetural -- Ambiente extensível do Jupyter Notebook para computador.

Este documento foi produzido na disciplina de Arquitetura de Software da UFCG e descreve a arquitetura do projeto [JupyterLab](https://github.com/jupyterlab/jupyterlab). A descrição é baseada no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o JupyterLab

O JupyterLab é a uma interface de usuário para o Project Jupyter, que oferece todos os blocos de construção familiares do Notebook Jupyter clássico (notebook, terminal, editor de texto, navegador de arquivos, saídas ricas, etc.) em uma interface de usuário flexível e poderosa. 


## O ambiente extensível do Jupyter Notebook para computador

### Objetivo Geral

O objetivo desse projeto é implementar uma interface para computador que permita ao usuário trabalhar de forma flexível, integrada e extensível com documentos, blocos de notas Jupyter , editores de texto, terminais e componentes.

### Objetivos Específicos

O JupyterLab permitirá que vários documentos e atividades sejam organizados um ao lado do outro na área de trabalho fazendo uso de guias e divisores. Além disso, permitirá novos fluxos de trabalho interativos.
Também será oferecido um modelo unificado para visualizar e manipular formatos de dados e, com isso, serão compreendidos muitos formatos de arquivo, podendo também exibir uma rica saída de kernel nesses formatos. 
O usuário poderá personalizar sua experiência através de atalhos de teclados personalizáveis e com as extensões do JupyterLab para aprimorar qualquer parte do JupyterLab, incluindo novos temas, editores de arquivo e componentes personalizados.
