+++
title = "Documentação arquitetural para o Dialetus"
date = 2021-04-30
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Almir Gonçalves Crispiniano.

- Matrícula: 117210914
- Contato: almir.crispiniano@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/dialetus/dialetus-service

# Descrição Arquitetural -- Dialetus

Este post descreve a arquitetura do projeto [Dialetus](https://github.com/dialetus). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Dialetus

O Dialetus é um plataforma que permite pesquisar diferentes sinônimos em um dicionário informal através de uma API Rest em Node.js.

### Objetivo Geral

Como possuímos um país multicultural, a aplicação tem como objetivo central permitir encontrar diferentes palavras da língua portuguesa a partir dos diferentes traços linguísticos-culturais encontrados nas cinco regiões brasileiras. Sua ideia surgiu de uma reunião de amigos que apenas se conheciam pela internet para então se tornar um projeto totalmente colaborativo, trazendo a diversidade cultural de cada um para assim possibilitar um aprofundamento na cultura cotidiana do nosso português brasileiro.

### Objetivos Específicos

Para alcançar os objetivos gerais o [Dialetus](https://dialetus.com) provê uma API Rest codificada em Node.js com um database local formado por jsons e uma lista de svgs que representam as bandeiras dos estados. Com a aplicação é possível buscar dialetos de maneira geral e também por regiões. Seus diferentes endpoints utilizam o método GET e sua implementação encontra-se no heroku.app. O frontend da aplicação foi desenvolvido utilizando React.

### Contexto

O Dialetus realiza requisições a uma API externa utilizando métodos HTTP. Essas requisições chegam em um banco de dados, mockado, formado por JSONs e divididos por estados, que possuem uma lista de objetos que referenciam um dialeto. A API é responsável por fornecer as rotas e manipular os dados. Todas as suas respostas retornadas, são codificadas como JSON. 

![fig1](context.png)

### Containers

O frontend do Dialetus foi implementado utilizando a biblioteca React.js. Construído em uma Single Page Application, suas responsabilidades são renderizar o html da página e provê uma interface web que permite visualizar e pesquisar diferentes dialetos. Além disso, é possível realizar requisições HTTP através utilizando métodos await/fetch para o consumo das rotas da API Rest.

O Dialetus Service, backend da aplicação, foi implementado em Node.js e hospedado no heroku.app, sua principal responsabilidade é permitir a criação de rotas que definem uma API Rest para consumo dos dados pelo frontend.

Banco de dados: O database da aplicação é local/mockado. Formado por uma lista de JSONS que formam um objeto correspondente ao dialeto pesquisado.

Estrutura do dialect object: 

![fig2](dialeto.png)

Os principais endpoints fornecidos pela API são: 

- GET /search?q={words}, retorna todos os dialetos de acordo com as palavras pesquisadas.
- GET /regions, lista todas as regiões disponíveis na aplicação, junto ao total de dialetos mapeados.
- GET /regions/:region/dialects, retorna todos os dialetos de uma região.

![fig3](containers.jpg)

### Componentes

No diagrama de componentes podemos dividir o Dialetus em 3 partes: Frontend (Dialetus), Backend (Dialetus Service) e Express.

Frontend: Responsável por estruturar os componentes da aplicação e realizar o consumo da API. É dividido em módulos:

- Single Page Application: Responsável por gerar a representação gráfica do sistema, ou seja, todo HTML que será consumido pelo Browser.
- Pages: Responsável por criar componentes genéricos que auxiliam na criação da página principal do projeto e utilizar código assíncrono (await/fetch) para consumir a API.
- Hooks: Funções que permitem gerenciar o estado e ciclo de vida dos componentes.
- Layout: Responsável por exportar os estilos dos componentes em arquivos TypeScript
- Styles: Responsável por definir o estilo global da aplicação como font-family, font-size, color e background-color.
- Helpers: Possui um dicionário de estados para associar um dileto a uma região e permite a renderização de componentes com os temas dos styles. 
- Componentes: Responsável por agrupar todos os componentes que ajudam a criar a página como card, footer, header, input e regions. 

Backend : Define um conjunto de rotinas e padrões, utilizando a arquitetura REST para permitir a manipulação e acesso dos dados. É dividido em módulos:

- routers: Pasta que define as rotas da api utilizando o express.js e se comunica com os controllers da aplicação. 
- middleware: Utiliza o Mongo-sanitizer, responsável pela proteção da aplicação, não permitindo que scripts maliciosos sejam adicionados durante a pesquisa por dialetos. 
- helpers: Pasta responsável por agrupar funções essenciais para utilizar a api a exemplo do strings.js, que é uma função que normaliza uma palavra para pesquisa, possuindo um regex que remove acentos e caracteres especiais da mesma. O arquvio Dialeact.js possui as funções essenciais para funcionamento da api que vão de funções que encontr,r um dialeto por região, a uma função search que normaliza cada resultado e retorna uma lista de dialetos que são parecidos ou iguais a palavra inputada pelo usuario
- controllers: criar módulos que consultam o database interno e passam por funções definidas nos helpers para fazer o consumo da API. Todas as requisições e respostas feitas na api são no formato JSON. As mensagens de erro são formatadas no mesmo formato.
- database: Banco de dados local que contém duas pastas, a primeira com o arquivo json corresponde a cada estado com uma lista de objetos que compõem um dialeto como o próprio dialeto, com uma lista de exemplos e outra de significados. A segunda pasta possui diversos svgs com as bandeiras de cada estado braisleiro

Express: Framework que otimiza a construção de aplicações web e APIs, além de gerenciar requisições de diferentes verbos HTTP.
- body-parser: Módulo do Express que analisa os dados codificados em JSON extraindo toda a parte do corpo do fluxo de solicitação de entrada, que foram enviados usando o HTTP POST.

![fig4](components.jpg)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

A máquina de estados a seguir mostra o estado da informação quando um usuário acessa o dialetus.

![fig5](info.png)