+++
title = "Documentação Arquitetural do Apache Airflow"
date = 2021-08-15
tags = []
categories = []
+++

***
Nesse documento será descrita a arquitetura do projeto [Apache Airflow](https://airflow.apache.org), utilizando o modelo [C4](https://c4model.com/).
***

# Autores

Este documento foi produzido por Débora Lêda de Lucena Souza.

- Matrícula: 119111051
- Contato: debora.souza@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/apache/airflow

# Descrição Arquitetural - Apache Airflow

Apache airflow é uma plataforma que permite programaticamente a criação, execução e monitoramento de scripts de processamento de dados. Um script de processamento de dados é a unidade básica de execução no Airflow e é denominado `Task`. No Airflow, as `tasks` são organizadas em uma estrutura de dados chamada `DAG` (Directed Acyclic Graph).

`DAG` é o conceito central do sistema, essa estrutura armazena um conjunto de `tasks` organizadas com suas dependências e relacionamentos que informam como e em qual ordem elas devem ser executadas. 

Abaixo segue um exemplo de `DAG`

<img class="center" src="basic-dag.png" style="width:40%">

No diagrama estão definidas 4 `tasks`, A, B, C e D, as arestas informam a ordem em que devem ser executadas e as dependências entre elas.

`DAG` em si não se importa com qual é a responsabilidade de cada `task`, trata-se apenas de como exectuá-las, a ordem de execução, frequência de execução, tempo limite para execução, etc. Em contrapartida, o corpo de uma `task` descreve o que deve ser feito, seja buscar dados em um sistema externo, executar análises de dados, despertar ações em outros sistemas, etc.

## Contexto

<img src="diagrama-contexto.png"
     alt="diagrama contexto img" />

No diagrama de contexto é apresentado como se dá a interação dos demais elementos com o Airflow.

Primeiramente temos o usuário do sistema, ele é responsável por criar e cadastrar os `DAGs` de seu interesse, além de agendar e monitorar a execução deles quando necessário. O Airlow disponibiliza diversas funcionalidades para que o usuário monitore a execução de `DAGs`, sendo assim, é possível visualizar desde o código de cada `task`, até o diagrama de Gantt com a duração do seu tempo de execução.

Como é exibido no diagrama, o Aiflow também se comunica com o sistema de e-mail. Acontece que o usuário pode solicitar o recebimento de notificações a respeito das execuções dos seus `DAGs` ou especificamente de uma `task`, esses e-mails podem, por exemplo, ser enviados quando a execução de uma `task` falha inúmeras vezes ou a execução de um `DAG` por completo não foi bem sucedida.

Por fim, existem os plugins para permitir a integração de funcionalidades ao Airflow. Desde `macros` até `web views` podem ser integrados e disponibilizados para o uso. Uma vez que o Airflow é um sistema muito generalista, utilizar plugins é uma maneira de personalizar e especificar as funcionalidades da ferramenta, além disso, ela possui vários componentes que podem ser reutilizados na construção de outros aplicativos.

## Containers

O Airflow é uma plataforma gerenalista e por isso foi desenvolvida para se adequar aos diversos cenários de uso. Sendo assim, o Airflow pode ser executado de forma simples com seus módulos e configurações padrões, mas essa opção não proporciona todo o poder de processamento. No entanto, é possível utilizar configurações de maior complexidade para suportar subsistemas mais robustos, com maior capacidade de processamento e suporte a paralelismo.

A documentação do sistema deixa explícito que o setup de execução deve depender das necessidades do usuário, mas também disponibiliza um setup default que entrega ao usuário todas as funcionalidades da ferramenta mas que ainda pode ser escalado se for necessário. Sendo assim, os containers do setup default serão explorados nesse post.

<img class="center" src="diagrama-containers.png" style="width:100%">

Como é possível visualizar no diagrama, o Airflow é composto por vários containers que executam de forma independente.

O primeiro deles, é o `Web Server`, construído em `Python` utilizando o frameworker `Flask` e o servidor web `Gunicorn`. Esse container tem a responsabilidade de servir tanto as `views` da interface web, como a `API` que se comunica com o banco de dados.

A interface web disponibiliza uma série de funcionalidades pra gerenciar as `tasks`, solicitar dados do BD, monitorar e até iniciar a execução de `tasks`.

As funcionalidades de monitoramento são atualizadas em tempo real de acordo com a execução das `tasks`. A partir da interface é possível visualizar todos os `DAGs` registrados, a representação em forma de árvore de um `DAG` ao longo do tempo de execução, estado de execução atual de um `DAG`, estatísticas do tempo de execução de uma `task`, etc. Além disso, o usuário pode ativar o recebimento de notificações a respeito das execuções de `tasks` por email, como dito no tópico Contexto.

Algumas das principais operações que a API disponibiliza são:

Recupera a lista de metadados das execuções de um `DAG` específico 

```
GET /dags/<dag_id>/dag_runs
```

Inicia a execução de um `DAG`

```
POST /dags/<dag_id>/dag_runs
```

Recupera um JSON com todas as variávies de uma task

```
GET /dags/<dag_id>/tasks/<task_id>
```

Exclui todos os metadados do BD relacionados à um `DAG`

```
DELETE /dags/<dag_id>
```

`Scheduler` é outro container presente no Airflow, tem como responsabilidade principal monitorar todas as `tasks` e `DAGs`, e enviá-las para a fila de execução quando suas dependências são concluídas. No setup padrão, também tem a responsabilidade de executar `tasks`.

Mais especificamente, o `Scheduler` é um processo multi-thread iniciado via CLI que monitora e permanece sincronizado com o BD, ou seja, periodicamente checa o BD e altera o estado daquelas tarefas que possuem suas dependências concluídas, essa mudança de estado informa que as tarefas estão prontas para serem executadas. O intervalo de checagem do BD é setado pelo usuário nas configurações de um `DAG`, podendo ser completamente personalizado.

Apesar do `Scheduler` existir, o usuário também pode alterar o estado de uma tarefa via interface gráfica.

Observe que o `Scheduler` tem como responsabilidade principal apenas alocar as tarefas para serem executadas mas não por executá-las diretamente. No setup default do Aiflow, o módulo de execução de tarefas, chamado `Executor`, é um subcomponente do `Scheduler` e por isso ele e suas funcionalidades serão abordadas no tópico Componentes. 

Esses dois componentes, `Scheduler` e `Executor`, têm responsabilidades distintas e bem definidas, mas no setup default convivem no mesmo container como um único serviço apenas para simplificar o sistema. No entanto, em contextos mais complexos, o `Executor` pode ser implantado como outro serviço.

Por fim, existe o container `Database`, ou como é chamado na documentação, `Metadata Database`, é utilizado pelo `Web Server` e `Scheduler` para armazenar todos os metadados das `tasks` e `DAGs`. Como é exibido no diagrama, é um banco de dados relacional e além de armazenar metadados, também armazena dados dos usuários, variáveis de conexões e variáveis do sistema.

## Componentes

<img class="center" src="diagrama-componentes.png" style="width:100%">

Como é possível visualizar no diagrama de componentes, cada container tem seus componentes com responsabilidades bem definidas.

Começando com o container `Web Server`, ele possui 7 componentes independentes que interagem entre si para fornecer suas funcionalidades ao usuário. 

O usuário interage diretamente com o componente `Web page API`, que tem como responsabilidade servir as páginas da interface web.

O Airflow é conhecido por possuir uma rica interface, com suporte a diversas visualizações gráficas de seus `DAGs`, por isso, `Web Page API` se comunica diretamente com o `Componente de charts`, responsável por criar os gráficos que integram as páginas web, os gráficos são gerados utilizando a biblioteca nvD3.

Além disso, para que a `Web Page API` acesse o banco de dados, ele utiliza a `API Rest`, que em conjunto com o `Controlador de dados`, é responsável por buscar e criar dados a respeito das `tasks` e `DAGs`.

Existe também o componente `Gerenciador de segurança`, que em conjunto com `Gerenciador de usuário`, é responsável por gerenciar todas as autenticações e autorizações da aplicação. 

Para finalizar, o `Gerenciador de plugins` é responsável por adicionar novas funcionalidades à aplicação.

O outro container, `Scheduler`, possui 3 componentes. O principal deles, o `Escalonador de tasks`, em conjunto com o `Controlador de dados`, é responsável por monitorar o Banco de Dados e alterar o estado de `tasks` quando elas estão prontas para serem executadas. Além disso, é responsabilidade desse componente enviar um sinal para que o `Executor` inicie seu trabalho.

O `Executor` tem como responsabilidade executar `tasks`. Esse componente, também utiliza o `Controlador de dados`, pois é sua responsabilidade ao finalizar a execução de uma `task` alterar o estado da mesma, seja este `failed`, `success`, `retry`, etc.

## Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

## Visão de informação

Como já foi abordado nesse post, o Airflow possui dois dados principais, `DAGs` e `Tasks`, nesse tópico será abordado o diagrama dinâmico de uma `task`, uma vez que os estados de um `DAG` gira em torno dos estados de suas `tasks`.

<img class="center" src="diagrama-info.png" style="width:100%">

O diagrama ilustra os principais estados que uma `task` pode atingir. Uma vez que tanto o `Web server` como o `Scheduler` podem alterar o estado de uma `task`, é importante detalhar qual módulo é reponsável pela transição de cada estado.

Ao ser criado um `DAG`, o `Web server` é responsável por alterar o estado de todas as suas `tasks` para `None`.

O `Scheduler` é responsável por alterar o estado das `tasks` que estão prontas para serem executadas para `Scheduled`. Além disso, ao enviá-las para fila de execução, realiza outra alteração para `Queued`.

O `Executor` ao receber uma `task` altera seu estado para `Running` e finalmente, ao finalizar sua execução altera para `Success` ou `Failed`.

Existem outros estados a depender da configuração do usuário, é possível por exemplo, configurar que a execução de uma `task` seja repetida em caso de falha, utilizando o estado `Retry`, eles estão descritos na [documentação](https://airflow.apache.org/docs/apache-airflow/stable/index.html) do Airflow.

# Contribuições Concretas

Essa descrição arquitetural não foi submetida ao Github do projeto devido ao idioma utilizado, pois a documentação do Airflow é feita em inglês.