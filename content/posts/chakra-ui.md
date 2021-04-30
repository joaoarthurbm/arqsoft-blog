+++
title = "Chakra UI"
date = 2021-04-16
tags = []
categories = []
+++

# Autores

Este documento foi produzido por Lucas Arcoverde do Nascimento.

- Matrícula: 115211049
- Contato: lucas.arcoverde.nascimento@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/chakra-ui/chakra-ui

# Descrição Arquitetural -- Chakra UI

Este documento descreve parte da arquitetura do projeto [Chakra UI](https://github.com/chakra-ui/chakra-ui). Essa descrição foi baseada principalmente no modelo C4.

## Descrição Geral sobre o Chakra UI

Chakra é um framework React que implementa um design system buscando facilitar o desenvolvimento de aplicativos ou sites provendo diversas funcionalidades, como por exemplo: Biblioteca de componentes, tema opnionado e adição de estilos utilizando css-in-js.

### Objetivos

Fornecer uma ferramenta simples com um conjunto de componentes e funcionalidades que supram as necessidades do dia a dia quando estamos desenvolvendo interfaces de usuário reais e enfrentando problemas de design.

### Objetivos Específicos

- **Props de estilo:** Todos os estilos podem ser sobrescritos e extendidos utilizando uma propriedade fornecida por todos os componentes.

- **Simplicidade:** Construir uma UI deve ser simples e intuitivo, para isso as propriedades dos componentes, assim como sua API, são implementados com base nesse cenário real em que eles serão usados.

- **Composição:** Quebrar componentes em peças menores para diminuir a complexidade de usá-los e, assim, tornar os estilos e as funcionalidades do componente flexiveis e extensiveis.

- **Acessibilidade:** Um dos requisitos mais importantes quando está sendo construído uma UI. Sendo assim, o Chakra provê componentes acessiveis e também funcionalidades que tornam fácil aplicar acessibilidade do lado da aplicação.

### Contexto

![fig1](context.png)

O Chakra-ui é um framework React que implementa um frontend design system e provê um conjunto de funcionalidades tornando mais simples construir páginas web.

### Containers

O chakra-ui é composto por 6 containeres descritos a seguir.

**chakra-ui/react** - Responsável por unir e expor para a aplicação todas as funcionalidades do sistema.

**componentes** - O conjunto de componentes fornecidos, como por exemplo: `Button`, `Radio`, `Checkbox` etc.

**chakra-ui/hooks** - Responsável por implementar todos os [react hooks](https://pt-br.reactjs.org/docs/hooks-intro.html) que são utilizados pelos componentes.

**chakra-ui/system** - Responsável pelo comportamento interno da criação de componentes, aplicação de estilos.

**chakra-ui/styled-system** - Responsável por criar o objeto do CSS em javascript com a lógica de parsing de estilos e propriedades CSS customizadas e nativas react.

**chakra-ui/transition** - Responsável por fornecer um conjunto de componentes com animação. Por exemplo: `Collapsible`, `Fade`, `Slide`, etc.

![fig2](containers.png)

### Componentes

Pode-se dividir o **chakra-ui/system** em outro componente **emotion/react** e o **chakra-ui/transition** em **framer-motion**.

**emotion/react** Componente responsável por fazer toda a lógica de transformar os objetos CSS javascript em CSS nativo, fazendo todas as operações necessárias para que os estilos sejam aplicados corretamente nos componentes react.

**framer-motion** Componente responsável por lidar com as animações, provendo componentes React e funcionalidades par aplicação de estilos.

![fig3](components.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

![fig4](info.png)
