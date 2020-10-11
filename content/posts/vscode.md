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

É importante destacar que não será descrita toda a arquitetura do VS Code. O foco aqui é a descrição do seu núcleo central, parte fundamental do projeto. Componentes satélites como o Chrome Debug Core, NLS Tools, CSS/LESS/SCSS Language Service e ESLint possuem seu próprio repositório e não serão abordados profundamente neste documento. Para ver a lista completa de projetos relacionados acesse o link [Related Projects](https://github.com/microsoft/vscode/wiki/Related-Projects).


## Descrição Geral sobre o VS Code 

O Visual Code Studio, ou simplesmente VS Code, é um editor de código que foi lançado em 2015 pela Microsoft. É uma ferramenta de código aberto voltada para o desenvolvimento de aplicações web, mobile e de cloud. O Visual Code se baseia no Electron (framework usada para desenvolver aplicativos Node.js). O seu conjunto de utilitários faz com que concorra de igual para igual com ferramentas pagas existentes no mercado.

**Seus pontos de Destaque são:**

+ É Multiplataforma

![fig3](multiplataforma.png)

+ É Multilinguagem: Suporta mais de 30 linguagens de programação além de formatos comuns de arquivos.

+ É Personalizável

+ É uma aplicação leve

+ Apresenta uma excelente paleta de atalhos: além da seus atalhos, é possível alterar para os atalhos reconhecidos pelo Sublime e pelo Atom.

+ Permite adicionar Extensões

+ Possui o IntelliSense: Recurso de preenchimento de código que permite listar métodos, obter informações de parâmetro, completar palavras.

![intelliSense](intelliSense.gif)

### Objetivo Geral do VS Code

Fornecer um editor de código simples que cubra as necessidades dos desenvolvedores nas 3 fases de desenvolvimento: codificação, criação do artefato e depuração.

### Objetivos Específicos

Prover uma ferramenta poderosa para o desenvolvedor, que tenha uma edição de código abrangente, navegação e suporte de compreensão, depuração leve, um modelo de extensibilidade rico e integração leve com ferramentas existentes.

### Contexto

O VS Code é uma aplicação que roda em sistemas windows, macOS e Linux. Tem como base para sua interface com o usuário o framework Electron. Interage com o sistema de versionamento do GitHub.

![fig4](c4-contexto-vscode-plat.png)

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