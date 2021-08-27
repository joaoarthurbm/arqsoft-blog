+++
title = "Documento arquitetural - Biblioteca Gson"
date = 2021-07-29
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Jerônimo Jairo Silva de Araújo.

- **Matrícula**: 117211387
- **Contato**: jeronimo.araujo@ccc.ufcg.edu.br	
- **Projeto documentado**: https://github.com/google/gson	

## Descrição Geral

O [Gson](https://github.com/google/gson) é uma biblioteca Java que é usada para *serializar* objetos Java em suas representações JSON e para *deserializar* uma string JSON em um equivalente objeto Java.

## Objetivo geral

- Prover uma interface simples, onde o usuário consiga serializar/deserializar objetos em JSON (e vice-versa), facilmente, sem a necessidade de anotações (pois quando não se tem acesso ao código se torna um problema).

## Objetivos específicos

- Prover uma interface simples para realizar a serialização de objetos e deserialização de strings JSON através dos métodos toJson() e fromJson(), respectivamente.
- Trabalhar com objetos que não se tem acesso ao código.
- Permitir que objetos não modificáveis sejam serializáveis e deserializáveis.
- Dar suporte à Java Generics e objetos arbitrariamente complexos (que contém alto nível de herança e uso extensivo de Generics Types).
- Permitir representações customizáveis de objetos.

Agora será dada uma visão do projeto utilizando o modelo C4.

## Contexto

O Gson é uma biblioteca Java, que é comente utilizado em programas que tem necessidade de fazer conversões de objetos para JSON, ou vice-versa.

Um das suas principais utilizações (e onde tive contato), são em aplicações RESTApi que recebem e enviam JSON em seus endpoints. Assim, é comum fazer a deserialização de um JSON que chega na requisição e, posteriormente, uma serialização para a criação de um JSON que será enviado como resposta.

Abaixo, um simples exemplo de contexto que pode ser encontrado o Gson:

<center>
  <img src="gson-context.png" alt="Diagrama de contexto do Gson" style="width:65%;">
</center>


## Containers

Para essa parte, serão considerados como obtemos um objeto Gson para realizar as chamadas toJson e fromJson. Para isso, temos dois métodos de criação de um objeto Gson:

- Através da **instanciação direta** de um objeto Gson, que tem as configurações padrões de um objeto Gson. A sua instanciação é feita da seguinte forma:
  ```java
  Gson gson = new Gson();
  ```
- Através de um **GsonBuilder**, que ajuda a fazer uma criação customizável do objeto Gson, configurando coisas como: versionamento, impressão bonita e customizáveis dos JsonSerializers, JsonDeserializers e InstancesCreators. A criação através do builder pode ser feita da seguinte maneira:
  ```java
  Gson gson = new GsonBuilder()
     .registerTypeAdapter(Id.class, new IdTypeAdapter())
     .enableComplexMapKeySerialization()
     .serializeNulls()
     .setDateFormat(DateFormat.LONG)
     .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)
     .setPrettyPrinting()
     .setVersion(1.0)
     // creates a Gson instance with the configurations 
     // set into the GsonBuilder
     .create();
  ```

Assim, podemos ter dois "containers", que dão acesso a criação de Gson e sua utilização futura:

<center>
  <img src="gson-containers.png" alt="Diagrama de containers do Gson" style="width:65%;">
</center>

## Componentes

Agora, o container que será "aberto" é do Gson. Nele que há todas as chamadas que fazer acontecer as serializações e deserializações, respectivamente, através dos métodos toJson e fromJson.

A seguir, uma exemplo de como um serialização/deserialização pode ser feita:

```java
// Também pode ser utilizado new GsonBuilder().create();
Gson gson = new Gson();
// O objeto que será serializado
MyType target = new MyType();
// Serializa o target para um Json
String json = gson.toJson(target);
// Deserializa o Json para um objeto do tipo passado
MyType target2 = gson.fromJson(json, MyType.class);
```
A partir do objeto MyType, é feita a serialização chamando o método toJson do Gson, que ao final returna uma JSON string. Depois é o processo contrário, pois iremos deserializar a string JSON de volta para um objeto do tipo MyType. Para isso, é chamado o método fromJson com a string JSON e o tipo que se espera que o JSON seja. Ao final, será retornado um objeto do tipo MyType.

Dentro do Gson são feitas várias coisas quando chamamos cada um desses métodos, e abaixo temos uma representação disso:

<center>
  <img src="gson-component.png" alt="Diagrama de componentes do Gson"/>
</center>

## Código

```
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
```

## Visão de informação

A seguir, será apresentado como acontece a serialização (toJson) de um objeto, para uma string Json. Será apresentado, desde a criação de um objeto Gson, até o retorno de uma string Json.

<center>
  <img src="gson-information.png" alt="Diagrama de informação do Gson">
</center>