+++
title = "Documentação arquitetural para a plataforma insomnia"
date = 2021-04-14
tags = []
categories = []
+++

***

# Autor

Este documento foi produzido por Dacio Silva Bezerra.

- Matrícula: 118210572
- Contato: dacio.bezerra@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Kong/insomnia/

# Descrição Arquitetural -- insomnia

Este documento descreve a arquitetura da plataforma [insomnia](https://insomnia.rest/). Esta descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

Há de se notar que esta representação da arquitetura do projeto supracitado, engloba um módulo - o principal deles - específico da aplicação desktop, chamado de **insomnia-app** que se trata do *main* da aplicação desktop, onde ocorrem interações entre front e back utilizando o [Electron](http://electron.atom.io/). 

## Descrição Geral sobre o insomnia

O Insomnia é um aplicativo gratuito de plataforma cruzada para desktop que elimina a dor de interagir e projetar APIs baseadas em HTTP. O Insomnia combina uma interface fácil de usar com funcionalidades avançadas, como [auxiliares de autenticação](https://support.insomnia.rest/article/38-authentication), [geração de código](https://support.insomnia.rest/article/37-code-snippet-generation) e [variáveis de ambiente](https://support.insomnia.rest/article/18-environment-variables). Também existe a opção de assinar um [plano pago](https://insomnia.rest/pricing/) para obter acesso à sincronização de dados criptografados e colaboração em equipe.

