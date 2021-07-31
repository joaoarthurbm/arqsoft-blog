+++
title = "Descrição arquitetural do Tinode chat"
date = 2021-07-31
tags = []
categories = []
+++

---

<img src="./logo.svg" style="width:25%; display: flex; margin: 0 auto"/>
O Tinode chat é um aplicativo multiplataforma de mensagens instantâneas

---

# Autores

Este documento foi produzido por Matheus Oliveira Pereira

- Matrícula: 117110434
- Contato: matheus.pereira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/tinode/chat

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [Tinode](https://github.com/tinode/chat). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral

O Tinode chat é um aplicativo multiplataforma de mensagens instantâneas, com ênfase em comunicação mobile. Uma de suas motivações é criar uma plataforma que seja descentralizada, se tornando muito mais difícil de ser rastreada e bloqueada por governos. Mais informações sobre o produto podem ser encontradas [neste link](https://github.com/tinode/chat).

## O Tinode

### Objetivo Geral

Implementar um serviço para capturar automaticamente o que é dito no twitter sobre as proposições que acompanhamos e prover indicadores sobre as publicações para serem usados no parlametria.

### Objetivos Específicos

Queremos ter acesso ao grau de atividade no twitter de parlamentares e de influenciadores do debate no twitter. Além disso, queremos saber quanto essas pessoas tuítam sobre cada proposição ou tema e a indicadores sobre sua atividade. Para parlamentares também queremos indicadores a partir dos léxicos de discurso desenvolvidos pelos nossos parceiros.

### Contexto

Nesta seção eu espero duas coisas: o diagrama de contexto e um texto curto descrevendo em mais detalhes o contexto do sistema. Isso inclui as fronteiras do sistema, os sistemas/serviços externos com os quais ele se comunica etc.

Abaixo estão dois exemplos de diagramas de contexto.

![fig1](c4-context.png)

<img class="center" src="parlametria-contexto.png" style="width:60%">

### Containers

Nesta seção eu espero duas coisas: o diagrama de containers e texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.

![fig3](c4-containers.png)
![fig4](parlametria-container.png)
![fig5](c4-implantacao.png)
![fig6](parlametria-implantacao.png)

### Componentes

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig7](c4-componentes.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Aqui você deve descrever as informações importantes que são coletadas, manipuladas, armazenadas e distribuídas pelo sistema. Você não precisa descrever todas as informações, somente uma parte que seja essencial para o sistema. Por exemplo, se eu estivesse tratando do instagram, faria algo relacionado aos posts.

Além da descrição gostaria de ver aqui um diagrama para descrever os estados (ex: máquina de estados) de uma informação de acordo com as ações do sistema.

# Contribuições Concretas

_Descreva_ aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
