+++
title = "Documentação Arquitetural do Appwrite"
date = 2021-04-15
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Jessé Souza Cavalcanti Neto.

- Matrícula: 117110637
- Contato: jesse.neto@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/appwrite/appwrite

# Descrição Arquitetural -- Appwrite

Este documento descreve a arquitetura do serviço [Appwrite](https://github.com/appwrite/appwrite).
As descrições e diagramas aqui presentes foram produzidos usando como base o modelo [C4](https://c4model.com/).

É importante destacar que o foco principal da análise não serão os vários serviços que o appwrite fornece, e sim seu funcionamento principal baseado em microserviços.

# Descrição Geral sobre o Appwrite

O Appwrite é um servidor backend end-to-end que tem como objetivo abstrair grande parte da complexidade, muitas vezes repetitivas, na construção de aplicativos modernos. O serviço é composto por um conjunto de APIs, ferramentas e um console para gerenciamento que auxiliam no desenvolvimento de diversas features, tais como:

 - Gerenciamento de conta
 - Autenticação
 - Preferências do usuário
 - Persistência de banco de dados
 - Funções de nuvem
 - Manipulação de Imagens
 - Dentre outros serviços

Além disso tudo, o Appwrite é **cross-platform**, ou seja, é possível executar em qualquer lugar independente de sistema operacional, linguagem de programação, framework ou plataforma, permitindo uma fácil integração com vários serviços distintos.   


