+++
title = "Documento Arquitetural do unForm"
date = "2021-04-16"
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Lucas Venancio Duarte.

- Matrícula: 116210074
- Contato: lucas.duarte@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/unform/unform

# Descrição Arquitetural -- unForm

Este documento descreve a arquitetura do [unForm](https://github.com/unform/unform).
As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

## Descrição Geral

Unform é uma API focada em desempenho para criar experiências de formulários para React e React Native. Projetado para ter um design zero, extensível e poder lidar com dados e relacionamentos complexos. Ele é disponibilizado como um pacote npm.

Mais informações podem ser encontradas [aqui](https://unform.dev/).

## Objetivos

Oferecer uma biblioteca baseada em hooks para expor suas configurações sem que o usuário precise se preocupar em criar funções para preencher, validar e lidar com dados e relacionamentos complexos, possuir também, a possibilidade de integração com qualquer biblioteca de formulários, como React Select e React Datepicker, e por fim, ser possível integre-se de forma fácil  com bibliotecas de IU ou soluções CSS-in-JS para criar componentes de formulário e exibir erros, alterar cores, adicionar ícones e usar seu guia de estilo.

## Contexto

Como o unForm se trata de uma biblioteca, os usuários finais são os desenvolvedores de *software*, que a importam em seus projetos e assim fazem uso de suas funcionalidades.

Em relação à comunicação com sistemas externos, a principal interação realizada é com outras bibliotecas definido pelo usuário. Essas bibliotecas podem ser de estilos ou que provem alguma API para interação com o formulários.

O diagrama de contexto abaixo ilustra quais entidades interagem com o unForm.

![Diagrama de Contexto](contexto.png)

### Implantação

A sua implantação é bem simples, pois é instalado no projeto através de algum gerenciador de pacotes (como npm e yarn), é preciso apenas se atentar para os requisitos de ambiente, como, por exemplo, a versão do React. Logo após importa seu hook principal, o useField, basta criar um componente de entrada customizado que sera usado para cada entrada no projeto e depois criar o formulário.

O diagrama de implantação abaixo ilustra como é feita a implantação do unForm. Nele é possível observar que bibliotecas de terceiros podem ser adicionadas para interagir com o unForm.

![Diagrama de Implantação](implantacao.png)

## Containers

O unForm é uma biblioteca que possui todos os modulos de codigo necessários para seu funcionamento e implementação de suas funcionalidades, porém pode-se introduzir novas bibliotecas que auxiliam e agregam no seu uso, como, por exemplo, o yup, que introduz uma validação aos campos de formularios, já que o unForm não inclui validação em seu núcleo.

O seu hook principal use-field disponibiliza os seguintes recursos:

#### fieldName
O fieldName um nome de campo único, sendo seu valor do tipo string.

#### registerField
O registerField é o método usado para registrar um campo no Unform, é que possui os seguintes argumentos: nome, ref, setValue, clearValue, getValue, caminho

#### defaultValue
O defaultValue é o valor inicial que o campo do formulário ira iniciar ao renderizar no ReactDOM.

#### clearError
O clearError Limpa a mensagem de erro, quando o campo possui validação, quando essa validação é disparada e depois é digitado uma entrada que satisfaça a condição.

#### error
O error retorna a mensagem de erro do campo, caso este tenha alguma validação.

Mais detalhes sobre a API podem ser encontrados [aqui](https://unform.dev/api/use-field).

## Componentes

O unForm é composto basicamente pelo componente principal que gerencia e configura a manipulação de campos de formulários, essas configurações são herdadas pelas interfaces web e mobile, pois, cada uma tem diferenças de versão do React e de bibliotecas.

O diagrama de componentes abaixo ilustra os componentes apresentados e sua comunicação.

![Diagrama de Componentes](componente.png)

## Visão de Informação

O componente de unForm, após instalação, criação de um componente para usar em cada campo de input, e configuração useField que é um hook exposto pelo unForm, basta criar o formulário, chamando o componente criado, com as configurações de cada campo do formulário, além da criação da função que vai receber a submissão. Caso seja necessário um formulário mais elaborado, pode-se incorporar outras bibliotecas para compor o unForm, como, por exemplo: de layout, como o Material-UI, de bibliotecas que trazem novas funcionalidades, como o yup, que traz validação dos dados enviados, pois o unform é capaz que receber e exibir os erros, além da introdução de bibliotecas que possuem um tipo diferente de input, como o React DatePicker.

O diagrama abaixo ilustra o que foi falado acima.

![Diagrama de Máquina de Estados](vissao-informacao.png)

## Contribuições Concretas

Ainda não foram abertas PRs para o repositório oficial do unForm.
