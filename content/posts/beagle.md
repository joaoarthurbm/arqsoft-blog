+++
title = "Documentação Arquitetural - Beagle"
date = 2022-06-06
tags = []
categories = []
+++

# Autores

Este documento foi produzido pela equipe abaixo:

---
- Nome: Ana Carolina Chaves de Vasconcelos
- Matrícula: 118110388
- Contato: ana.vasconcelos@ccc.ufcg.edu.br
---
- Nome: Franklin Regis de Oliveira
- Matrícula: 119210030
- Contato: franklin.oliveira@ccc.ufcg.edu.br
---
- Nome: Deilton Vasconcelos Figueiredo Lopes
- Matrícula: 119210094
- Contato: deilton.lopes@ccc.ufcg.edu.br
---
- Nome: Luan Carvalho Pedrosa
- Matrícula: 119210986
- Contato: luan.pedrosa@ccc.ufcg.edu.br


# Descrição Arquitetural do Beagle

Neste website, pode-se conferir a [Arquitetura do Beagle](https://docs.usebeagle.io/c4model/en/#/HOME). Todo o sistema foi documentado se baseando no modelo [C4](https://c4model.com/). Dos "C"s, apenas o quarto "C", código, não foi feito pelos desenvolvedores do sistema.


## Descrição Geral do Beagle

[Beagle](https://github.com/ZupIT/beagle-c4model/tree/v1.0.1) é uma estrutura de código aberto que ajuda os desenvolvedores a implementar a interface do usuário orientada a servidor de maneira multiplataforma .
  
Ao usar o Beagle, os desenvolvedores podem:
* Alterar rapidamente um layout de aplicativo, dados, fluxo de navegação ou até mesmo lógica, apenas alterando o código no back-end.
* Ser mais independente das lojas de dispositivos móveis, como App Store e Play Store, porque a maioria das alterações não precisa de uma atualização de aplicativo.
* Ter mais confiança de que os aplicativos se comportarão de maneira semelhante em diferentes plataformas, pois o código será compartilhado e padronizado entre backend e frontend.
* Testar facilmente novas hipóteses de negócios ou fazer correções ao vivo em aplicativos para melhorar a experiência dos usuários e receber feedback.

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

## Contexto

No primeiro nível, podemos ver a aplicação em uma perspectiva macro, os atores, seus papéis e também como eles interagem entre si. O desenvolvedor, ao possuir uma aplicação que deseja integrar com o Beagle, faz as configurações iniciais e de Infraestrutura para se conectar ao Beagle, que então fornecerá as APIs necessárias para criar e manipular componentes Beagle.

- O objetivo principal é representar o produto em sua forma mais abstrata.

![context](beagle/contexto-beagle.png)
<center>Figura 1. Diagrama de contexto do Beagle</center>


## Componentes

Para melhor exibição, nas Figuras 3, 4 e 5 estão mostrados os componentes de três containers: Backend, Android e Web. 

No Backend do Beagle, existem duas formas de manipular os Models e Contexts da biblioteca, através de um sistema Typescript e outro Kotlin. Nos dois sistemas, uma biblioteca padrão Beagle é criada e contém modelos que possuem contexto, operações, ações e interfaces para interagir com a aplicação do usuário de forma dinâmica e flexível.

![components-backend](beagle/componentes-backend.png)
<center>Figura 3. Diagrama de componentes para o Beagle Backend</center>


## Visão da Informação

As principais informações coletadas e manipuladas pelo sistema são as da aplicação do usuário, que precisa fornecer parte dos seus dados para que as interfaces sejam geradas e distribuídas pelo backend do Beagle. Apesar de diferentes sistemas frontend poderem ser usados (Android, Web, iOS), o mesmo Backend Beagle é acessado, e a interface então é devolvida ao usuário, com as informações e personalizações que ele forneceu, como pode ser visto na Figura 6.

![components-backend](beagle/information.png)
<center>Figura 6. Máquina de estados para a transferência de informação das aplicações no Beagle</center>