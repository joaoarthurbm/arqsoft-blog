
# Autores

Este documento foi produzido por:

Matheus Forlán Bezerra Andrade.
- Matrícula: 119110409
- Contato: matheus.andrade@ccc.ufcg.edu.br

Thiago da Costa Lira.
- Matrícula: 119110510
- Contato: thiago.lira@ccc.ufcg.edu.br

José Ricardo Galdino Felix.
- Matrícula: 119111098
- Contato: jose.felix@ccc.ufcg.edu.br

Kleberson John Santos de Maria.
- Matrícula: 119111434
- Contato: kleberson.maria@ccc.ufcg.edu.br


- Projeto documentado: https://github.com/signalapp

## Descrição Geral sobre o Signal

Signal é um aplicativo open source multiplataforma de comunicação criptografada de ponta a ponta para Android e iOS. Seguindo altos padrões de privacidade e segurança, ele usa TCP/IP (Internet) para enviar mensagens individuais ou em grupo, que, por sua vez, podem ser constituídas de textos, arquivos, notas de voz, imagens e vídeos, além de ser possível realizar chamadas de voz e vídeo entre duas pessoas.

## Descrição Arquitetural – Signal Android

Este documento descreve parte da arquitetura do projeto Signal. Essa descrição foi baseada principalmente no modelo C4.
É importante destacar que não será descrita toda a arquitetura do Signal. Essa descrição arquitetural se concentra apenas no cliente Android.

## Objetivos específicos

O aplicativo propõe um serviço de troca de mensagens e ligações focado na segurança do usuário utilizando criptografia de ponta a ponta.


### Contexto

![Diagrama de contexto](https://github.com/matheusforlan/arqsoft-blog/blob/matheus.andrade/content/posts/signal/Context.png)

Temos acima  o diagrama de  contexto do aplicativo Signal Android, o qual o usuário pode enviar mensagens e fazer ligações individuais ou em grupo. Para se comunicar com o Signal Server, é acionado o serviço de nuvem Amazon Route 53  que faz uma pesquisa de DNS do Signal Server e retorna uma lista com os Signal Servers disponíveis mais adequados. O Signal utiliza o Signal Protocol para criptografar mensagens e o webRTC para configurar um canal de streaming de vídeo/voz criptografado. O Signal Server empurra pacotes para frente e para trás entre os clientes conectados (gerenciando os usuários, enviando mensagens e estabelecendo conexão entre os usuários nas ligações), além de usar o Firebase Cloud Messaging para enviar notificações de mensagens e chamadas para o usuário que está recebendo.



### Containers

![Diagrama de container](https://github.com/matheusforlan/arqsoft-blog/blob/matheus.andrade/content/posts/signal/Conatiners.png)

Como mostra o diagrama acima, temos basicamente 4 containers: aplicações, Signal-server, Signal Protocol e Database.
	Aplicações: existem 3 tipos de aplicações, o Signal Desktop desenvolvido em TypeScript, que seria a versão Web do Signal; o Signal Android que seria a aplicação mobile para a plataforma Android desenvolvida em Java; e Signal IOS que seria a aplicação mobile para a plataforma da Apple e desenvolvida em Swift e Objective-C.
Signal-Server: o Signal Server fornece serviços de comutação para clientes. Como as redes de dados móveis geralmente usam NAT, é necessário um switch para estabelecer um canal de comunicação entre dois clientes móveis. O switch atuará como um servidor TURN básico, empurrando pacotes para frente e para trás entre os clientes conectados.
Signal Protocol: Protocolo para troca de mensagens síncronas e assíncronas criptografadas e seguras.
Database: O banco de dados (SQLite) armazena o número de telefone do usuário registrado criptografado e os dados do perfil. Por motivos de privacidade, é armazenado apenas os dados mínimos necessários dos usuários e implementa técnicas como chave de perfil para garantir que apenas usuários autorizados possam acessar os dados.

### Componentes

![Diagrama de componentes](https://github.com/matheusforlan/arqsoft-blog/blob/matheus.andrade/content/posts/signal/Components.png)

O aplicativo para Android  possui diversos componentes que podem ser divididos em grupos específicos:

Aplicação: todos os componentes de UI e notificações que interagem com o usuário.

Jobs: Como o app é em sua maior parte assíncrono, as principais atividades de envio e recebimento de mensagens são lidas como tarefas a serem realizadas em um momento futuro, agendado pelo Manager

Services: A parte que interage com o banco de dados, interfaces e outros componentes externos necessários para o funcionamento do app.
Cada grupo de componentes exercem funções bem definidas, como camadas da aplicação. Vamo fazer aqui uma listagem dos principais componentes: 

UI logic: encapsula toda  a lógica do front-end do app, isso inclui mini componentes como perfil de usuário, registramento de novos usuários, gerenciadores de mensagem e conversas,contatos, além do WebRTC para chamadas(que nesse caso, deve ser síncrono)

Receivers:  a parte de comunicação do app, que se liga ao framework do android, agindo como intermediário entre o signal server o Google Cloud Messaging. Permite as notificações push.

Jobs: são a forma como app lida com assincronismo. São tarefas curtas para serem realizadas em algum momento, gerenciadas pelo Job Manager. Podem ser criados por atividades ou receptores.

Job Manager: gerencia e escalona os  jobs, em threads no background.

Communication:  serviço que gerencia as tarefas de rede para as atividades de voz e mensagem.

Cryptography: A parte que lida com a segurança dos dados transmitidos. Lida Com a geração e gerenciamento de chaves de segurança,  e a criptografia ponta a ponta no dados, tanto encriptando como decriptando

Persistence: Lida com as operações de leitura e escrita, dentro da memória local do celular.

Hardware Controller: Parte que permite que o app tenha acesso ao hardware do smartphone, como microfone e câmera.


### Informação

![Diagrama de informação](https://github.com/matheusforlan/arqsoft-blog/blob/matheus.andrade/content/posts/signal/Information-View.png)

Conforme ilustrado no diagrama acima, o fluxo da informação se inicia a partir do momento em que o usuário começa a digitar em seu teclado virtual, no qual a mensagem é tratada internamente como um rascunho e, este por sua vez, é sempre anexado a uma conversa específica e pode ser editado.
Já quando o remetente clica no botão para enviar mensagem, a mesma passa para o status de mensagem composta, e com isso não pode ser modificada. Vale salientar que nesse instante, a mensagem ainda não foi transmitida.
Após esse passo, a mensagem é criptografada e enviada aos servidores do Signal, onde ao chegar, o destinatário é notificado sobre a existência de uma nova mensagem endereçada ao mesmo. Ele, então, pesquisa por novas mensagens nos servidores do Signal, recupera a mensagem enviada e a descriptografa em uma mensagem legível. Essa transição também aciona um som e/ou vibração no telefone para notificar o usuário alvo da mensagem recém-chegada.
Por fim, o destinatário abre a sua aplicação para ler a mensagem, que passa a ter o status como “lida”, informação que pode ser visualizada pelo remetente da mensagem. 
