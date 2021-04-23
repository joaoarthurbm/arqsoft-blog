+++
title = "Documentação Arquitetural do Dispatch"
date = 2021-04-14
tags = []
categories = []
+++
 
# Autores
 
Este documento foi produzido por Lucas de Medeiros Nunes Fernandes.
 
- Matrícula: 117110210
- Contato: lucas.medeiros.fernandes@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Netflix/dispatch
 
# Descrição Arquitetural -- Dispatch
 
Este documento descreve a arquitetura do projeto [Dispatch](https://github.com/Netflix/dispatch), desenvolvido pela Netflix. Essa descrição, assim como a produção de seus diagramas, foi baseada principalmente no modelo [C4](https://c4model.com/).
 
 
## Descrição Geral sobre o Dispatch
 
O Dispatch é uma solução ad-hoc para auxílio no processo de abertura, acompanhamento e fechamento de incidentes de segurança de uma aplicação ou plataforma.
 
Ele ajuda a gerenciar tais incidentes de maneira eficaz, oferecendo integração com ferramentas comumente utilizadas por organizações, como Slack, GSuite, Jira, Zendesk etc. Ao aproveitar a familiaridade existente entre todas essas ferramentas, é provido um orquestrador de incidentes e notificações, ao invés de ter que gastar esforços em integrações individuais para cada uma.
 
Ou seja, com o Dispatch, as preocupações relacionadas em criar recursos, reunir participantes, enviar notificações, rastrear tarefas e auxiliar nas revisões pós-incidentes são praticamente reduzidas a zero, permitindo que o time realmente se concentre apenas em resolver o problema!
