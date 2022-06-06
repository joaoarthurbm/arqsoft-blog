+++
title = "Documentação Arquitetural do Transtats"
date = 2022-06-06
tags = []
categories = []
+++

# Autores

Este documento foi produzido por:

Dante de Araújo Costa
- Matrícula: 119210045
- Contato: dante.costa@ccc.ufcg.edu.br

Erick Morais de Sena
- Matrícula: 118111393
- Contato: erick.sena@ccc.ufcg.edu.br

Francicláudio Dantas da Silva
- Matrícula: 118210343
- Contato: franciclaudio.silva@ccc.ufcg.edu.br

Gustavo Farias de Souza Silva
- Matrícula: 118210480
- Contato: gustavo.silva@ccc.ufcg.edu.br

- Projeto documentado: https://github.com/transtats/transtats

# Descrição Arquitetural -- Transtats

Este documento descreve a arquitetura da aplicação [Transtats](https://github.com/transtats/transtats). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Transtats

O Transtats é um software open source para auxiliar sistemas que trabalham com versões em diferentes linguagens, agindo na automação de etapas de extração e atualização de recursos de idioma. Além da função de tradução do produto, o software também gera estatísticas do progresso de tradução, procura por erro de traduções, gerencia o progresso de I10n (adaptação de um produto, aplicativo ou conteúdo de documento para atender aos requisitos de idioma, cultura e outros de um mercado-alvo específico), e notifica os membros da equipe responsáveis pela tradução com base nas datas de lançamento.