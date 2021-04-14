+++
title = "Fila da Creche - Documento arquitetural"
date = 2020-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Mateus de Lima Oliveira.

- Matrícula: 117110219
- Contato: mateus.oliveira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/prefeiturasp/SME-FilaDaCreche

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [Fila de Creche](https://github.com/prefeiturasp/SME-FilaDaCreche). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que este documento visa expor de forma mais abstrata como funciona o conjunto de ferramentas da aplicação e não necessariamente explicará em detalhes a sua implementação.


## Descrição Geral sobre o Fila de Creche

O Fila da Creche é um projeto com iniciativa da Secretaria Municipal de Educação de São Paulo que busca facilitar o acompanhamento de geração de vagas na educação infantil de acordo com localização e faixa etária informadas. Mais detahes sobre o projeto podem ser vistos [nesse link](https://educacao.sme.prefeitura.sp.gov.br/entenda-como-funciona-a-plataforma-vaga-na-creche/).


### Objetivo Geral  (TO DO)

Implementar um serviço para capturar automaticamente o que é dito no twitter sobre as proposições que acompanhamos e prover indicadores sobre as publicações para serem usados no parlametria. 

### Objetivos Específicos (TO DO)

Queremos ter acesso ao grau de atividade no twitter de parlamentares e de influenciadores do debate no twitter. Além disso, queremos saber quanto essas pessoas tuítam sobre cada proposição ou tema e a indicadores sobre sua atividade. Para parlamentares também queremos indicadores a partir dos léxicos de discurso desenvolvidos pelos nossos parceiros.

### Contexto (TO DO)

Nesta seção eu espero duas coisas: o diagrama de contexto e um texto curto descrevendo em mais detalhes o contexto do sistema. Isso inclui as fronteiras do sistema, os sistemas/serviços externos com os quais ele se comunica etc.

Abaixo estão dois exemplos de diagramas de contexto.

![fig1](c4-context.png)

<img class="center" src="parlametria-contexto.png" style="width:60%">

### Containers (TO DO)

Nesta seção eu espero duas coisas: o diagrama de containers e  texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.

![fig3](c4-containers.png)
![fig4](parlametria-container.png)
![fig5](c4-implantacao.png)
![fig6](parlametria-implantacao.png)

### Componentes (TO DO)

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig7](c4-componentes.png)

### Código (TO DO)

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação (TO DO)

Aqui você deve descrever as informações importantes que são coletadas, manipuladas, armazenadas e distribuídas pelo sistema. Você não precisa descrever todas as informações, somente uma parte que seja essencial para o sistema. Por exemplo, se eu estivesse tratando do instagram, faria algo relacionado aos posts.

Além da descrição gostaria de ver aqui um diagrama para descrever os estados (ex: máquina de estados) de uma informação de acordo com as ações do sistema.

# Contribuições Concretas (TO DO)

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.