+++
title = "Documentação Arquitetural para o Home Assistant"
date = 2020-10-13
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Gabriel Souto Maracajá.

- Matrícula: 115110977
- Contato: gabriel.maracaja@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/home-assistant/core

# Descrição Arquitetural -- Assistente Doméstico

Este documento descreve parte da arquitetura do projeto [Asssitente Doméstico](https://github.com/home-assistant/core). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

Buscamos definir da melhor maneira possível, a forma arquitetural empregada no projeto *Home Assistant*.

## Descrição Geral sobre o *Home Assistant*

O projeto do Assistente Doméstico deseja facilitar a vida dos integrantes de uma casa, dando a eles a autonomia de controlar todos os dispositivos que estejam conectados a rede de internet. Os dispósitivos são lâmpadas, portas com fechadura eletrônica, portão da garagem, etc.  Mais detalhes sobre o projeto podem ser vistos [neste link](https://www.home-assistant.io/).

## O *Home Assistant*

### Objetivo Geral

Deseja-se implementar um serviço que permita ao residente da casa ter controle sobre todos os dispositivos eletrônicos ou elétricos que possuam algum tipo de conexão com a rede. De tal forma que o residente pode sair de sua casa e ter controle sobre toda ela através de um software em seu smartphone ou no seu laptop.

### Objetivos Específicos

O objetivo específico é dar total liberdade aos usuários para controlarem suas casas a partir de qualquer dispositívo móvel. O *Home Assistant* permite que você controle tudo em sua residência sem subir nenhum dado para a nuvem, mantendo realmente seguro o que deve estar em secreto. Você pode controlar regras avançadas para cada comodo de sua casa. Programar cada espaço da residencia para realizar uma determinada função de acordo com a vontade do morador.

### Contexto

Observando-se o diagrama de contexto, vêmos a relação que o usuário possui com o sistema. O mesmo envia comandos para a controladora residencial que monitora todos os processos da casa. De forma que, os dados passados para essa controladora repercutem em alterar os estados de aparelhos ou de determinadas instâncias da casa.

As duas principais barreiras encontradas pelo sistema seriam a falta de energia e também de conexão com a rede. Dessa maneira o usuário perderia qualquer meio de se comunicar com a controladora residencial, refletindo diretamente em uma perca de controle remoto da moradia. 

Abaixo segue um exemplo de diagrama de contexto do *Home Assistant*:

<img class="center" src="Figura1.png" style="width:80%">

### Containers

No diagrama de containers observamos primeiramente a relação do usuário com o frontend do projeto, o qual requisita diretamente o núcleo do *Home Assistant*, a partir daí, é realizada a chamada ao serviço. Essa chamada pode ser, ascender uma lâmpada, fechar uma porta, alterar a temperatura, etc.

A partir da chamada realizada ao dispositivo que foi requisitado pelo núcleo, temos o envio do comando que ativa a plataforma dos mecanimos e acessa a biblioteca da lâmpada (no caso do exemplo). Após todos esses passos, o estado é alterado, seja para ligar ou desligar a lâmpada e a informação é retornada para o usuário do sistema. A informação de que o estado foi alterado volta pelos mesmos containers que precisou ser acessado no primeiro momento.  

Segue abaixo o diagrama de container do *Home Assistant*:

<img class="center" src="Figura4.png" style="width:80%">

### Componentes

Observando este diagrama, notamos que os componentes rastreiam os dispositivos dentro de um domínio específico, o qual consiste em uma parte central e uma parte lógica. Estes componentes apresentam suas informçaões através de uma máquina estática que fica na residencia do usuário (pode ser um Raspberry Pi). Os componentes, também são capazes de guardarem informações no resgistro de serviços para expor o controle dos dispositivos.

No diagrama de componentes vemos que tudo deve passar pelo núcleo da controladora, local em que cada operação é designada para o componente. Toda a informação recebida pela controladora fica armazenada no dispositivo principal o qual pode ser acessado posteriormente. Toda a questão do código e da API ficam armazenados dentro do controlador principal (como foi dito acima, pode ser um Raspberry Pi). 

Como todos os componentes ficam armzenados dentro da residencia do usuário, não é necessário que nenhum dado suba para a nuvem. Tornando assim o *Home Assistant* seguro para seus usuários.

Abaixo um exemplo de diagrama de componente do projeto *Home Assistant*:

<img class="center" src="Figura2.png" style="width:80%">

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Como foi dito anteriormente, as informações coletadas são guardadas no armazenamento próprio da controladora. Assim, quando o usuário delegar para que determinado componente mude seu estado de desligado para ligado, o núcleo da controladora irá buscar essa informação e repassará para os componentes, de tal maneira que eles mudram seu estado.

Após realizar a atividade requerida pelo usuário, o sistema armazena essa informação e não realiza upload dela para serviços da nuvem, dando total segurança ao morador. Com *Home Assistant* você pode comandar vários aparelhos de sua casa, sem estar em casa e com segurança.

Abaixo, vemos neste diagrama como é realizada a solicitação de acesso ao *Home Assistant*:

<img class="center" src="Figura3.png" style="width:80%">

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.