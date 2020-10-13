+++
title = "Documentação arquitetural do OkHttp"
date = 2020-10-06
tags = ["android", "http", "java"]
categories = []
+++

***

Este documento descreve parte da arquitetura do projeto [OkHttp](https://github.com/square/okhttp). É importante destacar não será descrita toda a arquitetura do OkHttp. O foco é a descrição de como é realizado o processo de criação, inicialização e encerramento de uma requisição de rede utilizando os serviços disponibilizados por este projeto.

***

# Autores

Este documento foi produzido por Adauto Ferreira de Barros Neto.

- Matrícula: 114211302
- Contato: adauto.neto@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/square/okhttp

# Descrição Arquitetural -- Cliente HTTP para Android

Este documento descreve parte da arquitetura do projeto [OkHttp](https://github.com/square/okhttp). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do OkHttp. O foco aqui é a descrição de um serviço específico de requisições HTTP, que é parte fundamental do projeto.

## Descrição Geral sobre o OkHttp

HTTP é a maneira que aplicações modernas se comunicam entre si para troca de informações, sendo essas dados e/ou mídias. Fazer essa conexão da maneira mais eficiente requer bastante esforço, mas traz benefícios tanto de velocidade, como de melhor uso dos recursos disponíveis para a aplicação. O OkHttp é um projeto que implementa um cliente HTTP para Android que busca a eficiência como padrão, sua API de requisições e respostas possui construtores fluidos e imutáveis, suportando chamadas síncronas e assíncronas. Mais detalhes sobre o projeto podem ser vistos [neste link](https://square.github.io/okhttp/).

## O cliente de requisições HTTP

### Objetivo Geral

Implementar um cliente Android eficiente para requisições e respostas HTTP com o interesse em troca de dados e mídia, provendo carregamentos rápidos e economizando larguda de banda.

### Objetivos Específicos

Queremos ter uma forma eficiente de realizar chamadas HTTP em sistemas Android. Além disso, desejamos o suporte para chamadas síncronas bloqueantes e assíncronas com callbacks. Também é de interesse do projeto que haja perseverança quando houver conexões problemáticas, se recuperando silenciosamente de problemas comuns de conexão.

### Contexto

O sistema se resume a um cliente de requisições HTTP, que através de uma URL provida pelo sistema e o cliente Android, realiza a conexão com um *WebServer* que irá conter informações desejadas pelo usuário do projeto. Essas informações são acessadas por meio da resposta HTTP que pode encapsular diferentes tipos de dados.

![context](context.jpg)

Para o sistema, todo esse processo é nomeado de **call** e seus estados serão mais detalhados no decorrer deste documento.

### Containers

A arquitetura do OkHttp no geral se baseia basicamente na divisão de camadas, onde cada uma é responsável por lidar com uma etapa do processo de requisições HTTP. Sendo essas:

* Interface: A camada de interface é responsável pelo recebimento das requisições fornecidas pelo usuário e realiza o inicializa o processo de requisição de rede;
* Protocolo: Camada que executa o processamento da lógica de protocolos, dando suporte a três tipos: HTTP1, HTTP2 e WebSockets. Definidos dinamicamente através do cliente configurado;
* Conexão: Trata do processo de estabelecimento da conexão com o *WebServer* a partir da URL provida pelo usuário, recuperando conexões existentes ou criando novas conexões;
* Cache: Essa camada opera sobre o sistema de cache de requisições. Quando a requisição de rede realizada pelo usuário possui um cache local que atende a requisição, o OkHttp retorna imediatamente o resultado encontrado no cache;
* Entrada/Saída: Responsável pela leitura e escrita de dados. Esta camada depende totalmente do [Okio](https://github.com/square/okio), uma biblioteca que iniciou sendo apenas um componente do OkHttp para realizar o processo de acessar, guardar e processar dados;
* Interceptadores:  A camada de interceptadores contém vários componentes que operam sobre um sistema a qualquer momento, realizando operações lógicas relevantes para o ponto de execução que foi chamado. Funcionando de forma semelhante a um sistema com programação orientada a aspectos (POA).

![container](container.jpg)

### Componentes

Para esta seção nos apronfudaremos nos componentes da camada de Interface e de Conexão, pois são as que mais agem sobre o sistema e também sobre as **calls**, que são o principal elemento descrito nesse documento.

##### Interface
Como dito anteriormente, essa camada é quem realiza a interação com o usuário, recebendo as inforamções necessárias para iniciar a requisição. Ela é composta por, principalmente, 4 componentes que serão descritos abaixo:

* Call: A call é uma requisição de rede que foi preparada para execução, cada requisição de rede feita pelo usuário será uma call. Ela pode ser cancelada, mas por se tratar de um par de requisição e resposta, chamado de **stream**, não pode ser executada mais de uma vez;
* Request: Usada para descrever a requisição que será iniciada. De acordo com as informações providas pelo usuário, esse componente irá encapsular a URL, o método utilizado, cabeçalho e corpo. Também nesse componente é realizado o controle da cache, independente se for uma requisição HTTPS ou não;
* Client: Usuários podem configurar este componente de várias maneiras. Todas as requisições de rede são realizadas através do cliente, cada cliente mantém sua fila de tarefas e seu pool de conexões, podendo reutilizar conexões que já foram estabelecidas;
* Dispatcher: Esse é o componente que contém a fila de tarefas utilizada pelo Client, mantendo um pool de threads internamente. Quando uma call é recebida, o Dispatcher é responsável por encontrar threads que estejam ociosas e executar com a nova call.

##### Conexão
Essa camada é responsável pela conexão de rede. Aqui também encontramos um pool de conexões, porém que trata apenas as conexões via socket. Quando o usuário inicia o processo de requisição de rede, OkHttp vai primeiramente procurar em seu pool de conexões se existe alguma que atenda aos requisitos. Caso sim, irá enviar requisições diretamente pela conexão que já existe, caso não exista, uma nova conexão é estabelecida para o envio das requisições.

A partir da introdução de multiplexação completa de solicitação e resposta em HTTP2, o pool de conexões presente nessa camada busca fazer o mesmo com as conexões via socket, mantendo várias **RealConnection** que possibilitam múltiplas requisições de conexões de rede. Com isso, também houve a introdução do **StreamAllocation** para descrever a carga de requisições. Uma RealConnection representa uma ou mais StreamAllocation, podendo ser considerado um contador de conexões, quando esse contador alcançar zero, a StreamAllocation será liberada caso não seja ocupada por novas requisições depois de muito tempo.

Para a criação de novas conexões, esta camada utiliza o componente de **DNS** para definir para descobrir o endereço IP do servidor e o **Route** para testar e selecionar qual deverá ser usado. Após tudo ser definido, irá utilizar o **ConnectionSpec** para especificar a configuração da conexão socket em que a requisição HTTP irá ser transportada, em caso de conexão HTTPS, isso também irá incluir a versão TLS e o conjunto de criptografia usada para negociação de conexão segura.

![components](components.jpg)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Uma **call** é o que carrega a requisição HTTP e sua resposta dentro do OkHttp, esse elemento do sistema passa por várias etapas e algumas delas estão descritas abaixo:

1. Usa a URL que foi provida pelo Android juntamente com o cliente configurado para criar um **endereço**. Esse endereço é quem especifica como é feita a conexão com o servidor web;
2. Tenta recuperar uma conexão com esse endereço que já tenha sido utilizada;
3. Se não encontrar uma conexão reutilizável, uma rota é selecionada para a tentativa de conexão. Isso significa fazer uma requisição DNS para obter o endereço de IP do servidor;
4. Caso seja uma nova rota, ela será conectada utilizando ou SDP, ou túnel TLS (para requisições HTTPS), ou conexão TLS direta. Também faz um TLS handshake.
5. Envia a requisição HTTP e lê a resposta.

![info](info.jpg)