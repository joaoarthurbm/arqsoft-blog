+++
title = "Documento arquitetural do Nodemailer"
date = 2021-08-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Matheus Henrique Fernandes Justino.

- Matrícula: 118111780
- Contato: matheus.justino@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/nodemailer/nodemailer

# Descrição Arquitetural -- Nodemailer

Este documento descreve parte da arquitetura do módulo [Nodemailer](https://github.com/nodemailer/nodemailer). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do Nodemailer.

## Descrição Geral sobre o Nodemailer

Nodemailer é um módulo para aplicativos Node.js que permite um envio de e-mail de forma fácil. O projeto começou em 2010, quando não havia uma opção sensata para enviar mensagens de e-mail, hoje é a solução que a maioria dos usuários de Node.js utilizam.

### Objetivo Geral

Facilitar o envio de emails utilizando os mais diversos serviços SMTP ou outros transporters como a AWS.

### Contexto

Abaixo observamos o diagrama de contexto do sistema. Nele temos como base uma aplicação Node.js na qual um cliente pode interagir

![fig1](Diagrama_de_Contexto.png)

### Containers

Abaixo, observamos o diagrama de container para a módulo Nodemailer:

![fig2](Diagrama_de_Containers.png)

O serviço em foco é o de SMTP por ser mais comumente utilizado. O módulo possui um serviço de Transporter que é usado para fazer a conexão com o SMTP
e disponibilizar as funções de envio de emails. Uma vez conectado, o transporter agora é capaz de invocar a função sendEmail que dispara o email
utilizando as credenciais previamente cadastradas na criação do Transporter, bem como o conteúdo do email.
