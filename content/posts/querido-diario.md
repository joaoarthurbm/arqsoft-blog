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

Este documento descreve a arquitetura do projeto [Querido Diário](https://github.com/okfn-brasil/querido-diario) da *[Open Knowledge Brasil](https://github.com/okfn-brasil)*, baseando-se sobretudo no modelo [C4](https://c4model.com/).

É importante ressaltar que o Querido Diário é composto por módulos cujas implementações estão em repositórios à parte do principal. Assim, este documento incluirá a [API do Querido Diário](https://github.com/okfn-brasil/querido-diario-api) e o serviço de [Busca por Palavras-Chave](https://github.com/okfn-brasil/busca-querido-diario).  

Em contrapartida, não serão incluídos os repositórios que contêm o site do projeto, os *scripts* de automação de seu *deployment* ou a análise dos dados produzidos.
