+++
title = "Documentação arquitetural do Jenkins"
date = 2020-10-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Cássio Cordeiro.

- Matrícula: 116210038
- Contato: cassio.cordeiro@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/jenkinsci/jenkins

# Jenkins

Este documento descreve parte da arquitetura do [Jenkins](https://github.com/jenkinsci/jenkins). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição

O Jenkins é projeto focado em ser expansível às necessidades dos usuários, contendo um vasto acervo de plugins criados e permitindo configurações personalizadas, suas principais usos são para atividades de  CI (continuous integration) e CD (continuous delivery). Ele automatiza as partes do processo de desenvolvimento de software relacionadas ao build, testes, deploy e entrega. Outras informações podem ser encontradas no site oficial do sistema. 

### Objetivos
Oferecer um serviço que seja customizável e expansível aos requisitos dos projetos e de cada usuário, automatizando tarefas repetitivas no processo de desenvolvimento de software.

### Contexto

Os principais sistemas que o Jenkins se comunica são seus plugins, que quando instalados, acrescentam mais funcionalidades ao sistema e a possibilidade de comunicação com outros sistemas; o Git, podendo realizar processos com projetos hospedados nele; e serviços de comunicação, sendo capaz de enviar mensagens, contento, principalmente, o resultado de operações de build.

![fig1](contexto.png)

### Containers

O sistema é composto basicamente por dois containers: a interface web e a aplicação (API). O primeiro, possibilita interação com o usuário, é feito usando Jelly e renderizado do lado do servidor. Já o segundo, gerencia toda a parte de projetos, de dados e comunicação externa.

![fig2](containers.png)

Abaixo estão alguns exemplos de como são processados os paths:
- Get: /log/… &rarr; Jenkins#getLog()
    * Busca o arquivo log do sistema.
- Get com argumentos: /job/foo/… &rarr; Hudson#getJob(“foo”)
    * Busca um job chamado foo.
- Get dinâmico: /job/foo/1/… &rarr; Job#getDynamic(“1” ...)
    * Busca o build 1 do job foo.
- Método de ação: /job/foo/1/artifact &rarr; Run#doArtifact(...)
    * Executa o método doArtifact no build 1 do job foo.

Quanto à implantação, o Jenkins pode ser instalado em qualquer máquina. Ele possui compatibilidade com os principais sistemas operacionais, Linux, MacOS e Windows, além de poder ser instalado usando o Docker ou na nuvem.

### Componentes

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig7](c4-componentes.png)

### Visão de Informação

Aqui você deve descrever as informações importantes que são coletadas, manipuladas, armazenadas e distribuídas pelo sistema. Você não precisa descrever todas as informações, somente uma parte que seja essencial para o sistema. Por exemplo, se eu estivesse tratando do instagram, faria algo relacionado aos posts.

Além da descrição gostaria de ver aqui um diagrama para descrever os estados (ex: máquina de estados) de uma informação de acordo com as ações do sistema.

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
