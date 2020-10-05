+++
title = "Documentação Arquitetural para o Comunidades.tech"
date = 2020-10-05
tags = []
categories = []
+++

***

Este é um documento descreve a arquitetura geral do Comunidades.tech.

***

# Autora

Este documento foi produzido por Raquel Ambrozio da Fonseca.

- Matrícula: 116210531
- Contato: raquel.fonseca@ccc.ufcg.edu.br
- Projeto: https://github.com/universoimpulso/comunidadestech

# Descrição Arquitetural -- Comunidades.tech

Este documento descreve a arquitetura do projeto [Comunidades.tech](https://github.com/universoimpulso/comunidadestech). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que será descrita a arquitetura geral do Comunidades.tech. O foco aqui não é detalhar elementos específicos do projeto.


## Descrição Geral sobre o Comunidades.tech

O Comunidades.tech é um projeto open source desenvolvido pela comunidade da [Impulso.Network](https://impulso.network/entrar?referral=comunidadestech), que tem como objetivo ser um espaço de visibilidade e fortalecimento das comunidades de tecnologia. Mais detalhes sobre o projeto podem ser vistos [neste link](https://comunidades.tech/).

## Comunidades.tech

### Objetivo Geral

O projeto divulga comunidades de tecnologia de todo Brasil, sendo essas vituais ou presenciais. 

### Objetivos Específicos

Cadastrar comunidades de tecnologia, por tipo (Discord, Meetup, Slack, etc) e categoria (Desenvolvimento de Software, Infraestrutura, Dados, Games, etc ). Além disso, disponibilizar essas comunidades em um catálogo com seus devidos dados (nome, descrição, tecnologias utilizadas, localização, dados para contato, entre outras).

### Contexto

 O sistema têm basicamente dois tipos de usuários. Um(a) representante de uma comunidade que deseja cadastrar a(s) comunidade(s) que ele representa, e um(a) interessado(a) que deseja buscar e visualizar comunidades do seu interesse. As informações cadastradas da comunidades são armazenadas em um Banco de Dados do próprio projeto Comunidades.tech.
 
 
Abaixo está o diagrama de contexto.

![fig1](contexto.png)


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
