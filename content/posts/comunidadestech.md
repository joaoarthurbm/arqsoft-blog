+++
title = "Documentação Arquitetural para o Comunidades.tech"
date = 2020-10-05
tags = []
categories = []
+++

***

Este documento descreve parte da arquitetura de parte do sistema Comunidades.tech.

***

# Autora

Este documento foi produzido por Raquel Ambrozio da Fonseca.

- Matrícula: 116210531
- Contato: raquel.fonseca@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/universoimpulso/comunidadestech

# Descrição Arquitetural -- Comunidades.tech

Este documento descreve parte da arquitetura de parte do sistema [Comunidades.tech](https://github.com/universoimpulso/comunidadestech). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar será considerando apenas as principais funcionlidades do Comunidades.tech, ou seja, elementos específicos do sistema e sua implementação não serão detalhados.


## Descrição Geral sobre o Comunidades.tech

O Comunidades.tech é um projeto open source desenvolvido pela comunidade da [Impulso.Network](https://impulso.network/entrar?referral=comunidadestech), que tem como objetivo ser um espaço de visibilidade e fortalecimento das comunidades de tecnologia. Mais detalhes sobre o projeto podem ser vistos [neste link](https://comunidades.tech/).

## Comunidades.tech

### Objetivo Geral

Implementar um sistema para divulgar comunidades nacionais relacionadas a tecnologia, sendo essas vituais ou presenciais. 

### Objetivos Específicos

Queremos cadastrar e publicar comunidades de tecnologia, levando em consideração suas principais caracteríticas, como tipo (Discord, Meetup, Slack, etc) e categoria (Desenvolvimento de Software, Infraestrutura, Dados, Games, etc ). Por fim, disponibilizar essas comunidades em um catálogo com seus devidos dados, para que as pessoas consigam encontrar (utilizando os filtros) comunidades de seu interesse de maneira rápida e prática. 

### Contexto

O sistema Comunidades.tech utiliza a API do LinkedIn como login para manter o cadastro de um usuário e fazer a autenticação.
O usuário do sistema pode ser classificado nas seguintes categorias: 

* Pessoa que representa uma ou mais comunidades e deseja cadastrar e divulgar sua(s) comunidade(s);
* Pessoa que quer participar de comunidade(s) e deseja buscar e visualizar comunidades do seu interesse;
* Ambos.

As informações das comunidades cadastradas são maninpuladas pelo Back-end do sistema Comunidades.tech, e armazenadas em um Banco de Dados mantido pelo mesmo.
 
 
Abaixo está o diagrama de contexto.

![fig](diagrama-contexto.jpg)


### Containers

O sistema Comunidades.tech é uma aplicação que pode ser dividida basicamente em três grandes partes (containers):

* O Front-end (implementado utilizando React.JS), é a parte que o usuário interage através do seu navergador web para acessar as funcionalidades do sistema;
* O Back-end (implementado utilizando Node.JS), responsável pela lógica de negócios;
* Banco de Dados (MongoDB): onde os dados são armazenados;

[//]: <> (O Back-end  expõe uma API-REST utilizando o Express. )
Os containers estão **executando/implantandos** na plataforma em núvem **Heroku**. E toda comunicação é feita via API-REST (Express.JS) em formato JSON utilizando protocolos HTTPS.

Abaixo está o diagrama de containers.

![fig3](diagrama-containers.png)

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

O objetivo do sistema é divulgar comunidades, por isso, entender o fluxo das informações relacionadas com o cadastro e divulgação dessas comunidades é muito importante. 

O primeiro passo para conseguir publicar uma comunidade é fazer parte do Comunidades.tech, ou seja, ter um cadastrado ativo no sistema. Após o login, é possível visualizar um botão "Casdastre uma comunidade", clicando nele, será aberta a página de cadastro com alguns formulários que solicitam informações como: nome, localização, membros e links. Após o preenchimento dos quatro formulários, e concluída a revisão dos dados preenchidos, basta clicar no botão "Criar Comunidade", e acomunidade será cadastrada. Logo pós o cadastro, automaticamente a comunidade será encaminhada para análise, onde  ocorre a validação dos dados. Finalmente, a depender do resultado da análise, a comunidade será aprovada e publicada no catálogo de comunidades.

A seguir está o diagrama de máquina de estados para descrever os estados do procedimento de publicação de uma comunidade.

![fig](diagrama-maquina-estados.jpeg)

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
