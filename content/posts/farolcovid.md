+++
title = "Documentação arquitetural para o projeto Farol Covid"
date = 2020-10-06
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Natan Macena Ribeiro.

- Matrícula: 114111371
- Contato: natan.ribeiro@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ImpulsoGov/farolcovid

# Descrição Arquitetural -- FarolCovid????????Serviço de análise do twitter



Este documento descreve parte da arquitetura do projeto [Farol Covid](https://github.com/ImpulsoGov/farolcovid). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/). Vale lembrar que não será descrita toda a arquitetura do Farol Covid. O foco aqui é a.......



## Descrição Geral sobre o Farol Covid

O Farol Covid é uma ferramenta de monitoramento do risco de colapso no sistema de saúde em municípios brasileiros com a Covid-19. Além de apresentar a situação atual da Covid-19 nos estados ou municípios, esse projeto permite que governantes consigam definir políticas de contingenciamento da doença, baseando-se em indicadores bem definidos que inclusive, permitem a realização de simulações que projetam possíveis cenários para a região de interesse. Para mais  detalhes sobre o projeto abordado, acesse [este link](https://farolcovid.coronacidades.org/).

## ............O Serviço de monitoramento do twitter





### Objetivo Geral

Implementar um serviço para capturar automaticamente o que é dito no twitter sobre as proposições que acompanhamos e prover indicadores sobre as publicações para serem usados no parlametria. 



### Objetivos Específicos



Queremos ter acesso ao grau de atividade no twitter de parlamentares e de influenciadores do debate no twitter. Além disso, queremos saber quanto essas pessoas tuítam sobre cada proposição ou tema e a indicadores sobre sua atividade. Para parlamentares também queremos indicadores a partir dos léxicos de discurso desenvolvidos pelos nossos parceiros.



### Contexto



Nesta seção eu espero duas coisas: o diagrama de contexto e um texto curto descrevendo em mais detalhes o contexto do sistema. Isso inclui as fronteiras do sistema, os sistemas/serviços externos com os quais ele se comunica etc.


Abaixo estão dois exemplos de diagramas de contexto.


![fig1](c4-context.png)

<img class="center" src="parlametria-contexto.png" style="width:60%">

### Containers



Nesta seção eu espero duas coisas: o diagrama de containers e  texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.

![fig3](c4-containers.png)
![fig4](parlametria-container.png)
![fig5](c4-implantacao.png)
![fig6](parlametria-implantacao.png)



### Componentes



Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig7](c4-componentes.png)



### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Como sabemos, a principal funcionalidade do projeto Farol Covid é apresentar informações pré-processadas, no formato de análises, de acordo com uma determinada localidade. Dessa forma, nesta seção abordaremos de maneira simplificada, o percurso habitual que os usuários percorrem na busca das informações disponibilizadas pela aplicação.

Na página inicial, o usuário se depara com uma breve apresentação da plataforma e logo em seguida, uma bloco de seleção é disponibilizado dividindo-se em três tipos: Estado, Região de Saúde (algo particular de cada estado) e Município (Municípios do estado selecionado). Podemos perceber que há uma hierarquia entre os tipos disponíveis, onde um "Município" é um subtipo de uma "Região de Saúde" e de um "Estado", assim como "Região de Saúde" é subtipo de um "Estado".

Logo abaixo, temos as informações apresentadas de acordo com o que foi selecionado pelo usuário. Essas informações são mostradas a partir de métricas bem definidas (que  estão disponíveis para consulta no botão "Entenda a Classificação dos Níveis") e indicam, por exemplo, situação e controle da doença, capacidade do sistema de saúde, etc.

Além disso, é disponibilizado quatro seções que agregam uma análise mais detalhada de acordo com a localidade anteriormente escolhida, sendo elas: Simula Covid, que permite a realização de uma simulação da situação da Covid considerando variáveis pertinentes; Distanciamento Social, que mostra a taxa de isolamento social; Saúde em Ordem, que dá uma prognóstico no que diz respeito a possíveis atividades econômicas seguras para reabertura; Onda Covid, que mostra a evolução da curva de contágio da Covid-19 em relação a outros países.

Para cada interação do usuário, a página é automaticamente recarregada de acordo com o que foi selecionado. Por default, o elemento pré-selecionado do sistema é o estado do Acre.

Vejamos abaixo, uma máquina de estados que ilustra fluxo da informação da aplicação em estudo.

![fig3](03_fluxo_informacao.png)

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
