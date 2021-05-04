+++
title = "Documentação Arquitetural ORY Oathkeeper"
date = 2020-12-09
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Hemillainy Santos.

- Matrícula: 116210802
- Contato: hemillainy.santos@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ory/oathkeeper

# Descrição Arquitetural -- ORY Oathkeeper

Nesse documento será descrita a arquitetura base do projeto [ORY Oathkeeper](https://github.com/ory/oathkeeper), utilizando o modelo [C4](https://c4model.com/).

## Descrição Geral sobre o ORY Oathkeeper

O ORY Oathkeeper é um serviço cuja função é analisar as requisições recebidas pelo servidor a fim de validá-las. Caso a requisição seja válida, ela é encaminhada para o servidor final; caso seja inválida, o fluxo de validações é encerrado e o Oathkeeper retorna uma mensagem de erro para o cliente.

### Objetivo Geral

Implementação de um serviço, altamente configurável, que valida toda requisição que chega no servidor. A partir dessa validação, é possível filtrar requisições inválidas, impedindo assim que elas cheguem ao serviço final. Além disso, é possível também fazer alterações em requisições válidas antes de encaminhá-las.

### Objetivos Específicos

Permitir que a aplicação possa configurar todas as regras de acesso que serão utilizadas pelo Oathkeeper no pipeline de validação. Essa configuração pode ser feita em dois formatos: JSON e YAML. Segue abaixo exemplos dessa configuração:

####

JSON

```
{
    "id": "some-id",
    "version": "v0.36.0-beta.4",
    "upstream": {
    "url": "http://my-backend-service",
    "preserve_host": true,
    "strip_path": "/api/v1"
    },
    "match": {
    "url": "http://my-app/some-route/<.\*>",
    "methods": ["GET", "POST"]
    },
    "authenticators": [{ "handler": "noop" }],
    "authorizer": { "handler": "allow" },
    "mutators": [{ "handler": "noop" }],
    "errors": [{ "handler": "json" }]
}
```

####

YAML

```
id: some-id
version: v0.36.0-beta.4
upstream:
url: http://my-backend-service
preserve_host: true
strip_path: /api/v1
match:
url: http://my-app/some-route/<.\*>
methods: - GET - POST
authenticators:

- handler: noop
  authorizer:
  handler: allow
  mutators:
- handler: noop
  errors:
- handler: json
```

Para mais detalhes à respeito da configuração, acesse [esse link](https://www.ory.sh/oathkeeper/docs/api-access-rules)

### Contexto

O Oathkeeper funciona como uma camada intermediária entre o cliente e o servidor, camada esta que é responsável por fazer a validação das requisições, validando desde o formato da URL chamada até a presença ou não de tokens de acesso, escopos, etc. Desse modo, quando o usuário solicita algo ao cliente, ele enviará a requisição para o servidor, porém antes de chegar ao destino final a requisição será tratada pelo Oathkeeper, caso a requisição atenda às regras de acesso definidas no arquivo de configuração ela será encaminhada para o servidor final; se não, o Oathkeeper não fará o encaminhamento e uma mensagem de erro será retornada para o cliente.

![fig1](c4-contexto.png)

### Containers

Devido à sua implementação ser escrita em GO, torna-se bastante fácil sua utilização ou integração com outros sistemas, uma vez que para utilizá-lo basta instalar o binário GO ou executar sua imagem Docker.

![fig2](c4-container.png)

### Componentes

Para lidar com as requisições, o Oathkeeper implementa o Access Rule Pipeline que é composto pelos quatro componentes descritos a seguir:

- Authentication: valida se a requisição contém as credenciais ou tokens necessários.
- Authorization: valida de o usuário possui as permissões necessárias.
- Mutation: altera as credenciais enviadas na requisição para um formato que o servidor entenda; isso permite que o servidor lide apenas com um único tipo de credencial, visto que independente do tipo que for enviado na requisição, o mutator irá transformá-la em um tipo que é compreendido pelo serviço.
- Error handlers: caso ocorra um erro em um dos steps de validação (authentication ou authorization), esse componente define como o erro será apresentado para o cliente.

![fig4](c4-componentes.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

O diagrama abaixo apresenta o fluxo de uma requisição no Oathkeeper.
Ao ser enviada pelo cliente para o servidor, a requisição entrará no pipeline de regras de acesso, onde o primeiro step será a verificação por parte do Authentication. Em seguida, caso validada, ela será verificada pelo Authorization. Conforme mostra o diagrama, caso a verificação falhe em um dos steps anteriores, o Error Handler é acionado e enviará uma resposta de erro para o cliente, mas caso a requisição seja válida ela é enviada para o Mutator, onde poderá sofrer algumas alterações antes de ser encaminhada para o servidor final.

![fig5](c4-info.png)
