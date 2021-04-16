+++
title = "Documentação arquitetural do Meu Menu"
date = 2021-04-16
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Vitória Heliane.

- Matrícula: 117110666
- Contato: vitoria.sobrinha@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/proj-comp-20201e

# Descrição Arquitetural -- Meu Menu

Este documento descreve parte da arquitetura do [Meu Menu](https://github.com/proj-comp-20201e). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do Meu Menu. O foco aqui é a descrição de um serviço específico desse sistema, que é parte de geração estática da página do menu.

## Descrição Geral sobre o Meu Menu

A proposta do Meu Menu é possibilitar aos pequenos empreendedores a criação do seu menu de serviços e/ou produtos disponibilizados para os seus clientes. Esse menu ficará hospedado na plataforma, podendo ser acessado por todos os clientes do estabelecimento através de uma URL. Além disso, também há a opção de gerar um QRCode que redireciona para essa URL, o qual pode ser impresso ou compartilhado. Outra possibilidade é a de exportar o menu no formato de PDF ou PNG, assim ele pode imprimir e disponibilizar no seu estabelecimento ou compartilhar nas suas redes sociais.

### Serviço de Geração de Páginas Estáticas para o Menu

### Objetivo Geral

Implementar um serviço de criação de páginas web estáticas a partir das configurações de menu e seus produtos/serviços cadastrados.

### Objetivos Específicos

A partir da criação de um menu e a adição dos seus produtos/serviços, é desejado que seja criada um página web com essas informações e com as configurações de estilo feitas pelo usuário. Essa página deve ser estática para que os clientes dos usuários tenham uma boa experiência de uso e que seja rebuildada sempre que houver alguma mudança nas informações do menu a fim de manter a consistência das informações na página.

