+++
title = "Beagle"
date = 2022-06-20
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Ana Carolina Chaves, Deilton Lopes, Franklin Regis e Luan Carvalho.

- Projeto documentado: https://docs.usebeagle.io/v2.0/

- Matrícula: 118110388
- Contato: ana.vasconcelos@ccc.ufcg.edu.br

# Descrição Arquitetural -- Beagle.

Beagle é uma estrutura open source que ajuda os desenvolvedores a implementar a interface por Server-Driven UI de maneira multiplataforma.

## Descrição Geral sobre o Beagle

Beagle é uma estrutura de código aberto para desenvolvimento multiplataforma usando o conceito de UI orientada a servidor.

## O framework Beagle

### Objetivo Geral

Ao usar o Beagle, os desenvolvedores podem:

- Alterar rapidamente um layout de aplicativo, dados, fluxo de navegação ou até mesmo lógica , apenas alterando o código no back-end.
- Ser mais independente das lojas de dispositivos móveis , como App Store e Play Store, porque a maioria das alterações não precisa de uma atualização de aplicativo.
- Ter mais confiança de que os aplicativos se comportarão de maneira semelhante em diferentes plataformas , pois o código será compartilhado e padronizado entre backend e frontend.
- Testar facilmente novas hipóteses de negócios ou faça correções ao vivo em aplicativos para melhorar a experiência dos usuários e receber feedback.

### Objetivos Específicos

- As telas são renderizadas a partir de um json, essa biblioteca tem uma engine que vc envia um json e ele renderiza para uma tela nativa e isso facilita o seu controle e possiveis modificações.
- O Beagle, por ser Server-Driven UI, sua API informa ao cliente quais componentes irão renderizar e com qual conteúdo. Diante disso, o código pode ser implementado nas mais diversas plataformas e com isso entra-se o poder do Beagle que vai ajudar o desenvolvedor a aplicar esse conceito de uma forma padronizada entre elas.
- Além disso, você consegue construir fluxos de ponta a ponta apenas utilizando esse framework.
- Também é facilita diretamente na comunicação entre componentes e você consegue fazer isso facilmente.

### Contexto

No primeiro nível, podemos ver a aplicação em uma perspectiva macro, os atores, seus papéis e também como eles interagem entre si. 

- O objetivo principal é representar o produto em sua forma mais abstrata.

![context](contexto-beagle.png)




