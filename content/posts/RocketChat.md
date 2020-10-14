
# Autores

Este documento foi produzido por Gaspar Soares de Alencar.

- Matrícula: 117110363
- Contato: gaspar.alencar@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/RocketChat/Rocket.Chat

# Descrição Arquitetural -- Serviço de chat do Rocket.chat

Este documento descreve parte da arquitetura do projeto [Rocket.chat](https://github.com/RocketChat/Rocket.Chat). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do sistema abordado. O foco aqui é a descrição de um serviço específico de análise do Rocket.chat, que é parte fundamental do projeto.


## Descrição Geral sobre o Rocket.chat

Rocket.Chat é uma plataforma de colaboração de chat em equipe de código aberto que permite aos usuários se comunicarem com segurança em tempo real em dispositivos na web, desktop ou celular e personalizar sua interface com uma variedade de plug-ins, temas e integrações com outros softwares importantes. Mais detalhes sobre o projeto podem ser vistos [neste link](https://rocket.chat/pt-br/).

## O Serviço de chat do Rocket.chat

### Objetivo Geral
Propor que o usuario comunique-se e colabore usando o bate-papo em equipe e alterne para chamadas de vídeo ou áudio com compartilhamento de tela para um trabalho mais eficiente.

Melhore a sua produtividade discutindo e compartilhando idéias, projetos e arquivos com o bate-papo em tempo real ou assíncrono.

### Objetivos Específicos

Conferência de áudio e vídeo gratuita, acesso de convidado, compartilhamento de tela, compartilhamento de arquivos, LiveChat, LDAP Group Sync, autenticação de dois fatores (2FA), criptografia E2E, SSO e dezenas de provedores OAuth, são algumas das funcionalidades e características específicas oferecidas pela RocketChat.

### Contexto

O Rocket.chat é a ferramenta mais completa de comunicação online. Suas integrações possuem um enorme potencial para fazer com que seus times ou empresas tenham uma comunicação rápida e simples. O seu alto poder de personalização e integração utilizando APIs, permite customizar a ferramenta de acordo com a necessidade de cada cliente.

Existe a possibilidade de realizar videochamadas e ainda utilizar o Rocket.chat integrado ao Telegram, WhatsApp e até mesmo ao seu Website através de um Livechat para atendimento ao público, podendo ser automatizado por Bots, como também sendo possivel integrar com as ferramentas DevOps de um ambiente de TI.



![fig1](c-context.png)



### Containers

![fig1](d.png)


RocketChat: A lógica de negócios do RocketChat permanece neste módulo. Criação de canais, grupos privados, envio de mensagens diretas usando OTR, integração com terceiros para OAuth, IRC (Internet Relay Chat) são algumas funcionalidades implementadas neste módulo.

RocketChat-lib: Este pacote contém as principais bibliotecas do RocketChat. As APIs, como configurações do RocketChat, tipos de quarto, caixa de conta, funções, métodos e publicações estão incluídos neste pacote.

Twilio SMS service: Este serviço é usado para enviar e receber mensagens SMS dentro do chat ao vivo usado no RocketChat. Ele usa o protocolo de aplicativo HTTP para comunicação. O módulo RocketChat-SMS usa a interface REST (Representational State Transfer) para se comunicar com o serviço Twilio SMS.

Meteor: Este é um módulo externo importado do framework Meteor que usa Heroku (Paas) para implantação.

Heroku: Heroku é usado para implantar o aplicativo. Ele usa o URL remoto git do aplicativo para implantação.

Underscore: É uma biblioteca JavaScript que fornece funções utilitárias para tarefas de programação comuns

Mongo: É um programa de banco de dados orientado a documentos de plataforma cruzada gratuito e de código aberto. O Mongo é classificado como um programa de banco de dados NoSQL, usa documentos do tipo JSON com esquemas. Este módulo é responsável por criar e gerenciar o banco de dados.
### Componentes

Web Service Client: O Web Service Client envia a solicitação ao servidor de autenticação (RocketChat) e renderiza a resposta.

Authentication Server: Ele fornece uma interface de serviço da Web para o sistema RocketChat, Usa o MongoDB para lidar com a autenticação do usuário. Ele suporta REST API que suporta solicitação e resposta HTTP, se conecta ao servidor de banco de dados MongoDB com um URI e envia ao Cliente de serviço da Web o status da solicitação.

MongoDB:RocketChat envia as solicitações de serviço da Web ao MongoDB para autenticar o usuário com nome de usuário e senha. Ele envia ao servidor de autenticação o status da solicitação e os dados que consistem no token de autenticação e ID do usuário.

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Os diferentes sistemas com os quais o RocketChat interage são Heroku, Meteor, conta de usuário Twilio, Mongodb, entradas de log, sublinhado, folga e HTTP. O Heroku permite que o aplicativo crie, execute e implante o modelo de aplicativo. Meteor é uma estrutura da web JavaScript de código aberto que é usada para fornecer pacotes e criar aplicativos para web, dispositivos móveis e desktops. Twilio é uma plataforma de comunicação em nuvem usada pelo RocketChat para enviar e receber mensagens SMS no chat ao vivo. A conta de usuário do Twilio é necessária para obter o ID do usuário para funcionar com o RocketChat. Mongodb é um programa de banco de dados de plataforma cruzada e de código aberto gratuito, usado pelo RocketChat para simplesmente solicitar, puxar e mostrar dados. Entradas de log, que é um serviço de gerenciamento e análise de log auto-hospedado, que é usado pelo Rocket chat para aplicativos de log. O Underscore é uma biblioteca JavaScript que fornece auxiliar de programação funcional útil sem estender nenhum objeto integrado. Ele é usado para criar uma conta de usuário pelo aplicativo. Slack é uma ferramenta colaborativa baseada em nuvem, usada para importar mensagens pelo RocketChat. HTTP é um aplicativo de código aberto que ajuda a conectar o RocketChat com o Facebook, Github e Google.

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
