+++
title = "Arquitetura do Jitsi Meet"
date = 2020-10-13
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Daniele Aparecida de Melo Silva.

- Matrícula: 117110348
- Contato: daniele.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/jitsi/jitsi-meet

# Descrição Arquitetural -- Serviço de gravação de uma conferência

Neste documento, é descrito um serviço específico de gravaçãode uma conferenência do projeto [Jitsi Meet](https://github.com/jitsi/jitsi-meet). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Sobre o Jitsi Meet

O Jitsi Meet é uma solução de videoconferência totalmente criptografada e de código aberto disponível todos os dias gratuitamente. O Jitsi Meet é executado no navegador, sem necessidade de criar uma conta ou de instalação.

O Jitsi Meet permite uma colaboração muito eficiente. Os usuários podem transmitir sua área de trabalho ou apenas algumas janelas. Ele também suporta edição de documentos compartilhados com Etherpad. O site oficial é: https://meet.jit.si.

## Sobre o serviço de gravação de uma conferência

O objetivo desse serviço é capturar áudio e vídeo de uma conferência e salvar localmente.

### Contexto

O contexto de gravação de uma conferência compreende os seguintes sistemas:

- Jitsi Meet — aplicação JavaScript que usa o Jitsi Videobridge para fornecer videoconferências ​​de alta qualidade, seguras e escaláveis.
- Jitsi Conference Focus (Jicofo) — componente server-side usado nas conferências do Jitsi Meet para gerenciar as sessões de mídia entre cada um dos participantes e o Videobridge.
- Jibri — conjunto de ferramentas para gravar e/ou transmitir uma conferência do Jitsi Meet.
- Prosody — servidor externo XMPP (abreviação para _Extensible Messaging and Presence Protocol_) usado para sinalização.

No seguinte diagrama de contexto para o serviço de gravação, o processo começa quando o usuário clica em "Iniciar gravação". O frontend do Jitsi Meet captura esse evento e o servidor envia uma requisição para o Prosody em formato XMPP, para que este encaminhe a mensagem ao Jicofo. O Jitsi Meet possui uma instância da conferência criada pelo Jicofo — responsável por todo o gerenciamento de uma conferência —, mas a comunicação entre eles é via XMPP.

Jicofo recebe um token e o formato do arquivo de gravação ('ogg', 'flac' ou 'wav') e utiliza o Jibri para lidar com a gravação. O Jibri é notificado que a gravação deve ser iniciada e entra como participante para gravar a conferência. Então, informa ao Jicofo seu novo status.

![fig1](contexto.png)

### Containers

O Jitsi Meet é composto de quatro containers: aplicação client-side escrita em React; aplicação móvel implementada com React Native; um servidor Nginx; e um banco de dados SQL.

As aplicações se comunicam com o servidor via HTTPS. O Nginx conversa com o Prosody atráves de mensagens XMPP, para então ser encaminhadas ao Jicofo. Jicofo e Jibri são escritos na linguagem Java.

Abaixo se encontra o diagrama de containers.

![fig2](containers.png)

### Componentes

No Jitsi Meet, existem três componentes principais para o processo de gravação:

- RecordingController, que lida com a sinalização entre os participantes e serve de fachada para outros componentes.
- RecordingAdapter, que engloba a API de áudio da Web e diferentes codecs de áudio. Possui uma interface que facilita alternar entre diferentes formatos e serve como um ponto para futuras extensões.
- SessionManager, que gerencia e mantém as informações sobre cada segmento da gravação. Essas informações são usadas para restauração de travamento e concatenação de segmentos da gravação.

As gravações são mantidas no armazenamento local do navegador (local storage) de cada participante, que não possui uma cota. Um codec com espaço eficiente diminui o risco de perda de gravações devido ao espaço.

Abaixo está o diagrama de componentes.

![fig3](componentes.png)

### Visão de Informação

Como mencionado, o Jibri entra na conferência como um participante e, em seguida, captura vários fluxos de áudio/vídeo e os envia para arquivos locais.

Em termos gerais, as etapas para gravar uma conferência são:

1. Criar uma sessão com a conferência JitsiMeet;
2. Receber fluxos de áudio/vídeo;
3. Receber fluxos de mídia;
4. Gravar fluxos de áudio/vídeo;
5. Gravar streams de mídia;
6. Registrar metadados.

Os metadados são mensagens legíveis por humanos que descrevem todo o procedimento de gravação, por exemplo: gravação iniciada, gravação finalizada e alto-falante alterado.

![fig4](informacao.png)
