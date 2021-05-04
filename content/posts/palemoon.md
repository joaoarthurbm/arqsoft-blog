+++
title = "Documentação da arquitetura do navegador Pale Moon"
date = 2021-04-16
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Amanda Vivian Alves de Luna e Costa.
- Matrícula: 116210896
- Contato: amanda.costa@ccc.ufcg.edu.br
- Projeto documentado: https://repo.palemoon.org/MoonchildProductions/Pale-Moon e http://www.palemoon.org/


# Descrição Arquitetural -- Navegador Pale Moon

Este documento descreve parte da arquitetura do navegador [Pale Moon](http://www.palemoon.org/). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o navegador Pale Moon

Pale Moon é um navegador de código aberto Goanna-based disponível para Microsoft Windows e Linux (com outros sistemas operacionais em desenvolvimento), com foco em eficiência e personalização.

Pale Moon oferece a você uma experiência de navegação em um navegador totalmente construído a partir de sua própria fonte desenvolvida de forma independente, que foi bifurcada do código do Firefox / Mozilla há alguns anos, com recursos e otimizações cuidadosamente selecionados para melhorar a estabilidade do navegador e a experiência do usuário. 

Um dos seus maiores diferenciais é não expor seus dados de maneira nativa. Para tal, alguns recursos padrão dos browsers foram simplesmente eliminados e, o principal motivo das pessoas o utilizarem é a sua garantia de mais segurança dos dados pessoais durante o uso, uma das features que asseguram isso é não possuir telemetria, um recurso que tem acesso a quase todos os dados do seu computador, como por exemplo, qual seu hardware,sistema operacional,entre várias outras coisas.


### Contexto

![fig1](Diagrama_Palemoon_Contexto.png)

O Palemoon é um navegador de internet que protege suas informações de maneira nativa, por causa disso não possui tanta complexidade. Ao invés de incluir dependências e similares, ele os retira para que a privacidade seja mantida. Além disso, ele só está disponível para desktop Windows e Linux, não havendo portabilidade para mobile. 

O Palemoon também oferece nativamente a opção de usar o buscador DuckDuckGo fruto de uma parceria com o sistema, porém, caso o usuário queira, pode trocar de buscador sem complicações.

### Containers

![fig2](Diagrama_Contexto_Palemoon.png)

Por ser uma aplicação mais simples, o Palemoon não dispõe de muitos contâineres. A aplicação pode ser dividida entre a aplicação (Desktop App), que representa o que o usuário visualiza e navega, esta faz chamadas à API. Em relação a API,  ela é feita em C/C++, e contém todas as funções/features que o navegador possui. Esta se comunica com o banco de dados, implementado em SQLite, que fica armazenado localmente com suas configurações e preferências.

### Componentes

![fig3](Diagramas_Componentes_Palemoon.png)

O navegador não possui muitos componentes, quando ele é iniciado outros além dos mostrados aqui são utilizados. Dentre eles, temos os seguintes:

- *Browser:* Responsável pela funcionalidade principal de possibilitar o acesso a internet.

- *Search:* Responsável por disponibilizar os buscadores para o Palemoon. Esse componente que se relaciona com o buscador default, o [DuckDuckGo](https://duckduckgo.com/about).

- *Plugin:*: Responsável por gerenciar os plugins e extensões do navegador, que podem ser instaladas através de um [site próprio do Palemoon](https://addons.palemoon.org/extensions/).

- *Security:* Responsável pela segurança de autenticação quando o usuário inicia o browser ou se vincula durante a sessão.

- *Services:* Responsável por gerenciar a criptografia e sicronização dos dados, garantindo que seus estes sejam protegidos ao navegar e não sejam capturados pela maioria dos sistemas.

- *LDAP:* Responsável por gerenciar as conexões de email, também com foco na proteção dos dados.
