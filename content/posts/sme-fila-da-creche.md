+++
title = "Fila da Creche - Documento arquitetural"
date = 2020-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Mateus de Lima Oliveira.

- Matrícula: 117110219
- Contato: mateus.oliveira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/prefeiturasp/SME-FilaDaCreche

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [Fila de Creche](https://github.com/prefeiturasp/SME-FilaDaCreche). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).
É importante destacar que este documento visa expor de forma mais abstrata como funciona o conjunto de ferramentas da aplicação e não necessariamente explicará em detalhes a sua implementação.


## Descrição Geral sobre o Fila de Creche

O Fila da Creche é um projeto com iniciativa da Secretaria Municipal de Educação de São Paulo que busca facilitar o acompanhamento de geração de vagas na educação infantil de acordo com localização e faixa etária informadas. Mais detahes sobre o projeto podem ser vistos [nesse link](https://educacao.sme.prefeitura.sp.gov.br/entenda-como-funciona-a-plataforma-vaga-na-creche/).


### Objetivo Geral

Implementar, com transparência ativa, em linguagem simples e com acessibilidade digital, uma ferramenta para que os pais e famílias possam se programar e acompanhar a geração de vagas na educação infantil pela Secretaria Municipal de Educação de São Paulo.

### Objetivos Específicos

Permitir que a qualquer pessoa saber como está a espera por atendimento nos Centros de Educação Infantil (CEIs), de acordo com o endereço fornecido e a faixa etária informada. Ela pode ser acessada por qualquer dispositivo móvel (como celular) ou computador com acesso à internet, sem precisar de instalação (download), assim evitando desinformações e locomoção dos responsáveis. 

### Contexto

Como vemos no diagrama abaixo, o Fila da Creche é composto pelo frontend e uma API que fornece acessa os dados disponíveis em uma base de dados das matrículas na cidade de São Paulo, que são requisitados utilizando o protocolo HTTP.
De modo geral, o sistema funciona como um facilitador, entre o usuário e as bases de dados citadas, em que simplifica e filtra a obtenção de determinada informação de acordo com as informações passadas.

<div align="center" style="margin: 2rem 0;">
    <img src="fig1-contexto.png">
    <span style="display:block;">
        Visão da informação do Dispatch
    </span>
</div>


### Containers

O Fila da Creche é composto pelos três containers que serão descritos a seguir.

O primeiro deles é a Web Page, feita em React, que é responsável por pela interação com os usúarios do sistema e pela representação gráfica do sistema, ou seja, todo o HTML que o browser irá interpretar e renderizar para o usuário final. 

O Banco de Dados é o container responsável por armazenar, de forma estruturada, todas as informações extraídas por meio do Airflow do banco de dados do Sistema Escola Online - EOL, onde tem as informações sobre o sistema de matricula múnicipal. Ele foi implementado em PostgreSQL e outros containers utilizam Psycopg.

O container API, é um conjunto de rotinas e padrões de programação para acesso das bases de dados do Fila da Creche. Ela foi implementada em Python juntamente com o framework Flask. Foram utilizados padrões REST e o acesso a esta API se dá por meio de requisições HTTP em formato JSON. Alguns dos endpoints disponíveis estão descritos a seguir.

**GET** /v1/schools/radius/<string:lon>/<string:lat>'

Descrição: Retorna as escolas/creches em um raio de distância (1,5 KM) do ponto passado pela latitude **(lat)** e longitude **(lon)**.

**GET** /v1/schools/radius/wait/<string:lon>/<string:lat>/<int:groupCode>'

Descrição: Retorna as escolas/creches em um raio de distância (1,5 KM) do ponto passado pela latitude **(lat)** e longitude **(lon)** com o tamanho das filas de espera para matrículas baseado no grupo da criança (definido a partir da idade). 

O diagrama apresentado abaixo descreve os containers que compõem o Fila de Creche.

<div align="center" style="margin: 2rem 0;">
    <img src="fig2-containers.png">
    <span style="display:block;">
        Visão da informação do Dispatch
    </span>
</div>

### Componentes

A fim de detalhamento, podemos dividir o container Frontend outros dois componentes: Utils e Pages.

O componente Utils, que usa Javascript, é composto por ações de verificação de registros, responsabilidade de fazer requests a API e calculos internos que são utilizados em páginas HTML, compondo de forma fragmentada, funcionalidades para interação do usuário no sistema. Pages, que usa React, faaz o recebimento dos dados dos usuários e fornece os dados solicitados sobre as vagas e creches em mapas. 
Outro componente incluido para maior detalhamento é o Airflow, que contém DAGs (Directed Acyclic Graph) internas para trazer dados de do banco de dados municipal para o do Fila da Creche. 

Logo abaixo, temos o diagrama de componentes para o Fila da Creche:

<div align="center" style="margin: 2rem 0;">
    <img src="fig3-componentes.png">
    <span style="display:block;">
        Visão da informação do Dispatch
    </span>
</div>

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Como sabemos, a principal funcionalidade do projeto Fila da Creche é apresentar informações sobre o preenchimento de vagas em creches de São Paulo. Dessa forma, nesta seção abordaremos de maneira simplificada, o percurso habitual que os usuários percorrem na busca das informações disponibilizadas pela aplicação em estudo.

Na página inicial, o usuário se encontra uma breve apresentação da plataforma e, logo em seguida, duas caixas de seleção para mês e ano de nascimento da criança e um campo para digitar a rua e número de residência. A contulta pose ser feita quando os três campos forem preenchidos.

Após ser clicado no botão de consultar, é feito o recebimento dos dados e ,se bem-sucedida, mostrada as informações ao usuário, que pode voltar a página inicial e refazer a consulta. Caso o recebimento de dados não seja de sucesso, como por exemplo ocorra algum problema com conexão/internet, a mesma página de sucesso é exibida porém sem nenhum dos dados de vagas e creches requisitados.


Vejamos abaixo, uma máquina de estados que ilustra fluxo da informação da aplicação estudada, para principais interações de um usuário:

<div align="center" style="margin: 2rem 0;">
    <img src="fig4-estados.png">
    <span style="display:block;">
        Visão da informação do Dispatch
    </span>
</div>
