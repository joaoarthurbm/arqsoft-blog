+++
title = "Documentação Arquitetural - Rough"
date = 2022-06-06
tags = []
categories = []
+++

---

# Autores

Este documento foi produzido por:

| Matrícula | Contato                            |
| --------- | ---------------------------------- |
| 117210327 | joao.pedro.barbosa@ccc.ufcg.edu.br |
| 119210052 | luiz.felipe.farias@ccc.ufcg.edu.br |
| 119210936 | luiz.nery@ccc.ufcg.edu.br          |
| 119210656 | matheus.oliveira@ccc.ufcg.edu.br   |

- Projeto documentado: https://github.com/rough-stuff/rough

# Descrição Arquitetural -- Rough

Este documento tem por finalidade descrever aspectos da estrutura plataforma [_Rough_](https://roughjs.com/) sob a visão do modelo arquiterual [C4](https://c4model.com/). Entender bem como funciona esse sistema é importante, visto que tais conceitos são importantes para o Desenvolvedor de Software.

## Descrição Geral sobre a Rough

Rough.js é uma pequena biblioteca gráfica (<9kB gzipped) que permite desenhar em um estilo esboçado, semelhante a um desenho à mão. A biblioteca define primitivos para desenhar linhas, curvas, arcos, polígonos, círculos e elipses. Ele também suporta o desenho de caminhos SVG.

## Serviço gráfico do Rough

### Objetivo Geral

Essa descrição se propõe em implementar um serviço para desenvolver e criar gráficos de maneira facilitada com o intuito de gerar imagens com aparência desenhada à mão.

### Objetivos Específicos

Utilizar uma biblioteca leve e open source que proporciona criar desenhos de maneira simples e que permita o uso desses desenhos como svg.

### Contexto

O _RoughJS_ é um biblioteca que como dito antes proporciona a criação de desenhos no estilo hand draw e a sua conversão para diferentes formatos.
Ele não faz uso de nenhuma API externa, utilizando apenas métodos construídos dentro da própria biblioteca.

Na criação da imagem ele recebe a informação de qual o tipo da imagem que será renderizada e então calcula seu formato.
![contexto](/content/posts/rough/context.png)

### Containers

O _RoughJS_ é composto por um único container que contém todas as ferramentas dentro dele próprio.

O core recebe as configurações de inicialização da chamada com o método que será utilizado para fazer a renderização da imagem e então recebe como parâmetro as medidas da figura.
Então ele utiliza funções utilitárias que irão calcular e definir a figura desejada.
![container](/content/posts/rough/containers.png)

### Componentes

Dos containers apresentados, agora faz-se necessário destacar os componentes neles presentes. Dessa forma, a biblioteca é constituída por um conjunto de funções que geram imagens em forma de vetores SVG ou elementos HTML Canvas. Esses, por sua vez, se utilizam de um grupo de funções que codificam formas geométricas (linha, retângulo, elipse, circulo, polígono, arco, curva, ou caminho) com estilos de linhas personalizáveis. E por fim, esses possuem uma miríade de estilos de preenchimentos configuráveis, em formas (hachura, sólido, zigue-zague, cross, hachura cheia (cross-hatch), pontos, linhas, e linha em zigue-zague), cor, angulação dentre outras opções.
![container](/content/posts/rough/components.png)

### Visão de Informação

A forma que os dados dessa biblioteca são manipulados é utilizando um _generator_ para gerar os tipos mais comuns de desenho como, circulos, eclipse, retângulos, linhas entre outros. Além disso, é utilizado fillers para preencher as figuras geometricas. _Geometry_ é um arquivo essencial para essa biblioteca, pois é a partir dele que são gerados, produzidos e calculados as linhas e pontos de rotação de todos os desenhos que forem feitos. Outro arquivo que é base para todos os outros é o _core_, pois possui a interface utilizada em quase todos os arquivos do sistema. Por fim, o _renderer_ faz o uso de todos os demais arquivos mencionados acima, além de utilizar possui outros métodos para fazer todo o processo de desenho acontecer, calculos, preenchimento, direcionamento e curvaturas.

