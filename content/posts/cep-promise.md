+++
title = "Arquitetura do cep-promise"
date = 2021-04-16
tags = []
categories = []
+++
 
# Autores
 
Este documento foi produzido por Diego Amancio Pereira.
 
- Matrícula: 116210716
- Contato: diego.pereira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/BrasilAPI/cep-promise
 
# Descrição Arquitetural - cep-promise
 
Neste documento, é descrito um serviço de consulta de cep, o [cep-promise](https://github.com/BrasilAPI/cep-promise). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).
 
## Descrição geral sobre o cep-promise
 
O cep-promise é uma biblioteca de busca por cep de forma concorrente  com alta disponibilidade integrado com os serviços (Correios, ViaCEP e WideNet) e outros (Node.js e Browser).
 
### Objetivos Específicos
 
Disponibilizar uma busca por cep rápida , eficiente sem depender totalmente de um serviço de busca de cep e ter fácil de utilização;

## Contexto

É uma biblioteca virada para usuários desenvolvedores que querem poder acessar de forma fácil e em tempo real os dados de um cep através de 3 serviços ,utilizando chamadas fetch(Promise) usando o protocolo HTTPS e formatando a resposta de cada serviço para um padrão definido na biblioteca.

O diagrama de contexto que virá a seguir mostra a simplicidade que a biblioteca dá para o desenvolvedor.

![Diagrama de Contexto](cep-promise-context-diagram.png)

## Containers

Como o cep-promise é uma biblioteca ele consiste em um único container que contém módulos que garantem o seu funcionamento.

Abaixo contém exemplos de uso:

Realizando uma consulta

```js
import cep from 'cep-promise'
  // {
  //   "cep":  "05010000",
  //   "state":  "SP",
  //   "city":  "São Paulo",
  //   "street":  "Rua Caiubí",
  //   "neighborhood":  "Perdizes",
  // }
cep('05010000')
  .then(console.log)

```

Caso queira definir um ou mais provedores é só colocar como um segundo parametro um objeto com um array de providers e outro atributo
chamado timeout.

obs: Os provedores possíveis são:
<ol>
  <li> brasilapi </li>
  <li> correios </li>
  <li> viacep </li>
  <li> brasilapi </li>
</ol>

```js
import cep from 'cep-promise'
// {
//   "cep":  "05010000",
//   "state":  "SP",
//   "city":  "São Paulo",
//   "street":  "Rua Caiubí",
//   "neighborhood":  "Perdizes",
// }
cep('05010000',{ timeout: 5000, providers: ['brasilapi'] })
  .then(console.log)

```
Erro na busca:

Quando o CEP não é encontrado em nenhum serviço é retornado um objeto contendo um array de itens com a resposta 
e qual serviço foi utilizado e tambem da erro quando o cep informado for inválido.

```js
import cep from 'cep-promise'

  // {
  //     name: 'CepPromiseError',
  //     message: 'Todos os serviços de CEP retornaram erro.',
  //     type: 'service_error',
  //     errors: [{
  //       message: 'CEP NAO ENCONTRADO',
  //       service: 'correios'
  //     }, {
  //       message: 'CEP não encontrado na base do ViaCEP.',
  //       service: 'viacep'
  //     }]
  // }
cep('99999999')
  .catch(console.log)

```
## Implantação

Para implantar essa biblioteca é necessário ter um ambiente node.js, instalando-o através de : gerenciador de pacote (npm, yarn, bower) ou um browser usando CDN, em seguida serão demonstrados exemplos:

```js
<script src="https://cdn.jsdelivr.net/npm/cep-promise/dist/cep-promise.min.js"></script>
```

npm
```js
$ npm install --save cep-promise
```
Bower
```js
$ bower install --save cep-promise
```

yarn
```js
$ yarn add cep-promise
```

## Componentes

O Cep promise é composto por 3 componentes :

- **Cep-promise**:  Responsável por:
  1. receber o cep e os possíveis providers 
  2. validar a entrada 
  3. Capturar possíveis erros 

  Se tudo der certo é chamado componente service se não, é chamado o errors para retornar a resposta de erro.

- **Service**: É  responsável por fazer as requisições http em cada serviço que a plataforma está integrada, colocando a resposta de cada endpoint no padrão especificado abaixo:
```js
{
    cep: string,
    state: string,
    city: string,
    neighborhood: string,
    street: string,
    service: string,
  }
```
- **Errors**: É responsável em padronizar as respostas de erro para os outros 2 componentes já listados (cep-promise,service);

![Diagrama de Componentes](cep-promise-components.png)

## Visão da informação

Nessa sessão vamos tratar do fluxo da informação do cep que é dado para a biblioteca.

1. Primeiramente após o cep ser enviado é chamado uma função que verifica se o cep é do tipo int ou string, diferente de muitos sistemas que só aceitam em string;
2. Após verificar o tipo, é verificado se foram enviados os providers, caso não sejam enviados a função responsável retorna uma lista vazia se existe a lista dada é chamado o componente service para verificar se os providers dados são válidos.
3. Agora é verificado se o tamanho do cep é 8 pois é padrão que o cep tenha tamanho de 8 caracteres;
4. São removidos caracteres especiais e zeros à esquerda do cep;
5. Agora são feitos os request em todos os serviços ou nos serviços que foram selecionados.

obs: no passo 1,2,3,5 caso ocorra erro é chamado p error handler para tratar o erro e ser passado pro Application error Handler como descrito no diagrama de estados abaixo.

![Diagrama de visão da informação](cep-promise-information.png)

