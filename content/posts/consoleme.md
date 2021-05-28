+++
title = "Descrição Arquitetural do ConsoleMe"
date = 2021-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Marcus Antonio Rocha Tenorio.

- Matrícula: 117211155
- Contato: marcus.tenorio@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Netflix/consoleme

# Descrição Arquitetural -- ConsoleMe

Este documento descreve a arquitetura do framework [ConsoleMe](https://github.com/Netflix/consoleme). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).


## Descrição Geral do Bento

O ConsoleMe tem como objetivo facilitar o gerenciamento de credenciais e as permissões do AWS IAM para usuários finais e administradores de nuvem.

Os administradores de nuvem podem criar / clonar papéis IAM e gerenciar papéis IAM, Buckets S3, filas SQS e tópicos SNS em centenas de contas em uma única interface.

Os usuários podem acessar a maioria dos seus recursos de nuvem no AWS Console com um único clique. Os administradores de nuvem podem configurar o ConsoleMe para autenticar usuários por meio da autenticação ALB, OIDC / OAuth2 ou SAML.
