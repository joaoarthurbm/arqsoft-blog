+++
title = "Documentação arquitetural do Stremio Web"
date = 2021-04-29
tags = []
categories = []
+++
***

![fig1](stremio-web-header.png)

# Autor

Este documento foi produzido por Fernando Jorge Pereira Júnior.

- Matrícula: 116210904
- Contato: fernando.junior@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Stremio/stremio-web

# Descrição Arquitetural -- Serviço de stream - Stremio Web

Este documento descreve parte da arquitetura do projeto [Stremio Web](https://www.stremio.com/translation/br/). A descrição arquitetural aqui apresentada foi construída tendo como base o modelo [C4](https://c4model.com/).


## Descrição Geral sobre o Stremio Web

O Stremio é uma solução integrada que possibilita aos seus usuários assistir e organizar conteúdo de vídeo a partir da instalação de complementos (plugins). Possui como objetivo disponibilizar diversos filmes, programas  de TV, canais da Web, esportes, ouvir podcasts e muitos outros serviços que são disponibilizados através dos addons.

## O serviço de stream - Stremio Web

### Objetivo Geral

Implementar um serviço de stream web  que permite aos seus usuários assistir organizar conteúdos de todos os tipos de mídia digital a partir dos mais de mais de 50 addons (plugins) presentes no catálogo.

### Objetivos Específicos

Disponibilizar diversos filmes, programas  de TV, canais da Web, esportes, ouvir podcasts e muitos outros serviços aos usuários do sistema.

### Contexto
O diagrama de contexto apresentado a seguir mostra uma visão geral dos sistemas com os quais o Stremio Web se comunica e os perfis de usuários que interagem com o sistema.

![fig2](stremio-web-contexto.png)

A comunicação entre pode ser resumida da seguinte forma:
- O Stremio Web se comunica com a aplicação local do Stremio que obrigatoriamente deve estar instalada na máquina do usuário para que as mídias possam ser executadas. 
- O Stremio se comunica com os addons (plugins) que são responsáveis por  apoiar a busca pelas mídias a serem transmitidas.
- O Stremio se comunica com base de dados para permitir os serviços de login e cadastro.
- O Stremio se comunica com base de dados do IMDB para coletar as informações referentes às mídias.


### Containers
O diagrama de containers apresentado a seguir mostra os elementos internos existentes no Stremio Web e como se comunicam com os serviços internos e externos.

![fig3](stremio-web-containers.png)

O sistema é composto por três containers: o frontend, backend e o V3 Cinemeta. Suas responsabilidades podem ser resumidas da seguinte forma:
- Frontend possibilita a interação com o usuário,  realizada através de uma interface desenvolvida em React.
- Backend responsável pela comunicação externa com o banco de dados para gerenciar os dados referentes ao usuário, é feito utilizando Nodejs
- V3 Cinemeta responsável pela comunicação externa com o IMDB  e gerencia as informações referentes às mídias.

### Componentes
O diagrama de componentes apresentado a seguir mostra os elementos internos existentes no backend do Stremio Web e como se comunica com os serviços internos e externos.

![fig4](stremio-web-componentes.png)

O componente backend  é composto por três componentes: o gerenciador de usuários, gerenciador de segurança e o gerenciador de addons. Suas responsabilidades podem ser resumidas da seguinte forma:
- Gerenciador de usuários é responsável pelo controle de usuário, realizando atividades como cadastro e atualização.
- Gerenciador de segurança é responsável pelo controle de acesso aos recursos, realizando atividades como autenticação dos usuários.
- Gerenciador de addons é responsável pelo controle de addons ao usuários, realizando atividades como cadastro e remoção de addons da conta do usuário.

### Visão de Informação
O diagrama apresentado a seguir mostra o fluxo da informação no Stremio Web para a execução de uma mídia.

![fig5](stremio-web-informacao.png)

O usuário através do frontend solicita para realizar  login na aplicação, esta solicitação é enviada ao backend que busca no banco de dados as informações e válida a autenticação do usuário. Logo em seguida o usuário pode fazer uma requisição para que um mídia seja reproduzida, fazendo o frontend se comunicar com V3 Cinemeta para buscar os dados da mídia no IMDB de acordo com a localização informada pelos addons. Depois da coleta desses dados o frontend se comunica com o Stremio instalado localmente para que a reprodução da mídia aconteça.