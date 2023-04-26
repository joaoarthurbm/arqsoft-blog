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

O duckduckgo possui os aplicativos disponiveis na Play Store e App Store. O usuário pode realizar o download em qualquer uma dessas lojas. 

Ambas as lojas permitem que ao subir novas versões do aplicativo, essas versões sejam disponibilizadas para uma quantidade x de usuários. Essa quantidade é definida no momento de implantação da nova versão. Isso auxilia nos testes de impacto da nova versão aos usuários e solução de bugs encontrados em produção.


![contexto](context-new.png)

#### Containers

O aplicativo para Android tem 96.8% dos elementos desenvolvido em Kotlin.
O aplicativo IOS possui 96,7% dos seus elementos desenvolvido em Swift.

Ambas as linguagens escolhidas permitem a aplicação ter mais poder sobre os dipositivos físicos. Isso é um facilitador para que outros aplicativos não façam uso ou coleta indevida de dados dentro da nossa aplicação. Além de poder trazer mais transparência e privacidade dos dados ao usuário.

O duckduckgo possui dois modelos de pesquisa. Sendo o principal pela API do DuckDuckGo e a outra opção é a pesquisa através de outras plataformas como Netflix e Amazon, por exemplo.

O browser de busca do DDG verifica qual o tipo de busca e redireciona para os seus respectivos fluxos. 

![container](container-new.png)

#### Componentes

O principais componentes do aplicativo, são:

* Browser, que é o meio de interação do usuário com a aplicação.
* A filtragem de busca é uma ferramenta que permite aprimorar as buscas dos usuários. Como o DDG não é tendencioso a análise de dados pessoais ou parceiros para retornar dados da busca para o usuário de forma diferente, então ele sempre retornará as mesmas opções de busca na mesma ordem. O sistema de filtragem permite aprimorar as buscas para uma acertividade maior. 
* !Bangs, é o mecanismo de redirecionamento da busca do usuário para a plataforma desejada.
* Configurações de privacidade. O navegador possue quatro elementos chaves que permite ao usuário definir o nível de privacidade de seus dados. Sendo eles:

* Site com barreira de segurança
* Desativador/Ativador de proteção de privacidade
* Busca encriptada
* Bloqueador de rastreamento

_Cada uma dessas configurações inteferem diretamente nos dados que poderão ser trafegados ou distribuidos pela rede. Por padrão o navegador vem com todos os elementos ativos para impedir qualquer uso indevido de dados pessoais do usuário por terceiros._

O DDG possui dois modelos de busca principais, sendo eles: 

* O modulo principal de busca: basta o usuário interagir com a ferramenta. 
* O modulo secundário de busca: basta o usuário inserir a tag da plataforma que ele deseje redirecionar a busca.

![components](component-new.png)

### Visão de Informação

Rastreadores são ativos de terceiros conhecidos por compartilhar informações pessoais, seja por meio da operação de script ou da solicitação do próprio recurso.

O DDG possui um algoritmo que avalia e defini se vai bloquear ou substituir as solicitações desses elementos.

![algoritmo-bloqueio](algoritmo-bloqueio.png)

Esse algoritmo é essencial para a privacidade e segurança dos dados dos usuários.