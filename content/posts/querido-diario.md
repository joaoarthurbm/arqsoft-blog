+++
title = "Documento arquitetural do Querido Diário"
date = 2020-10-06
tags = []
categories = []
+++

***

# Autores

Este documento foi produzido por Matheus Alves dos Santos.

- Matrícula: 117110503
- Contato: matheus.santos@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/okfn-brasil/querido-diario

# Descrição Arquitetural -- Querido Diário

Este documento descreve a arquitetura do projeto [Querido Diário](https://github.com/okfn-brasil/querido-diario) da *[Open Knowledge Brasil](https://github.com/okfn-brasil)*, baseando-se especialmente no modelo [C4](https://c4model.com/).

É importante ressaltar que o Querido Diário é composto por módulos cujas implementações estão em repositórios à parte do principal. Assim, este documento incluirá a [API do Querido Diário](https://github.com/okfn-brasil/querido-diario-api) e o serviço de [Busca por Palavras-Chave](https://github.com/okfn-brasil/busca-querido-diario).  

Em contrapartida, não serão incluídos os repositórios que contêm o site do projeto, os *scripts* de automação de seu *deployment* ou as análises dos dados produzidos.

## Descrição Geral

Os Diários Oficiais são uma das melhores fontes de informação sobre as ações da administração pública brasileira, especialmente por sua granularidade, existindo até mesmo no âmbito municipal. Contudo, mesmo com a [Lei de Acesso à Informação](https://www.gov.br/acessoainformacao/pt-br) vigente, a maioria destas publicações está disponível exclusivamente através de PDFs. 

Nesse cenário, o Querido Diário busca rastrear as fontes destas publicações em todo o Brasil, extrair as informações ali contidas e, posteriormente, disponibilizá-las na forma de dados abertos. Ao criar uma fonte confiável e centralizada para estas informações, o Querido Diário poderá fomentar muitos avanços nas ferramentas de fiscalização da administração pública brasileira. 

## Contexto

Os principais usuários do Querido Diário se dividem em dois grupos: a **sociedade civil** e as **ferramentas de fiscalização da administração pública**. Ambos o utilizam como fonte centralizada e confiável de informação acerca dos Diários Oficiais municipais e, consequentemente, sobre as ações do poder público brasileiro. Contudo, diferenciam-se à medida que as ferramentas de fiscalização não usam os dados disponibilizados apenas como fonte de informação. Mas vão além, usando-os para identificar padrões, detectar problemas e promover impactos positivos na administração pública das cidades brasileiras.

Para atender às demandas desses dois grupos de usuários, o Querido Diário precisa acessar uma grande quantidade de **portais dos poderes públicos municipais** nos quais os Diários Oficiais são disponibilizados. A partir dos PDFs encontrados, as informações de interesse são extraídas e estruturadas adequadamente para que possam ser disponibilizadas posteriormente.

O diagrama apresentado na Figura 1 descreve sucintamente o contexto em que o Querido Diário está inserido.

<div align="center" style="margin:2rem 0;">
    <img src="diagrama-contexto.png" style="width:95%;">
    <span style="display:block;font-weight:bold;">
        Figura 1 - Diagrama de Contexto do Querido Diário
    </span>
</div>
