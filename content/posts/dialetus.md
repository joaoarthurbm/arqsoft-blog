+++
title = "Documentação arquitetural para o Dialetus"
date = 2021-04-15
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Almir Gonçalves Crispiniano.

- Matrícula: 117210914
- Contato: almir.crispiniano@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/dialetus/dialetus-service

# Descrição Arquitetural -- Dialetus

Este post descreve a arquitetura do projeto [Dialetus](https://github.com/dialetus). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

## Descrição Geral sobre o Dialetus

O Dialetus é um plataforma que permite pesquisar diferentes sinônimos em um dicionário informal através de uma API Rest em Node.js.

### Objetivo Geral

Como possuímos um país multicultural, a aplicação tem como objetivo central permitir encontrar diferentes palavras da língua portuguesa a partir dos diferentes traços linguísticos-culturais encontrados nas cinco regiões brasileiras. Sua ideia surgiu de uma reunião de amigos que apenas se conheciam pela internet para então se tornar um projeto totalmente colaborativo, trazendo a diversidade cultural de cada um para assim possibilitar um aprofundamento na cultura cotidiana do nosso português brasileiro.

### Objetivos Específicos

Para alcançar os objetivos gerais o [Dialetus](https://dialetus.com) provê uma API Rest codificada em Node.js com um database local formado por jsons e uma lista de svgs que representam as bandeiras dos estados. Com a aplicação é possível buscar dialetos de maneira geral e também por regiões. Seus diferentes endpoints utilizam o método GET e sua implementação encontra-se no heroku.app. O frontend da aplicação foi desenvolvido utilizando React.