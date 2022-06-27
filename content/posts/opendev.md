+++
title = "Documentação OpenDev"
date = 2021-04-17
tags = []
categories = []
+++


# Autores

Este documento foi produzido por Luana Barbosa de Melo.

- Matrícula: 117210906
- Contato: luana.melo@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/OpenDevUFCG

# Descrição Arquitetural -- Comunidade voltada a incentivar a cultura open source no curso de Ciência da Computação da UFCG

Este documento descreve parte da arquitetura do projeto [OpenDev](https://github.com/OpenDevUFCG). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o OpenDev

<<<<<<< HEAD
O Open Dev é um projeto que tem como objetivo "incentivar a cultura open source" principalmente no curso de Ciencia da Computação da UFCG, reunindo varios projetos open source, na sua plataforma.

Como os mesmos se apresentam, eles estão desenvolvendo para a UFCG, para os estudantes, e pra você interessado a aprender e a contribuir.


### Objetivo Geral

Open Source permite que qualquer pessoa possa ver, modificar, contribuir e distribuir seu código. No entanto, como um sistema que traz esse ideal, é uma plataforma de código aberto, para contribuir e entregar conteúdo, sendo assim ajuda mútua. Além de um site de apresentação de todo o projeto.

### Objetivos Específicos

Implementar um serviço para reunir todos, ou quase todos projetos opensource que carreguem os mesmos objetivos que eles. Esses são: Estimular a troca de conhecimento entre os estudantes, incentivar a criação de mais projetos opensource, quebrar o gelo da primeira contribuição em algum projeto e por fim, desenvolver projetos para os estudantes.
Além de desenvolverem projetos dentro dessa comunidade para ajuda de estudantes, principalmente da UFCG. "Queremos ser a comunidade que possa encorajar pessoas a tomarem o primeiro passo, a sugerir novas ideias e principalmente, a contruí-las". Para mais detalhes sobre o projeto abordado, acesse [este link](https://opendevufcg.org/).


### Contexto

O contexto do Open Dev é bem simples, é uma base/estrutura que reune atualmente 14 novos projetos com a mesma iniciativa que ele , e que através da sua plataforma podemos ter acesso a esses projetos e suas funcionalidades. 

![fig1](diagramaContexto.png)


### Containers

Como containers do OpenDev, podemos elencar 1 entidade: Web Page.

 **Web Page**, é responsável por pela representação gráfica do sistema, ou seja, todo o HTML que o browser irá interpretar e renderizar para o usuário final.


![fig2](diagramaContainers.png)

### Componentes

O componente Pages que usa JavaScrip, HTML e CSS, para fornecer visualização interativa com dados. É nesse componente, encontra-se todas as subaplicações disponibilizadas pelo OpenDev.

![fig3](diagramaComponentes.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Página Web com redirecionamento para outras páginas web ou projetos no github

![fig4](diagramaInformativo.png)
=======
O Open Dev é um projeto que tem como objetivo "incentivar a cultura open source" principalmente no curso de Ciencia da Computação da UFCG, reunindo varios projetos open source.
>>>>>>> 1b6c42a0e5d62dd3bb93c3056266de5c9653c79c
