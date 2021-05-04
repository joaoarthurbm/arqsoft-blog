+++
title = "Horários UFCG"
date = 2021-04-13
tags = []
categories = []
+++


# Autores

Este documento foi produzido por Eduardo Pereira dos Santos.

- Matrícula: 117210342
- Contato: eduardo.pereira.santos@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Guardians-DSC/horarios-ufcg

# Descrição Arquitetural -- Horários UFCG Frontend

<div align="center" style="margin-top:1.5rem;">
    <img src="horarios-ufcg-logo.png" style="width:20rem;">
</div>


Este documento descreve o Frontend do Horários UFCG. Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Horários UFCG

O Horários UFCG é uma aplicação SPA (Single Page Application), feita em [Vue.js](https://vuejs.org/), que fornece uma visualização moderna e limpa, ajudando os alunos de Ciência da Computação a montar seu horário antes da realização das matrículas. Além disso, fornece opções de filtragem e pesquisa permitindo uma experiência mais otimizada. 

### Objetivo Geral

Visualizar os horários das disciplinas dos cursos da UFCG, a princípio do curso de Ciência da Computação.

### Objetivos Específicos

Ajudar o aluno da UFCG a visualizar melhor os conflitos entre disciplinas e organizar o seu horário, fornecendo uma visualização limpa e amigável.

### Contexto

![fig1](contexto.png)

Como vemos no diagrama de contexto, o Horários UFCG utiliza-se de uma API externa que fornece as disciplinas e horários, que são requisitados utilizando o protocolo HTTP.

### Containers

O Horários UFCG é basicamente uma aplicação [Vue.js](https://vuejs.org/) e faz uso do LocalStorage para armazenar as disciplinas selecionadas, mantendo-as salvas mesmo após o fechamento da página.

![fig1](container.png)

### Componentes

O Horários UFCG é composto, basicamente, em três tipos de componentes:

- Visualização: Horário, Dia, Aula, Tabela e Model
- Filtragem e Pesquisa (contém visualização): NavBar e Filtro
- Serviços: Store e Services

![fig1](componente.png)


### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

O fluxo de informação é bem simples. O usuário escolhe suas disciplinas e em seguida remove os choques de horário, isso se repete até o usuário achar um horário adequado.

![fig1](informacao.png)


# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
