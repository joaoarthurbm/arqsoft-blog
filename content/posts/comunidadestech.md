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

 O sistema Comunidades.tech utiliza a API do LinkedIn como login para manter o cadastro de um usuário, o mesmo pode ser classificado nas seguintes categorias: 
* Uma pessoa que representa uma ou mais comunidades e deseja cadastrar (divulgar) sua(s) comunidade(s);
* uma pessoa que quer participar de comunidade(s) e deseja buscar e visualizar comunidades do seu interesse;
* Ambos.

As informações das comunidades cadastradas são maninpuladas pelo Back-end do sistema Comunidades.tech e armazenadas em um Banco de Dados mantido pelo mesmo.
 
 
Abaixo está o diagrama de contexto.

![fig](diagrama-contexto.png)


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

O objetivo do sistema é divulgar comunidades, por isso, entender como acontece a publicação dessas comunidades é muito importante. O primeiro passo é fazer parte do comunidades.tech, ou seja, ter um cadastrado ativo no sistema. Após o login, é possível visualizar um botão "Casdastre uma comunidade", clicando nele, será aberta a página de cadastro com alguns formulários que solicitam informações como: nome, localização, membros e links. Após o preenchimento dos formulários, e clicando no botão "Criar Comunidade" a comunidade será cadastrada, e será encaminhada para análise, onde  ocorre a validação dos dados. Finalmente, a depender do resultado da análise, a comunidade será publicada, ou não.

A seguir está o diagrama de máquina de estados para descrever os estados do procedimento de publicação de uma comunidade.

![fig](diagrama-maquina-estados.png)

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
