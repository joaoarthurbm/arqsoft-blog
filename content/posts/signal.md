
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

### Conatiners

![Diagrama de container](https://github.com/matheusforlan/arqsoft-blog/blob/matheus.andrade/content/posts/signal/Conatiners.png)

Como mostra o diagrama acima, temos basicamente 4 containers: aplicações, Signal-server, Signal Protocol e Database.
	Aplicações: existem 3 tipos de aplicações, o Signal Desktop desenvolvido em TypeScript, que seria a versão Web do Signal; o Signal Android que seria a aplicação mobile para a plataforma Android desenvolvida em Java; e Signal IOS que seria a aplicação mobile para a plataforma da Apple e desenvolvida em Swift e Objective-C.
Signal-Server: o Signal Server fornece serviços de comutação para clientes. Como as redes de dados móveis geralmente usam NAT, é necessário um switch para estabelecer um canal de comunicação entre dois clientes móveis. O switch atuará como um servidor TURN básico, empurrando pacotes para frente e para trás entre os clientes conectados.
Signal Protocol: Protocolo para troca de mensagens síncronas e assíncronas criptografadas e seguras.
Database: O banco de dados (SQLite) armazena o número de telefone do usuário registrado criptografado e os dados do perfil. Por motivos de privacidade, é armazenado apenas os dados mínimos necessários dos usuários e implementa técnicas como chave de perfil para garantir que apenas usuários autorizados possam acessar os dados.
