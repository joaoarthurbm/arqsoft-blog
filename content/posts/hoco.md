+++
title = "Arquitetura do projeto HoCo"
date = 2022-06-20
tags = []
categories = []
+++

# Autores

Esse documento foi produzido pelos alunos:
**Daniel Gomes de lima**

- Github: https://github.com/dnlgomesl
- Matrícula: 118210357;
- Contato: daniel.gomes.silva@ccc.ufcg.edu.br

**Ícaro Chagas de Almeida**

- Github: https://github.com/icaro-chagas
- Matrícula: 119210960;
- Contato: icaro.almeida@ccc.ufcg.edu.br

**Leandra de Oliveira Silva**

- Github: https://github.com/LeandraOS
- Matrícula: 120111020;
- Contato: leandra.silva@ccc.ufcg.edu.br

**Rodrigo Eloy Cavalcanti**

- Github: https://github.com/RodrigoEC
- Matrícula: 118210111;
- Contato: rodrigo.cavalcanti@ccc.ufcg.edu.br

**Projeto documentado**: https://github.com/Guardians-DSC/HoCo

# Descrição arquitetural - HoCo

Esse documento descreve o funcionamento da arquitetura do HoCo, projeto da organização estudantil `Guardians`. Essa descrição foi criada com baseada no modelo C4.

## Descrição geral sobre o HoCo

O HoCo tem como objetivo principal sanar uma deficiência conhecida no curso de Ciência da Computação na UFCG, a falta de conhecimento sobre o funcionamento de horas e atividade complementares do curso, implementando uma plataforma que trás acesso a essas informações e que facilita a avaliação das atividades complementares por parte da coordenação do curso.

# O HoCo

## Objetivo Geral

O projeto visa criar uma plataforma onde os alunos poderão fazer o gerenciamento das suas atividades complementares de forma simples e unificada, tirar suas principais dúvidas quanto ao funcionamento destas e enviar suas atividades para que esta seja analisada pelo professor responsável por isso.

## Objetivos específicos

O HoCo possuirá uma API interna com o objetivo de intermediar o acesso de dois frontends, o HoCo e o HoCo-pro, ao banco de dados onde estarão os dados dos usuários.

A plataforma do HoCo será voltada unicamente para as pessoas que são alunas do curso. Nela, o usuário conseguirá fazer o cadastro de atividades com seus certificados e em seguida envia-los para análise.

Por outro lado o HoCo-pro será voltado unicamente para que a pessoa professora possa ter acesso às atividades complementares enviadas para anaĺise e avalia-las, aprovando, desaprovando ou requisitando edições.

### Contexto

Primeiramente temos o usuário do sistema, este é um estudante do curso de Ciência da Computação na UFCG. Esse usuário é responsável por enviar os seus certificados recebidos em atividades complementares para o sistema HoCo armazenar. No sistema HoCo, esses certificados podem ser facilmente enviados para a avaliação.

 Além disso, temos a opção de visualização de como os créditos das atividades dos alunos estão distribuídos entre os vários tipos de atividades complementares, o HoCo também lista as organizações estudantis do curso que possuem atividades complementares e do mesmo modo lista dúvidas recorrentes dos estudantes. 

Como é exibido no diagrama abaixo, existe um segundo tipo de usuário, o(a) professor(a), isso porque há a implementação também web do HoCo para uso exclusivo dos professores, o HoCo-pro, onde a pessoa professora poderá fazer a avaliação das atividades complementares.

Por fim, há a API de avaliação desenvolvida pela coordenação do curso, sendo esta responsável por permitir que a avaliação e feedback das atividades complementares cadastradas sejam realizadas.

![fig1](diagrama-contexto.png)

### Containers

Como exibido no diagrama abaixo, o HoCo é composto por vários containers que compõe o sistema.

O primeiro deles, é o HoCo web que é uma aplicação que utiliza o protocolo HTTPS e que pode ser acessada pelos estudantes por meio de qualquer browser, sendo assim, ela é desenvolvida para uso em diversos dispositivos, como celular e tablets. Para isto, está sendo utilizada a biblioteca [React](https://pt-br.reactjs.org/) 
Esse container tem a responsabilidade de fazer o armazenamento, envio de certificados de atividades complementares, além de cuidar da exibição da distribuição de horas dos alunos, bem como listagens de atividades e dúvidas

Em segundo lugar, se tem o HoCo-pro que é uma aplicação também web que utiliza o protocolo HTTPS e pode ser acessada pelos professores atráves de qualquer browser, este também faz uso da biblioteca [React](https://pt-br.reactjs.org/), e tem a função de permitir a análise dos certificados de atividades complementares e envio de feedbacks.

Ambos sistemas listados acima HoCo e HoCo-pro fazem uso da API RESTful HoCo desenvolvida em Python utilizando o framework [Flask](https://flask.palletsprojects.com/en/2.1.x/). Esse container tem a responsabilidade de servir tanto as funcionalidades e fazer o agente intermediário entre o frontend e o banco de dados, tratando e processando os possíveis dados.

As operações que a API HoCo disponibiliza estão contidas na [documentação da API](https://github.com/Guardians-DSC/API-HoCo/blob/main/api.md)

Para melhor detalhamento das rotas da API HoCo 
O sistema HoCo-pro além de fazer uso da API HoCo também fará uso do container API de avaliação que será desenvolvida utilizando [Java](https://www.java.com/) e [Spring Boot](https://spring.io/projects/spring-boot) e é responsável por disponibilizar rotas para a avaliação das atividades complementares cadastradas pelos estudantes.

Por fim, existe o container Database, como é exibido no diagrama está sendo utilizado o MongoDB que é um banco de dados não relacional que armazena os dados dos estudantes, certificados de atividades complementares, imagens das organizações, dúvidas recorrentes e etc.

![fig1](diagrama-containers.png)

## Diagrama de componentes

Abaixo, é possível observar o diagrama de componentes do sistema:

![ComponentDiagram](diagrama-componentes.png)

**Nos componentes, temos:**

*Os componentes referentes à sessão de perguntas e organizações são bastante semelhantes.*

**Questions Controller e Organization Controller:** São REST Controllers do Flask que fazem o controle sobre a sessão de perguntas e de organização do HoCo, respectivamente, pois é possível que o usuário administrador cadastre dúvidas e suas respostas e organizações e comunidades existentes na graduação no HoCo, esses componentes fazem uso respectivamente dos componentes Questions Modells e Organization Modells. Ambos não precisam de login;

**Questions Models e Organization Models:** São componentes que fazem a conexão com o Banco de Dados, fazendo leitura e/ou escrita dos dados no mesmo;

**Login Controller:** Esse componente é um REST Controller do Flask que faz o controle da sessão de login, é responsável por realizar o login e logout do usuário e a restauração da senha do usuário, fazendo uso do componente Security Component;

**Security Component:** É o componente responsável por criptografar e descriptografar as senhas dos usuários, verificar se os dados de login estão corretos, verificar se o usuário tem permissão de acesso à funcionalidade solicitada pelo mesmo;

**User Controller:** É um REST Controller do Flask que provê todas as funcionalidades referentes à um usuário em específico, por isso faz uso do Security Component, pois é necessário que o usuário esteja logada para que a pessoa possa acessar funcionalidades especificas, como cadastro de atividades (Rota de acessoa 
 dúvidas e respostas, organizações e cadastro do usuário são públicas para qualquer pessoa acessar sem login), como o cadastro do usuário (não precisa de login), exclusão de conta, cadastro de atividades, exclusão de atividade, edição de perfil, aprovar atividade (precisa que o usuário tenha mais permissões, não permitindo que um aluno aprove atividades);

**User Models:** É o componenente que faz a conexão com o Banco de Dados, fazendo a leitura e escrita dos dados no mesmo;

**Atividade Service:** É o componente responsável por prover todas as funcionalidades referentes às atividades, como cadastro, cálculo de créditos, recuperação das atividades e suas informações. Esse componente também faz conexão com o Banco de Dados, fazendo a leitura e escrita dos dados no mesmo;

### Visão de Informação

A máquina de estados a seguir explicita o ciclo de vida do processo de dispensa de horas complementares proposto pelo HoCo. Para tal, inicialmente cadastra-se atividades do aluno informando o nome da atividade, os créditos obtidos na atividade, as horas equivalentes a atividade, e a categoria da atividade (tais dados são persistidos em um banco de dados). Caso algum dado necessite de alteração, efetua-se a edição dos dados (um ou mais campos de interesse). 

Em seguida, para comprovar a validade das informações fornecidas, os arquivos comprovatórios de cada atividade são carregados e enviados para a coordenação do curso para que a validação dos dados possa ser efetuada. 

Caso as informações entre os dados e os arquivos sejam compatíveis o processo de dispensa de horas é efetuado. Caso contrário, o usuário é informado de uma incompatibilidade entre as informações, e o processo é invalidado ou o ciclo deve seguir novamente a partir do estado de edição.

![figME](maquina-estados.png)

# Contribuições Concretas

Segue as PRs que foram feitas para a construção do documento acima:

- [Criação da base do documento](https://github.com/joaoarthurbm/arqsoft-blog/pull/153/commits/a7baf4f282f34534b618c8380bb3699d6a2f5150)
- [Criação da seção de descrição](https://github.com/RodrigoEC/arqsoft-blog/pull/3)
- [Criação das seções de contexto e container](https://github.com/RodrigoEC/arqsoft-blog/pull/4)
- [Criação da seção de diagramas de componente](https://github.com/RodrigoEC/arqsoft-blog/pull/1)
- [Criação da seção de visão de informação](https://github.com/RodrigoEC/arqsoft-blog/pull/2)


⚠️ Obs: As seções foram revisadas por todos os membros da equipe, onde foram feitas sugestões de melhorias. Além disso, alguns dos diagramas foram feitas em conjunto para que houvesse coerência entre os diagramas de seções diferentes.
