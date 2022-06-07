+++
title = "Documentação Arquitetural - Rough"
date = 2022-06-06
tags = []
categories = []
+++

***

# Autores

Este documento foi produzido por:

| Matrícula | Contato |
|--- |--- |
| 117210327 | joao.pedro.barbosa@ccc.ufcg.edu.br |
| 119210052 | luiz.felipe.farias@ccc.ufcg.edu.br |
| 119210936 | luiz.nery@ccc.ufcg.edu.br |
| 119210656 | matheus.oliveira@ccc.ufcg.edu.br |
+ Projeto documentado: https://github.com/tiagosiebler/binance

# Descrição Arquitetural -- Rough
Este documento tem por finalidade descrever aspectos da estrutura plataforma [_Rough_](https://roughjs.com/) sob a visão do modelo arquiterual [C4](https://c4model.com/). Entender bem como funciona esse sistema é importante, visto que tais conceitos são importantes para o Desenvolvedor de Software.

## Descrição Geral sobre a Rough
Rough.js é uma pequena biblioteca gráfica (<9kB gzipped) que permite desenhar em um estilo esboçado, semelhante a um desenho à mão. A biblioteca define primitivos para desenhar linhas, curvas, arcos, polígonos, círculos e elipses. Ele também suporta o desenho de caminhos SVG.

## Serviço gráfico do Rough

### Objetivo Geral
Essa descrição se propõe em implementar um serviço para desenvolver e criar gráficos de maneira facilitada com o intuito de gerar imagens com aparência desenhada à mão.