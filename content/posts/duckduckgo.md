+++
title = "Documentação Arquitetural do DuckDuckGo"
date = 2021-05-26
tags = []
categories = []
+++

## Autora

- Matrícula: 115210432
- Nome: Sheilla da Silva
- Contato: sheilla.silva@ccc.ufcg.edu.br | sheillasilvasp@gmail.com
- Projeto documentado: [https://github.com/duckduckgo/Android](https://github.com/duckduckgo/Android)

## Descrição Arquitetural – Aplicativo DuckDuckGo

Este documento descreve parte da arquitetura do aplicativo DuckDuckGo. Essa descrição foi baseada principalmente no modelo C4.

### Descrição Geral sobre o DuckDuckGo

O aplicativo do DuckDuckGo é um navegador de busca gratuito.

### O DuckDuckGo

#### Objetivo Geral

O DuckDuckGo tem como objetivo a garantir a privacidade e a segurança das informações pessoais dos usuários.

#### Objetivos Específicos

O DuckDuckGo não coleta, armazena ou compartilha os dados pessoais dos usuários. 

#### Contexto

O duckduckgo possui dois modelos de pesquisa. Sendo o principal pela API do DuckDuckGo e a outra opção é a pesquisa através de outras plataformas como Netflix e Amazon, por exemplo.

* Para o modulo principal de busca, basta o usuário interagir com a ferramenta. 
* Para o modulo secundário de busca, basta o usuário inserir a tag da plataforma que ele deseje redirecionar a busca.

![contexto](context.png)

#### Containers

O motor de busca do DDG verifica qual o tipo de busca e redireciona para os seus respectivos fluxos. O meio principal de busca, consta com alguns elementos, como:

* Site com Barreira de Segurança é uma ferramenta que permite ou não a busca em sites que possuam uma barreira de segurança. Por default esse mecanismo não permite a busca nesses sites, para habilitar essa opção o usuário precisa alterar as configurações da ferramenta.
* A filtragem de busca é uma ferramenta que permite aprimorar as buscas dos usuários. Como o DDG não é tendencioso a análise de dados pessoais ou parceiros para retornar dados da busca para o usuário de forma diferente, então ele sempre retornará as mesmas opções de busca na mesma ordem. O sistema de filtragem permite aprimorar as buscas para uma acertividade maior. 
* O redirecionamento de clicks, é um meio de previnir que dados da pesquisa do usuário não sejam mapeados e utilizados por outros sites.

![container](container.png)

#### Componentes

As configurações de privacidade do navegador possuem quatro elementos chaves que permite ao usuário definir o nível de privacidade de seus dados. Sendo eles:

* Site com barreira de segurança
* Desativador/Ativador de proteção de privacidade
* Busca encriptada
* Bloqueador de rastreamento

Cada uma dessas configurações inteferem diretamente nos dados que poderão ser trafegados ou distribuidos pela rede. Por padrão o navegador vem com todos os elementos ativos para impedir qualquer uso indevido de dados pessoais do usuário por terceiros. 

![components](component.png)