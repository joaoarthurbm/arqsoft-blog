+++
title = "Documentação arquitetural Moodle"
date = 2021-04-13
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Talita Galdino Gouveia.

- Matrícula: 118111778
- Contato: talita.gouveia@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/moodle/moodle

# Descrição Arquitetural - Moodle

<div align="center">
	<img src="logo.png" style="width: 25rem;">
</div>

Este documento descreve a arquitetura do projeto [Moodle](https://github.com/moodle/moodle), baseando-se no modelo [C4](https://c4model.com/).

## Descrição geral sobre o Moodle
<div align="justify">
	O moodle é uma plataforma de aprendizagem open source projetada para dar suporte a professores, alunos e administradores. Criado para possibilitar uma melhor experiência no ensiono a distância o moodle é usado por diversas escolas e universidades atualmente, inclusive a UFCG. Além do suporte a esses tipos de usuário, ele permite a personalização dos seus ambientes.
</div>

## O Serviço de plataforma de ensino do Moodle

### Objetivo Geral
<div align="justify">
	Implementar uma plataforma que possibilite uma melhor experiência tanto para professores como para alunos no ensino remoto.
</div>

### Objetivos específicos

<div align="justify">
	Com a plataforma é possível que professores e alunos tenham uma interação clara e organizada no ensino remoto. Os professores podem criar turmas, fóruns, passar e corrigir atividades, dentre outras funcionalidades. Além disso os alunos recebem de forma clara e simples os conteúdos e atividades para que sejam avaliados. O moodle possui diversas funcionalidades que visam em melhorar a experiência das pessoas com a aprendizagem de forma online.
</div>

### Contexto
<div align="justify">
	O moodle é um sistema que dispõe de diversos plugins que podem ser adicionados ao sistema, desde plugins de layout até de motivação e certificação. Com isso pode-se dizer que a aplicação poderá comunicar-se com diversos serviços externos dependendo de quais funcionalidades serão adicionadas com os plugins. Nesta documentação focaremos nas funcionalidades básicas do moodle, simulando apenas a adiçaõ de um plugin para geração de ceritificados.
<div align="justify">