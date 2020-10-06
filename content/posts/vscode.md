+++
title = "Documentação Arquitetural do VS Code"
date = 2020-10-06
tags = []
categories = []
+++



***

como usar imagem 
![fig1](logo1.png)
![fig2](logo2.png)

<img src="logo2.png" style="border-radius: 80px; width: 280px; height:150px"/>

<img src="logo3.png" style="height: 0px; width: 80px;"/>

*itálico*

**Negrito**

[Link](google.com.br)

***

# Autores

Este documento foi produzido por Gabriel Almeida Azevedo.

- Matrícula: 116210009
- Contato: gabriel.almeida.azevedo@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/microsoft/vscode

# Descrição Arquitetural do VSCode -- Serviço de análise do twitter Alterar

Este documento descreve parte da arquitetura do projeto [VS Code](https://github.com/microsoft/vscode). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do VS Code. O foco aqui é a descrição do seu núcleo central, parte fundamental do projeto. Componentes satélites como o Chrome Debug Core, NLS Tools, CSS/LESS/SCSS Language Service, ESLint possuem seu próprio repositório e não serão abordados profundamente neste documento. Para ver a lista completa de projetos relacionados acesse o link [Related Projects](https://github.com/microsoft/vscode/wiki/Related-Projects).


## Descrição Geral sobre o VS Code 

O Visual Code Studio, ou simplesmente VS Code, é um editor de código que foi lançado em 2015 pela Microsoft. É uma ferramenta de código aberto voltada para o desenvolvimento de aplicações Web. O Visual Code se baseia no Eletron (framework usada para desenvolver aplicativos Node.js). O seu conjunto de utilitários faz com que concorra de igual para igual com ferramentas pagas existentes no mercado.

**Seus pontos de Destaque são:**

+ É Multiplataforma

![fig3](multiplataforma.png)

+ É Multilinguagem: Suporta mais de 30 linguagens de programação além de formatos comuns de arquivos.

+ É Personalizável

+ É uma aplicação leve

+ Excelente paleta de atalhos

+ Permite adicionar Extensões

+ Possui o IntelliSense: Recurso de preenchimento de código que permite listar membros, obter informações de parâmetro, completar palavras.

![intelliSense](intelliSense.gif)

## O Serviço de monitoramento do twitter

### Objetivo Geral

Implementar um serviço para capturar automaticamente o que é dito no twitter sobre as proposições que acompanhamos e prover indicadores sobre as publicações para serem usados no parlametria. 

### Objetivos Específicos

Queremos ter acesso ao grau de atividade no twitter de parlamentares e de influenciadores do debate no twitter. Além disso, queremos saber quanto essas pessoas tuítam sobre cada proposição ou tema e a indicadores sobre sua atividade. Para parlamentares também queremos indicadores a partir dos léxicos de discurso desenvolvidos pelos nossos parceiros.

### Contexto

Nesta seção eu espero duas coisas: o diagrama de contexto e um texto curto descrevendo em mais detalhes o contexto do sistema. Isso inclui as fronteiras do sistema, os sistemas/serviços externos com os quais ele se comunica etc.

Abaixo estão dois exemplos de diagramas de contexto.

![fig1](c4-context.png)

<img class="center" src="parlametria-contexto.png" style="width:60%">


**ATÉ AQUI DEVE SER FINALIZADO**

### Containers

Nesta seção eu espero duas coisas: o diagrama de containers e  texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

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

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.