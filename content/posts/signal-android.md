+++
title = "Documentação da arquitetura do aplicativo para android Signal"
date = 2021-07-30
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Ezequias de Oliveira Rocha.
- Matrícula: 118110753
- Contato: ezequias.rocha@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/signalapp/Signal-Android


# Descrição Arquitetural -- Signal Android

Este documento descreve parte da arquitetura do aplicativo para android [Signal](https://github.com/signalapp/Signal-Android). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o aplicativo Signal

Signal é um aplicativo de mensagens para comunicação privada simples com amigos.

O Signal usa a conexão de dados do seu telefone (WiFi/3G/4G) para se comunicar com segurança, opcionalmente suporta SMS/MMS simples para funcionar como um mensageiro unificado e também pode criptografar as mensagens armazenadas no seu telefone.
