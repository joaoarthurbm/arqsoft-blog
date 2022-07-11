+++
title = "Documentação Arquitetural do Home Assistant"
date = 2022-06-03
tags = []
categories = []
+++

# Autores

Este documento foi produzido por:

 Áthila Matheus - Turma 2

- Matrícula: 118210206
- Contato: athila.borges@ccc.ufcg.edu.br

 Cleciana M. Santana - Turma 1

- Matrícula: 117110237
- Contato: cleciana.santana@ccc.ufcg.edu.br

 João Pedro Silva de Melo - Turma 1

- Matrícula: 118210796
- Contato: joao.melo@ccc.ufcg.edu.br

 Renan Carneiro - Turma 1

- Matrícula: 119110163
- Contato: renan.araujo@ccc.ufcg.edu.br

Link do Github: https://github.com/home-assistant/core

# Descrição Arquitetural -- Home Assistant

Este documento tem como propósito descrever a documentação arquitetural do software para automação residencial Home Assistant.


## Descrição Geral sobre o Home Assistant

O Home Assistant é uma ferramenta gratuita e open source cuja utilidade está ligada a automação residencial, funcionando como um sistema de controle central para dispositivos domésticos inteligentes, focando no controle local e na privacidade.

## A ferramenta Home Assistant

### Objetivo Geral

O Home Assistant proporciona automação residencial para serviços de *Smart Home* - Casa Inteligente - e pode ser acessado através de uma interface de usuário baseada em web por aplicativos pelo Android ou iOS, ou por comandos de voz via assistentes virtuais (Google Assistant, Amazon Alexa, Cortana). Ao ser instalado como um *appliance*, ele irá atuar como o sistema de controle central para a casa inteligente, também conhecido como *Smart Home Hub*.


### Objetivos Específicos

O Home Assistant funciona sem a necessidade de *nuvem*, o que significa que o sistema de automação inteligente não é dependente de servidores remotos nem de conexão com a internet. Ele permite definir cronogramas e fazer com que dispositivos inteligentes (cafeteiras, lâmpada, câmeras de segurança) funcionem juntos, com o maior nível de inteligência possivel. O Home Assistant busca por dispositivos inteligentes na lista de redes Wi-Fi, se conecta ao dispositvo que pode controlar e exibe uma interface para que trabalhem juntos, baseando-se em quando e como um determinado comando irá ser executado.

### Contexto

O funcionamento ocorre quando um usuário requisita o Home Assistant ou um Sistema externo, que fará uma requisição enviando as configurações para uma integração de dispositivos que retorna as mesmas gerenciando os processos.

![fig1](ha1.png)

### Containers

O Home Assistant possui os seguintes containers:

- **Authentication**: Sistema de autenticação embutido;
- **Config**: Responsável por armazenar e lidar com chamadas de configurações;
- **Core Architecture**: Facilita os eventos e serviços;
- **Operating System**: Ambiente para rodar os containers *Supervisor* e *Core*;
- **Supervisor**: Gerencia o sistema operacional.



![fig2](ha2.png)

### Componentes

Há quatro componentes:

- **Service Registry**: Responsável por *escutar* o barramento de eventos e permitir o registro de serviços;
- **Event Bus**: Responsável por permitir que quaisquer integração acione ou *escute* eventos;
- **State Machine**: Responsável por monitorar os estados e notificar quando um estado sofre uma mudança;
- **Timer**: Temporizador que funciona enviando o evento de mudança de tempo a cada segundo.

![fig3](ha3.png)

### Visão de informação

O diagrama abaixo descreve a máquina de estados para a inserção de um sensor em um sistema Home Assistant. Bem ao inserir um novo sensor, ele é iniciado como sensor *Registrado* (Estado I), que basicamente consiste em um estado onde apenas o sensor é criado e adicionado às suas características. Logo após, necessariamente, o sensor precisa ser atualizado. Sendo assim, ele passa ao estado de *Atualizado* (Estado II), estado que serve para atualizar algumas variáveis do sensor e também gerar uma variável responsável por ativar/desativar o sensor. Após o sensor ser atualizado, ele pode ser *Sincronizado* (Estado III) com o sistema, no qual esse sensor é sincronizado com o Home Assistant, permitindo realizar diversas ações como criação de rotinas, disparos de alarmes, ativações de aparelhos, entre outras. Vale destacar também que o sensor pode ser desativado, sendo assim, ele retornará ao estado anterior, *Atualizado*, no qual pode permanecer até ser feita uma nova sincronização.

![fig4](diagrama.png)