+++
title = "Descrição arquitetural do OpenVidu"
date = 2021-08-01
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Wellisson Gomes Pereira Bezerra Cacho.

- Matrícula: 118210873
- Contato: wellisson.cacho@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/OpenVidu/openvidu

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [OpenVidu](https://github.com/OpenVidu/openvidu). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral sobre o OpenVidu

É uma plataforma para facilitar a adição de videochamadas em seu aplicativo web ou mobile. Ele fornece um conjunto completo de tecnologias muito fáceis de integrar em sua aplicação.

## A plataforma do OpenVidu

### Objetivo Geral

Permitir que os desenvolvedores e desenvolvedoras adicionem comunicações em tempo real a seus aplicativos de forma muito rápida e com baixo impacto em seu código.

### Objetivos Específicos

Criar video chamadas totalmente customizadas sem se preocupar com as operações de baixo nível. O OpenVidu fornece uma API simples, eficaz e fácil de usar para você poder esquecer o WebRTC e as coisas complicadas relacionadas a mídia.

### Contexto

O OpenVidu é utilizado por uma aplicação web (no cliente ou server side) que permite que os desenvolvedores adicionem comunicações em tempo real aos seus aplicativos de maneira rápida e fácil. O mesmo utiliza o Kurento para facilitar detalhes de baixo nível. Além disso, o OpenVidu pode ser utilizado tanto no client side (como o mobile, mas não expandiremos até esse ponto) como no server side.

Kurento é um servidor de mídia WebRTC (comunicação em tempo real da Web) e um conjunto de APIs que simplifica o desenvolvimento de aplicativos de vídeo avançados para plataformas web e smartphones. Os recursos do servidor de mídia Kurento incluem comunicações em grupo, transcodificação, gravação, mixagem, transmissão e roteamento de fluxos audiovisuais.

![OpenVidu](./openvidu-contexto.jpeg)

### Containers

Abaixo, observamos o diagrama de container para o OpenVidu:

![OpenVidu](./openvidu-container.jpeg)

Como já havia sido dito, é possível utilizar o OpenVidu em diversos módulos de um único sistema. Daremos foco em dois containers: openvidu-browser e openvidu-server.

* **openvidu-browser:** Nesse container, são executadas funções solicitadas pelo usuário. Isto é, renderiza determinados componentes que, juntos, constroem todo o arcabouço para chamadas de vídeo. Comunica-se com a API usando WebRTC.
  
* **openvidu-server:** Container que engloba toda a parte do servidor da aplicação e gerencia o Kurento. É responsável por definir todas as entidades do domínio, criar uma sessão de vídeo, conectar usuários a uma determinada sessão, etc. Como já foi dito acima, é fornecido uma API WebRTC para o *openvidu-client* poder utilizar, mas também é fornecido uma API REST para que sistemas externos também possam fazer uso.