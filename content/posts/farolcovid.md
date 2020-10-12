+++
title = "Documentação arquitetural para o projeto Farol Covid"
date = 2020-10-12
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Natan Macena Ribeiro.

- Matrícula: 114111371
- Contato: natan.ribeiro@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ImpulsoGov/farolcovid

# Descrição Arquitetural -- FarolCovid

Este documento descreve a arquitetura do projeto [Farol Covid](https://github.com/ImpulsoGov/farolcovid). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/), permitindo que diferentes stakeholders possam compreender o funcionamento da ferramenta a partir de algumas visões arquiteturais.

## Descrição Geral sobre o Farol Covid

O Farol Covid é uma ferramenta de monitoramento do risco de colapso no sistema de saúde em municípios brasileiros com a COVID-19. Além de apresentar a situação atual da COVID-19 nos estados ou municípios, esse projeto permite que governantes consigam definir políticas de contingenciamento da doença, baseando-se em indicadores bem definidos que inclusive, permitem a realização de simulações que projetam possíveis cenários para a região de interesse. Para mais detalhes sobre o projeto abordado, acesse [este link](https://farolcovid.coronacidades.org/).

### Objetivo Geral

Implementação de um serviço para coleta e visualização de dados relacionados a COVID-19, apresentando análises e indicadores da situação da doença para uma determinada região.

### Objetivos Específicos

A idéia é viabilizar que gestores públicos (estaduais e municipais), possuam uma ferramenta que mostra a situação atual da COVID-19 e indica possíveis cenários baseados no comportamento da doença na região de seu mandato.

### Contexto

A partir da introdução, podemos expecificar o sistema do FarolCovid, como um serviço Web que apresenta informações contidas nos sistemas de base de dados brasileiros [Brasil.IO](https://brasil.io/home/) e [DataSUS](https://datasus.saude.gov.br/), considerando os interesses especificos do usuário. De maneira geral, o sistema funciona como um facilitador, entre o usuário e as bases de dados anteriormente citadas, em que simplifica a obtenção de determinada informação por meio de refinamento e operações de analises sobre tais bases de dados. 

Assim, podemos representar a aplicação como uma entidade intermediária ("FarolCovid") entre as entidades "Usuário" e "Brasil.IO" juntamente com "DataSUS", como é ilustrado no diagrama de contexto abaixo:

![fig1](01_diagrama_de_contexto.png)
<img class="center" src="01_diagrama_de_contexto.png" style="width:99%">

### Containers



Nesta seção eu espero duas coisas: o diagrama de containers e  texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.


publicacoes/:parlamentar/:agenda
publicacoes/:parlamentar/:agenda/:tema?data-inicio
atividade
léxicos
publicacoes/:parlamentar/:agenda/:tema/tweets
publicacoes/:parlamentar/:agenda/:tema/tweets/:id







[API](http://datasource.coronacidades.org/br/)
https://github.com/ImpulsoGov/coronacidades-datasource



[Coronacidades API](https://github.com/ImpulsoGov/coronacidades-datasource)

            simulacovid: "br/cities/simulacovid/main"

- endpoint: 'br/cities/cases/full' # endpoint route following [country]/[unit]/[content]
http://datasource.coronacidades.org/br/cities/cases/full

    br/cities/cases/full: Full history data from Brasil.IO with notification rate and estimated active cases
    br/cities/cnes: Beds and ventilators data from DataSus/CNES
    br/cities/farolcovid/main: Data filtered & cities'indicatores for FarolCovid app
    br/cities/rt: Cities effective reproduction number (Rt) calculations by date
    br/cities/simulacovid/main: Data filtered to serve SimulaCovid app
    br/states/farolcovid/main: Data filtered & states' indicators for FarolCovid app
    br/states/rt: State effective reproduction number (Rt) calculations by date
    br/states/safereopen/main: States' security and economic priority index for reopening sectors
    world/owid/heatmap: Our World in Data data to serve the heatmaps


![fig2](02_diagrama_de_containers.png)

### Componentes



Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Logo abaixo. temos o diagrama de componente para o FarolCovid:






![fig3](03_diagrama_de_componentes.png)

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

Vejamos abaixo, uma máquina de estados que ilustra fluxo da informação da aplicação em estudo, para ações basicas de um usuário:

![fig4](04_fluxo_informacao.png)
