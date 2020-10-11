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

É importante ressaltar que o Querido Diário é composto por módulos cujas implementações estão em repositórios à parte do principal. Por isso, este documento incluirá módulos como a [API do Querido Diário](https://github.com/okfn-brasil/querido-diario-api) e o serviço de [Busca por Palavras-Chave](https://github.com/okfn-brasil/busca-querido-diario). Em contrapartida, o conteúdo de repositórios relacionados que não tem impacto direto no sistema, como o site de divulgação do projeto, não será incluído.

## Descrição Geral

Os Diários Oficiais estão entre as melhores fontes de informação sobre as ações da administração pública brasileira, especialmente por sua granularidade, existindo até mesmo no âmbito municipal. Contudo, mesmo com a [Lei de Acesso à Informação](https://www.gov.br/acessoainformacao/pt-br) vigente, a maioria destas publicações está disponível exclusivamente através de PDFs. 

Nesse cenário, o Querido Diário busca rastrear as fontes destas publicações nos 5.570 municípios brasileiros, extrair as informações ali contidas e, posteriormente, disponibilizá-las na forma de dados abertos.

Ao criar uma fonte confiável e centralizada para estas informações, o Querido Diário poderá fomentar muitos avanços nas ferramentas de fiscalização da administração pública brasileira, bem como auxiliar a sociedade civil no acompanhamento dos atos públicos municipais.

## Contexto

Os usuários do Querido Diário formam um grupo muito heterogêneo, contemplando desde servidores públicos e jornalistas até organizações não-governamentais de controle social. De forma geral, todos os cidadãos que busquem acesso aos atos públicos dos municípios brasileiros são potenciais usuários deste *software*.

Ainda assim, é possível dividí-los em dois grupos principais: a **sociedade civil** e as **ferramentas de fiscalização da administração pública**. Ambos utilizam o Querido Diário como fonte centralizada e confiável de informação acerca dos Diários Oficiais municipais. Contudo, diferenciam-se à medida que as ferramentas de fiscalização não usam os dados disponibilizados apenas como fonte de informação. Elas vão além, aplicando-os na identificação de padrões, detecção de problemas e promoção de impactos positivos na administração pública das cidades brasileiras.

Para atender às demandas desses dois grupos de usuários, o Querido Diário precisa acessar uma grande quantidade de **portais dos poderes públicos municipais** nos quais os Diários Oficiais são disponibilizados. A partir dos PDFs encontrados, as informações de interesse são extraídas e estruturadas adequadamente para que possam ser, posteriormente, disponibilizadas.

O diagrama apresentado na Figura 1 descreve sucintamente o contexto em que o Querido Diário está inserido.
