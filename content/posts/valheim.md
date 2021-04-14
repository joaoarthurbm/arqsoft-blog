# Documentação arquitetural para o Valheim Dedicated Server


# Autores

Este documento foi produzido por André Filipe Queiroz.

- Matrícula: 116210818
- Contato: andre.soares@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/lloesche/valheim-server-docker

# Descrição Arquitetural -- Servidores Dedicados para Valheim


Este documento foi produzido para a disciplina de Arquitetura de Software da UFCG, descrevendo parte da arquitetura do projeto [Valheim Server Docker](https://github.com/lloesche/valheim-server-docker) e usando como descrição principalmente o modelo [C4](https://c4model.com/).


## Descrição Geral sobre o Valheim Server Docker

O Valheim Server Docker é um projeto Open-Source que permite ao usuário configurar como desejar um servidor dedicado no jogo eletrônico Valheim, utilizando comandos via terminal.

## Servidores Dedicados para o Valheim Utilizando Docker

### Objetivo Geral

Implementar  e configurar com o auxílio da plataforma Docker permitindo um processo repetível e configurável para gerenciar a execução de servidor(es) dedicado(es) para o jogo Valheim.

### Objetivos Específicos

Valheim tem hospedagem “peer-to-peer”, mas se o host se desconectar, o mundo não estará mais acessível a ninguém e todos os outros serão removidos do mundo. Hospedar um servidor Valheim dedicado resolve isso sendo acessível 24 horas por dia e 7 dias por semana, para que seus amigos possam jogar mesmo se você não estiver online, tornando a experiência ainda melhor.
Além disso, se precisarmos atualizar o servidor, simplesmente o reconstruiremos em um único comando com o Docker. Como um contêiner do Docker, o servidor pode ser executado em qualquer computador que também execute o Docker. Isso significa que é fácil mover o servidor para outro computador, se necessário.

