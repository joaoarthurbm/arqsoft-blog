+++
title = "Documentação Arquitetural do Mockito"
date = 2021-08-13
tags = ["Java", "Testes"]
categories = []
+++


# Autores

Este documento foi produzido por Luiz Bonfim Vieira Costa Neto

- Matrícula: 119210966
- Contato: luiz.bonfim.neto@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/mockito/mockito

# Descrição Arquitetural -- Mockito
![Logo Mockito](mockito-logo.png)
Este documento descreve parte da arquitetura do projeto [Mockito](https://github.com/mockito/mockito). As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Mockito

O Mockito é um framework bastante popular para a criação de mocks em testes de unidade de projetos  desenvolvidos em Java. O uso de mocks adiciona funcionalidades interessantes aos testes de unidade, por ser possível simular a execução de uma implementação de uma dependência externa, para vários cenários distintos e de forma dinâmica, mantendo assim os testes com a agilidade e modularidade de um teste de unidade.

## Objetivo
No desenvolvimento de softwares, os testes de unidade são fundamentais para indicar se pequenas seções de código são adequadas às necessidades, bem como tornar os sistemas mais manuteníveis e menos susceptíveis a inserção de bugs durante expansões ou refatorações do sistema. Em projetos Java, a unidade de código que buscamos testar é geralmente uma Classe, ou apenas um simples método.

Em testes de unidade, é desejável validar a funcionalidade de um objeto em específico. Porém, na maioria dos casos esses objetos possuem dependência de outros objetos externos, e é neste ponto que os mocks são fundamentais. Com os mocks, podemos simular o comportamento das dependências segundo a regra de negócio do sistema, e testar se a classe em questão tem a funcionalidade adequada ao contexto na qual está inserida.

## Contexto
Por ser um framework de testes em Java, o Mockito é direcionado para o uso de desenvolvedores de software que trabalham nesta linguagem. O Mockito atua em cooperação com o JUnit, que é um dos frameworks para a construção de testes automatizados mais frequentemente utilizado em projetos Java.

Com o JUnit, o desenvolvedor consegue construir os testes que visam verificar o funcionamento de um determinado escopo (em geral, uma classe) e com o auxílio do Mockito é possível isolar o comportamento daquela classe de suas dependências, definindo de forma dinâmica como essas dependências externas se comportam em cenários de teste variados.

![Diagrama de Contexto](context.png)

## Containers
Por se tratar de um framework que auxilia no complemento dos testes, o Mockito é adicionado como dependência na aplicação Java que está em desenvolvimento. O desenvolvedor define na classe de teste o Runner de acordo com o framework de testes a ser utilizado (por exemplo, o JUnit) e, então, o módulo de integração irá realizar a configuração para integrar o Mockito ao framework de testes.

Já no escopo dessa classe de testes, o desenvolvedor irá definir quais dependências da classe em questão terão seu comportamento simulado através do Mockito. Em geral, essa definição se dá através de anotações que se encontram no módulo core do Mockito. O Desenvolvedor também irá definir o comportamento em si dos métodos das dependências mockadas.

Na execução do teste, o Core do mockito invoca o módulo de Invocation, que irá monitorar a invocação dos métodos das dependências mocadas, bem como irá executar os comportamentos pré-definidos pelo desenvolvedor na chamada desses métodos, ou, a depender do caso, executar o método real daquela dependência. Este módulo também é responsável por realizar a verificação dos argumentos e retornos dos métodos mocados.

![Diagrama de Containers](containers-mockito.png)

## Componentes
Em termos de configuração, o módulo de integração com o JUnit possui basicamente o JUnitRunner, que configura o runner do mockito para se integrar ao JUnit, e o JUnitRuler, que define rules de atuação para o Mockito.

No Mockito Core, podem-se definir basicamente se temos um Mock ou um Spy. Ambos são mocks implementados pelo Mockito, porém, diferem na invocação dos métodos. Para um Mock, todos os métodos utilizados pela unidade de teste devem ter seu comportamento descrito explicitamente. Já pra os Spys, caso este comportamento não seja definido explicitamente pelo desenvolvedor, será considerado a chamada do método real daquela classe. Em geral, definimos como Spy a classe foco dos testes, e todas as suas dependências são definidas como Mock. O componente responsável pela instanciação e criação dos mocks em tempo de execução é o Mock Creator.

O Mockito core notifica o módulo de Invocation através de um Listener, que monitora a chamada dos métodos das dependências. Esse Listener faz uso de um Handler, que lida de fato com a chamada dos métodos, utilizando o componente Verifier para verificar se, logicamente, os argumentos e retornos dos métodos estão de acordo com o que está definido na classe, e invoca o componente de Stubbing, que de fato irá executar o comportamento pré-definido pelo desenvolvedor para os métodos, ou, em caso de ser um Spy, irá executar a implementação real daquele método.


![Diagrama de Componentes](components.png)

## Visão de Informação
`Fazer a descrição da informação do mockito`