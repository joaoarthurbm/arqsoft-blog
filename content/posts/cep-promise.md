+++
title = "Arquitetura do cep-promise"
date = 2021-04-16
tags = []
categories = []
+++
 
# Autores
 
Este documento foi produzido por Diego Amancio Pereira.
 
- Matrícula: 116210716
- Contato: diego.pereira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/BrasilAPI/cep-promise
 
# Descrição Arquitetural - cep-promise
 
Neste documento, é descrito um serviço de consulta de cep, o [cep-promise](https://github.com/BrasilAPI/cep-promise). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).
 
## Descrição geral sobre o cep-promise
 
O cep-promise é uma biblioteca de busca por cep de forma concorrente  com alta disponibilidade integrado com 3 serviços (Correios, ViaCEP e WideNet).
 
### Objetivos Específicos
 
Disponibilizar uma busca por cep rápida , eficiente sem depender totalmente de um serviço de busca de cep e ter fácil de utilização;