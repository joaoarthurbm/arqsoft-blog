+++
title = "Documentação Arquitetural - Deno"
date = 2021-08-02
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Flávio Roberto Pires Quirino Farias.

- Matrícula: 117111444
- Contato: farias.farias@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/denoland/deno/

# Descrição Arquitetural -- Deno

Este documento descreve parte da arquitetura do projeto [Deno](https://github.com/denoland/deno/). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Deno

Deno é um simples, moderno e seguro runtime para JavaScript e TypeScript que funciona em V8 Chromium Engine e é feito na linguagem de programação Rust. As funcionalidades do Deno são projetadas para aprimorar as funcionalidades do Node.js.

## Deno

### Principais funcionalidades e recursos do Deno são:
 - Seguro por padrão. O Deno requer permissões explicitas para acessar arquivos, rede ou ambiente.
 - Tem suporte ao Typescript;
 - Tem um conjunto de modulos padrão, chamados de standard modules ou STD, que tem funcionalidade garantida com o Deno.
 - Tem funcionalidades internas como um verificador de dependencias (deno info) e um formatador de código (demo fmt).

## Objetivo Geral
 - O Deno visa ser um ambiente de script produtivo e seguro para o programador moderno.

## Objetivos Específicos
 - Gerar apenas um único executável (deno).
 - Fornecer padrões de segurança:
    Sem permissões específicas, os scripts não podem acessar arquivos, o ambiente, ou a rede.
 - Compatibilidade com o navegador: O subconjunto de programas Deno que são escritos completamente em Javascript e não usam o namespace global do Deno, deve ser capaz de ser executado sem alterações em um navegador moderno.
 - Fornecer ferramentas integradas como testes de unidade, formatação de código e linting para melhorar a experiência de desenvolvimento
 - Ser capaz de servir HTTP eficientemente.



## Contexto

O Deno é um ambiente de execução de Javascript (TS)/Typescript (TS) que utiliza o V8 engine para executar os códigos JS. Porém o V8 não suporta código TS, então todo código TS precisa ser convertido em JS para ser carregado e executado pelo V8. No entanto, Deno é escrito em Rust e o V8 em C++. Para que eles possam trabalhar juntos, é utilizado o rusty_v8, uma biblioteca que permite que o rust interaja com a API em C++ do V8.

Outra característica do Deno é que sua biblioteca padrão (standard library ou STD) oferece funcionalidades completamente assíncronas. Isso é possível porque Deno utiliza Tokio, um ambiente de execução assíncrono para Rust, usado para criar e lidar com eventos. Ele permite que o Deno crie tarefas em um pool de threads interno e receba notificações para processar a saída após a conclusão de cada tarefa.

![asd](deno_context.png)

Mais detalhadamente, no diagrama de contexto, vemos o Deno, que é o sistema abordado nesse documento, e suas três principais dependencias externas, além de um usuário comum que interage com o Deno.

### Tokio
Tokio é parte fundamental do Deno. Deno tenta evitar callbacks sempre que possível. Para isso, é necessário a ajuda do Tokio no uso de funções assíncronas equivalentes para funções síncronas usadas comumente. Por exemplo, Tokio envolve uma chamada de sistema OS em uma função assíncrona.

### V8 engine

Apesar da grande importância do Tokio, V8 é a biblioteca mais importante do Deno. V8 é onde o código Javascript é executado. Sem isso, o Deno não funcionaria.

V8 é um JavaScript e WebAssembly engine de código aberto de alto desempenho do Google, escrito em C ++, que analisa e executa códigos de script. Também fornece regras sobre como a memória é acessada, como o programa pode interagir com o sistema operacional do computador e sobre a sintaxe do programa. O V8 pode ser executado de forma autônoma ou pode ser incorporado a qualquer aplicativo C ++.

### Rusty_V8
Rusty_v8 é uma parte do projeto Deno, mas não está localizado dentro do repositório principal. Sendo assim considerado um componente de terceiros. Como dito anteriormente, Deno é escrito em Rust, equanto V8 é escrito em C++. Para fazê-los interagir, rusty_v8 foi criado. O principal objetivo da biblioteca rusty_v8 é fornecer uma interface em Rust para a API em C++ do V8. 

## C0ntainer

Quando observamos os containers que formam o Deno. Podemos dividi-los em 4 partes principais:
- Frontend: Formado pelo V8 que executa os códigos JS/TS. É a parte não previligiada, ou seja, não tem acesso a rede, ao sistema de arquivos, nem nada fora do sandbox do Deno.
- Backend: Formado pelo próprio Deno em Rust;
- Rusty_V8: Funciona como interface entre o Rust e a API do V8 em C++.
- IO Assíncrono: A parte assíncrona do Deno que é gerenciada através do Tokio.
 
A seguir, o diagrama de Container do Deno.

![asd](deno_container.png)


## Componente

Vamos começar com a arquitetura de alto nível do Deno. Podemos dizer que o Deno consiste de dois tipos de componentes:

 - Componentes próprios: Esses componentes fazem parte do projeto do Deno, ou seja, estão presentes em seu principal [repositório no Github](https://github.com/denoland/deno). Com exceção do STD (biblioteca padrão ou standard library), que é versionada de forma indepente do Deno, mas isso mudará uma vez que a biblioteca esteja estabilizada. A maioria desses componentes são escritos em Rust e Javascript/Typescript.

 - Componentes de terceiros: Partes imprecindíveis do Deno, como Tokio e V8 engine. Sem esses componentes o Deno não funcionaria.

Para o diagrama de componentes, vamos focar no Deno e abordar apenas os componentes próprios.

![asd](deno_component.png)

A seguir uma breve descrição das principais partes formam Deno.

### CLI
CLI implementa a maioria das funcionalidades do Deno que são voltadas para o usuário, sendo também uma das maiores partes do Deno. Também funciona como uma ligação entre as outras partes. ClI é uma espécie de orquestrador e executor. Ele orquestra a execução de programas TS/JS com a ajuda de serviços próprios e de todos serviços das outras partes do Deno.

### Core
O Core fornece serviços importantes para a CLI como a interface para V8 API mencionada anteriormente, modulos, JsRuntime, etc. Também oferece serviços que podem ser chamados tanto em Rust como em JavaScript.

### Runtime
Runtime é o ambiente de execução do Deno que consiste das principais funcionalidades do Deno escrito em JavaScipt puro.
O Runtime fornece a maior parte da API da Deno que pode ser chamada do programa do usuário. O tempo de execução também implementa os ops de baixo nível do Rust.

### STD
É a biblioteca padrão do Deno implementada em TypeScript. Ela consiste de modulos que não têm depêndencias externas e que são revisados pela equipe do Deno. O objetivo é ter um conjunto padrão de alta qualidade de código que possa ser usado em todos os projetos do Deno sem preocupações.

# Referências

Language Bindings 
- [Wiki Language Bindings](https://en.wikipedia.org/wiki/Language_binding#:~:text=Binding%20generally%20refers%20to%20a,be%20used%20in%20another%20language.)

V8
- [V8 Runtime Overview](https://developers.google.com/apps-script/guides/v8-runtime)
- [what is v8?](https://v8.dev/)

Deno
- [Deno Manual](https://deno.land/manual@v1.0.0/introduction)
- [Deno Internals](https://choubey.gitbook.io/internals-of-deno/architecture/chapter-cover-page)
- [The internals of Deno](https://medium.com/deno-the-complete-reference/the-internals-of-deno-5bdc1f074792)
- [Introducing Deno](https://www.syncfusion.com/succinctly-free-ebooks/deno-succinctly/introducing-deno)
- [A guide to Deno core](https://denolib.gitbook.io/guide/)
- [What happens in the backstage of Deno?](https://medium.com/deno-tutorial/deno-architecture-8551fb3be80e)
- [First Thoughts About Deno](https://www.codegram.com/blog/first-thoughts-about-deno/)
- [Deno Repository](https://github.com/denoland/deno)
- [Deno internals - how modern JS/TS runtime is built](https://www.youtube.com/watch?v=AOvg_GbnsbA&t=2113s)

C4 Model
- [C4 Model](https://c4model.com/)
- [Visualising software architecture with the C4 model](https://www.youtube.com/watch?v=x2-rSnhpw0g)