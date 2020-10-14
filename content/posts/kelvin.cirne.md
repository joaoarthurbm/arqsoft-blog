+++
title = "Documentação arquitetural para o Discord.py"
date = 2020-10-13
tags = []
categories = []
+++

***

Este documento foi escrito foi o objetivo de descrever a arquitetura do Discord.py.


***

# Autores

Kelvin Cirne de Lacerda Custódio.

- Matrícula: 117210387
- Contato: kelvin.cirne.custodio@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Rapptz/discord.py

# Descrição Arquitetural -- Discord.py

Este documento descreve parte da arquitetura do projeto [Discord.py](https://github.com/Rapptz/discord.py). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

Vale salientar que este documento NÃO descreve toda a arquitetura desse projeto. 
O foco aqui é a descrição de um serviço específico de realização de chamadas, que é um dos núcleos do projeto.


## Descrição Geral sobre o Discord.py

O Discord.py é um projeto que possui como objetivo fornecer um API wrapper, escrito em Python, para Discord. Rico em recursos, fácil de usar e otimizado - em velocidade e memória -, também possui tratamento adequado de do limite de taxa e 100% de cobertura da API original suportada.


## O serviço de chamadas (e mensagens) do Discord.py

### Objetivo Geral

Permitir com que dois ou mais usuários do Discord possam realizar uma chamada. 

### Objetivos Específicos

Permitir com que dois ou mais usuários tenham a possibilidade de comunicar-se tanto através de voz, quanto através de vídeo, permitindo controle de volume dos áudios recebidos de outros usuários. 


### Contexto

- O ator principal desse sistema é o seu usuário. Ele pode realizar chamadas para outro(s) usuário(s) através de uma entidade channel.
- O channel exibe informações sobre quais usuários estão digitando, permite com que sejam enviados arquivos ou criados bots (outra entidade do sistema) pelos usuários.
- Os bots podem desempenhar algum comportamento no channel, como executar uma música, a gosto do usuário, ou enviar uma mensagem de boas vindas, por exemplo, para um novo usuário que entra no channel.


### Visão de Informação


- Quando algum usuário realiza uma chamada, o sistema coleta quais usuários estão sendo 'convidados' a entrar nela; em seguida, quais aceitaram e quais recusaram. 
- Se um usuário já estiver em uma chamada, o sistema recupera o status do áudio dele (ligado ou mutado), bem como o seu volume. O sistema também coleta a informação do volume que um usuário define para os outros que estão na chamada (um usuário pode diminuir, aumentar ou mutar o áudio que recebe de outro usuário).
- Após o início da chamada, o sistema coleta a sua hora de início. Após o último usuário presente na chamada sair dela, a propriedade call_ended é modificada e o sistema coleta a data de término. Após isso, o channel da chamada exibe a sua duração total.
