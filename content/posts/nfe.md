+++
title = "Java NF-e"
date = 2021-04-17
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Eddie Kaleb Lopes Fernandes.

- Matrícula: 117110271
- Contato: eddie.fernandes@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Samuel-Oliveira/Java_NFe

# Descrição Arquitetural -- Java NF-e/NFC-e

Este documento descreve parte da arquitetura do projeto [Java NF-e](https://github.com/Samuel-Oliveira/Java_NFe). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do Java NF-e. O foco aqui é a descrição de um serviço específico de análise do twitter, que é parte fundamental do projeto.

## Descrição Geral sobre o Java NF-e

O Java NF-e é um projeto que tem como objetivo prover uma biblioteca de [NF-e](https://www.nfe.fazenda.gov.br/portal/principal.aspx) (Nota Fiscal Eletrônica) para a linguagem Java, capaz de realizar emissão e algumas operações como: consulta, cancelamento, correção, inutilização, etc. A biblioteca faz desde a criação do arquivo xml baseado nos [layouts](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=5pZysswpAsg=) até a comunicação com os servidores da Sefaz espalhados por todo o Brasil.

