+++
title = "Projeto Eureca - Da coleta de dados ao backend"
date = 2019-10-28
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Paulo Mendes da Silva Júnior.

- Matrícula: 117210922
- Contato: paulo.junior@ccc.ufcg.edu.br
- Projetos documentados: </br>
  https://github.com/computacao-ufcg/eureca-coleta-de-dados </br>
  https://github.com/computacao-ufcg/eureca-backend

# Descrição Arquitetural -- Projeto Eureca (Coleta de dados ao backend)

Este documento descreve parte da arquitetura de uma parte do projeto **Eureca** ([Coleta de dados](https://github.com/computacao-ufcg/eureca-coleta-de-dados) e [Backend](https://github.com/computacao-ufcg/eureca-backend)). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição geral sobre o Eureca (da coleta de dados ao backend)

O projeto **Eureca** se trata de um projeto da coordenação do curso de Computação@UFCG, projeto ao qual eu estou vinculado, que tem a finalidade de auxiliar a coordenação do curso em suas ações a curto e longo prazo. Com funcionalidades de monitoramento, estatísticas, comunicação e serviços que englobam todos os alunos do curso de Computação na UFCG.

## Eureca (da coleta de dados ao backend)

### Objetivo geral

Prover uma interface de monitoramento para a coordenação do curso, que possua informações sobre como os alunos estão se comportando de acordo com o período aos quais se encontram, em relação as suas notas, presenças e demais especificidades. Essas informações são divididas em quatro grandes blocos: Monitoramento, Estatísticas, Comunicação e Serviços.

### Objetivos Específicos

Queremos que o coordenador seja capaz, de por exemplo, fazer um acompanhamento mais direto com aqueles alunos que se encontram em situações críticas. Além de observar também os que se encontram "Acima da média" e também os regulares. O sistema também irá possuir serviços de estatísticas sobre todos os alunos que já passaram pelo curso, sejam eles graduados, ativos ou evadidos.

### Contexto

O sistema inicia se comunicando com o sistema de controle acadêmico online, e através de um crawler são baixadas várias página .html por aluno, que são as de cadastro, histórico, faltas, notas, etc. Essas páginas são processadas por parsers, que filtram os dados necessários que estão nas páginas, esses dados então são formatados e por fim, retornados na saída padrão. Logo após scripts shell fazem a separação dos dados adicionado os relacionamentos e separando os dados em arquivos .csv que correspondem aos dados que serão inseridos em cada tabela do banco de dados.
Com o banco de dados populado, o eureca-backend (API REST) o acessa através de queries SQL e o banco de dados retorna respostas JSON para o backend.

Logo abaixo temos o diagrama de contexto referente a parte de coleta de dados e backend do projeto.

![fig1](diagrama_contexto.png)

### Containers

![fig2](diagrama_container.png)

### Componentes

### Código

### Visão de informação

### Contribuições concretas