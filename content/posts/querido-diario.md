+++
title = "Documento arquitetural do Querido Diário"
date = 2020-10-12
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Matheus Alves dos Santos.

- Matrícula: 117110503
- Contato: matheus.santos@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/okfn-brasil/querido-diario

# Descrição Arquitetural -- Querido Diário

<div align="center" style="margin-top:1.5rem;">
    <img src="logo.png" style="width:20rem;">
</div>

Este documento descreve a arquitetura do projeto [Querido Diário](https://github.com/okfn-brasil/querido-diario) da *[Open Knowledge Brasil](https://github.com/okfn-brasil)*, baseando-se especialmente no modelo [C4](https://c4model.com/).

É importante ressaltar que o Querido Diário é composto por módulos cujas implementações estão em repositórios à parte do principal. Por isso, este documento incluirá módulos como a [API do Querido Diário](https://github.com/okfn-brasil/querido-diario-api) e o serviço de [Busca por Palavras-Chave](https://github.com/okfn-brasil/busca-querido-diario). Em contrapartida, o conteúdo de repositórios relacionados que não têm impacto direto no sistema, como o site de divulgação do projeto, não será incluído.

## Descrição Geral e Objetivos

Os Diários Oficiais estão entre as melhores fontes de informação sobre as ações da administração pública brasileira, especialmente por sua granularidade, existindo até mesmo no âmbito municipal. Contudo, mesmo com a [Lei de Acesso à Informação](https://www.gov.br/acessoainformacao/pt-br) vigente, a maioria destas publicações não está disponível em formatos adequados. Elas são encontradas quase exclusivamente em formato PDF. 

Nesse cenário, o Querido Diário visa rastrear as fontes destas publicações nos 5.570 municípios brasileiros, extrair as informações ali contidas e, posteriormente, disponibilizá-las na forma de dados abertos.

Ao criar uma fonte confiável e centralizada para estas informações, o Querido Diário busca auxiliar a sociedade civil no acompanhamento dos atos públicos municipais, bem como fomentar avanços nas ferramentas de fiscalização da administração pública brasileira.

## Contexto

Os usuários do Querido Diário formam um grupo muito heterogêneo, contemplando desde servidores públicos e jornalistas até organizações não governamentais de controle social. De forma geral, todos os cidadãos que busquem acesso aos atos públicos dos municípios brasileiros são potenciais usuários deste *software*.

Ainda assim, é possível dividi-los em dois grupos principais: a **sociedade civil** e as **ferramentas de fiscalização da administração pública**. Ambos utilizam o Querido Diário como fonte centralizada e confiável de informação acerca dos Diários Oficiais municipais. Contudo, diferenciam-se à medida que as ferramentas de fiscalização não usam os dados disponibilizados apenas como fonte de informação. Elas vão além, aplicando-os na identificação de padrões, detecção de problemas e promoção de impactos positivos na administração pública das cidades brasileiras.

Para atender às demandas desses dois grupos de usuários, o Querido Diário precisa acessar uma grande quantidade de **portais dos poderes públicos municipais** nos quais os Diários Oficiais são disponibilizados. A partir dos documentos encontrados, as informações de interesse são extraídas e estruturadas adequadamente para que possam ser, posteriormente, disponibilizadas.

O diagrama apresentado na Figura 1 descreve sucintamente o contexto em que o Querido Diário está inserido.

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-contexto.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 1 - Diagrama de contexto do Querido Diário
    </span>
</div>

## *Containers*

O Querido Diário é composto atualmente pelos quatro *containers* que serão descritos a seguir.

O **Raspador de Diários Oficiais** é o *container* responsável por acessar os portais do poder público onde são disponibilizados os Diários Oficiais municipais, bem como por extrair as informações de interesse sobre estes documentos. Ele foi implementado em [Python](https://www.python.org/), mais especificamente através das bibliotecas [SQLAlchemy](https://www.sqlalchemy.org/) e [Scrapy](https://scrapy.org/). Este *container* se comunica com os portais do poder público através de requisições HTTP e aplica rotinas de pré-processamento nos dados (por meio de *middleware*) antes de enviá-los para o armazenamento usando *Data Mappers*.

O **Pré-Processador de Dados** é o *container* responsável por aplicar transformações aos dados brutos extraídos dos Diários Oficiais, colocando-os em um formato estruturado, acessível e mais amigável à compreensão humana. Ele foi implementado em [Python](https://www.python.org/) e disponibiliza diversas rotinas de tratamento e limpeza de dados, sendo utilizado como um *middleware*.

O **Banco de Dados** é o *container* responsável por armazenar, de forma estruturada, todas as informações extraídas a partir dos Diários Oficiais municipais. Ele foi implementado em [PostgreSQL](https://www.postgresql.org/) e outros *containers* utilizam *Data Mappers* para acessá-lo.

A **API do Querido Diário** é o *container* que viabiliza o acesso externo e eficiente aos dados armazenados no banco de dados. Ela foi implementada em [Python](https://www.python.org/), mais especificamente através das bibliotecas [Elastic Search](https://elasticsearch-py.readthedocs.io/en/master/), [Fast-API](https://fastapi.tiangolo.com/) e [SQLAlchemy](https://www.sqlalchemy.org/). Foram utilizados padrões REST e o acesso a esta API se dá por meio de requisições HTTP em formato JSON. Os dois *endpoints* disponíveis atualmente estão descritos a seguir.

**`GET /gazzettes/`**
- **Descrição:** Retorna informações sobre os Diários Oficiais que atendam às características descritas no *payload* da requisição.

- **Atributos do *Payload***
    - **`since`:** Data mínima de publicação dos Diários Oficiais a serem retornados.
    - **`until`:** Data máxima de publicação dos Diários Oficiais a serem retornados.
    - **`keywords`:** Lista das palavras-chave que os Diários Oficiais retornados devem conter.
    - **`page`:** Número da página de resultados a ser retornada.
    - **`page_size`:** Tamanho da página de resultados a ser retornada.

- **Exemplo de *Payload***
    ```json
    { 
        "since": "2020-09-01",
        "until": "2020-10-01",
        "keywords": ["queimadas"],
        "page": 1,
        "page_size": 10
    }
    ```

**`GET /gazzettes/<territory_id>`**
- **Descrição:** Retorna informações sobre os Diários Oficiais que atendam às características descritas no *payload* da requisição e que sejam do município cujo código no IBGE é igual ao **territory_id**.

- **Atributos do *Payload***
    - **`since`:** Data mínima de publicação dos Diários Oficiais a serem retornados.
    - **`until`:** Data máxima de publicação dos Diários Oficiais a serem retornados.
    - **`keywords`:** Lista das palavras-chave que os Diários Oficiais retornados devem conter.
    - **`page`:** Número da página de resultados a ser retornada.
    - **`page_size`:** Tamanho da página de resultados a ser retornada.

- **Exemplo de *Payload***
    ```json
    { 
        "since": "2020-03-01",
        "until": "2020-08-01",
        "keywords": ["medidas", "covid-19"],
        "page": 5,
        "page_size": 100
    }
    ```

O diagrama apresentado na Figura 2 descreve os *containers* que compõem o Querido Diário.

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-containers.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 2 - Diagrama de <i>containers</i> do Querido Diário
    </span>
</div>

Além destes *containers*, futuramente serão implementados outros dois: um para o ***Front-End***, que permitirá o acesso facilitado aos resultados e informações do Querido Diário, e um para **Processamento de Linguagem Natural**, que permitirá a execução de algoritmos de Inteligência Artificial com os dados extraídos.

### Implantação

Até a conclusão deste documento, o processo de implantação do Querido Diário não havia sido concluído e, portanto, nem todas as decisões sobre este tópico estavam disponíveis.

Contudo, já se sabe que o serviço [Spaces Object Storage](https://www.digitalocean.com/products/spaces/) da [Digital Ocean](https://www.digitalocean.com/) será utilizado para a hospedagem de todos os arquivos e que a integração contínua com o código hospedado no [GitHub](https://github.com/) será feita por meio do [Docker Hub](https://hub.docker.com/).

## Componentes

Observando a arquitetura do Querido Diário em mais detalhes, os *containers* descritos anteriormente podem ser subdivididos em componentes.

No Raspador de Diários Oficiais, o componente mais importante talvez seja o **Extrator de Documentos**. Ele é formado por um extenso conjunto de *spiders* do [Scrapy](https://scrapy.org/) que, através de requisições HTTP, recuperam os arquivos dos Diários Oficiais municipais no formato em que estão disponibilizados. Já o componente **Raspador de Dados** é aquele responsável por identificar e executar a forma mais adequada de raspagem das informações contidas nestes arquivos.

É durante essa raspagem de dados que ocorre o uso (como *middleware*) do Pré-Processador de Dados ou, mais especificamente, do conjunto de **Rotinas de Tratamento de Dados** implementadas em [Python](https://www.python.org/) que o compõe. Esses componentes são responsáveis por garantir que, uma vez extraídos, os dados assumam a forma acessível e amigável que se espera deles. A partir deste ponto, o componente **Modelador de Dados** irá garantir que os dados sejam armazenados, estruturando-os adequadamente e enviando-os ao Banco de Dados por meio de *Data Mappers* do [SQLAlchemy](https://www.sqlalchemy.org/).

Já na API do Querido Diário, é possível identificar dois componentes principais. O primeiro deles, a **Interface de Acesso**, utiliza o [Fast-API](https://fastapi.tiangolo.com/) para manipular as requisições HTTP recebidas e extrair os parâmetros de consulta que serão encaminhandos ao Buscador de Dados. Além disso, também é este componente que envia os resultados das consultas aos usuários que realizaram as requisições à API do Querido Diário.

Por fim, o **Buscador de Dados** é o componente responsável por recuperar o conjunto de dados que atenda às especificações dos parâmetros de consulta recebidos. Para isso, o acesso ao Banco de Dados utiliza o [Elastic Search](https://elasticsearch-py.readthedocs.io/en/master/) e os *Data Mappers* do [SQLAlchemy](https://www.sqlalchemy.org/), permitindo que mesmo consultas complexas (como a busca por palavras-chave nos documentos) sejam executadas de forma eficiente. 

O diagrama apresentado na Figura 3 descreve os componentes do Querido Diário que foram citados ao longo desta seção.

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-componentes.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 3 - Diagrama de componentes do Querido Diário
    </span>
</div>

## Visão da Informação

Apesar da grande quantidade de dados que é manipulada pelo Querido Diário, todas as informações podem ser centralizadas no conceito de Diário Oficial.

Inicialmente, o Diário Oficial é um documento **disponibilizado** em algum portal de poder público municipal, geralmente em formatos pouco amigáveis ao processamento por máquina (como PDFs). Por isso, a primeira atividade do Querido Diário é acessá-lo e obtê-lo. Uma vez que o documento foi **recuperado**, as informações de interesse contidas nele precisam ser "raspadas", de modo que o sistema passe a lidar apenas com esse conjunto de dados **extraído**. Durante este processo, o conjunto de dados ainda deve sofrer diversas transformações para que se torne mais acessível e compreensível, ou seja, se torne **tratado**.

Com essas etapas concluídas, o Diário Oficial pode finalmente ser **armazenado** no banco de dados do Querido Diário, onde permanecerá indefinidamente. Finalmente, todas as publicações de Diários Oficiais que forem armazenadas pelo Querido Diário poderão ser **requisitadas** por qualquer indivíduo que tenha interesse em conhecer mais sobre os atos do poder público nos municípios brasileiros.

O fluxo de informações descrito nesta seção está apresentado no diagrama de estados da Figura 4.

<div align="center" style="margin:2rem 0;">
    <img src="visao-informacao.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 4 - Visão da Informação dos Diários Oficiais no Querido Diário
    </span>
</div>
