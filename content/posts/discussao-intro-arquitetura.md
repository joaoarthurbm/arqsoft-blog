+++
title = "Discussão sobre definições de arquitetura de software"
date = 2021-09-07
tags = []
categories = []
+++

---

Este é um documento utilizado como guia para discutir em sala de aula alguns conceitos sobre definições de
arquitetura de software que encontramos na literatura.

---

# Sarah

`A. Jansen and J. Bosch, “Software architecture as a set of architectural design decisions,” in Proceedings of the 5th Working Conference on Software Architecture, pp. 109–120, IEEE, 2005.`

- O que é diferente na visão deles?

- Exemplos?

- Integridade conceitual

- O exemplo de colocar as decisões e os porquês. A ideia de que arquitetura é decisão difícil e dura.

# João Antonio

`Dilip Soni, Robert L. Nord, and Christine Hofmeister. 1995. Software architecture in industrial applications. In Proceedings of the 17th international conference on Software engineering (ICSE '95). Association for Computing Machinery, New York, NY, USA, 196–207.`

- 4 categorias: conceitual, módulo, execução e código

> "Os autores observaram que a separação de preocupações usando diferentes tipos de arquitetura tem uma série de vantagens quando se desenvolve sistemas complexos."

- Aqui tem um conceito interessante que é a evolução da teoria a partir da prática, né? estudos etnográficos, grounded theory etc.

> "Após a categorização e explicação dos tipos de arquitetura, os autores descreveram alguns dos sistemas observados e as vantagens em separar a arquitetura por categoria. Entre tais vantagens estão: diminuir a granularidade da arquitetura, diminuir a complexidade de implementação e melhorar a reutilização e reconfiguração dos sistemas. Os autores apresentaram exemplos para enfatizar os benefícios em dividir as estruturas através da observação de dois sistemas. Nesta análise, é possível verificar a separação das seguintes estruturas:
Separação da arquitetura conceitual e execução
Separação da arquitetura de módulo e execução."

- Mais uma vez: tudo relacionado aos conceitos fundamentais de arquitetura. separação de preocupações, coesão etc.

> "Embora os autores observaram benefícios da separação da arquitetura em diferentes tipos, pouco se fala sobre o esforço necessário em separar e como separar os componentes. Comprometendo assim, a aplicabilidade dessas definições em sistemas reais."

- Mas isso não veio da indústria?

> "Por exemplo, em uma pipeline executada no ambiente AWS com o propósito de executar uma análise OCR-Textract em arquivos após o upload em um bucket; o uso de uma abordagem combinada entre arquitetura conceitual e execução, parece ser mais interessante que separá-las.
"

- Gostei dessa crítica. Fala mais um pouco sobre isso.

# Vinicius Brandao

`D. Garlan and D. E. Perry, “Introduction to the special issue on software architecture,” IEEE Trans. Softw. Eng., 1995.`


> "Desse modo, uma boa arquitetura ajuda na compreensão do código, facilita sua capacidade de reutilização, evolução e análise assim como sua capacidade de gerenciamento do software desenvolvido."

- Foco em como a arquitetura é importante para o desenvolvimento também. A gente foca muito em outros requisitos não-funcionais.

> "Considerando que isso é definido pelos desenvolvedores que em predominantemente optam por arquiteturas informais, não analisáveis. Portanto, os pesquisadores vêm trabalhando em ferramentas  que auxilie esses desenvolvedores e facilite a aplicação de arquitetura para o software.
"
- O que quis dizer com isso?

> "A estrutura dos componentes de um programa / sistema, suas inter-relações, princípios e diretrizes que regem seu design e evolução ao longo do tempo"

# Rodrigo 

`Perry, Dewayne E., and Alexander L. Wolf. "Foundations for the study of software architecture." ACM SIGSOFT Software engineering notes 17.4 (1992): 40-52.`

> "Arquitetura de hardware de computação;"
	- overlap de áreas

> "software architecture = { Elements, Forms, Rationale }, "

- Vamos entender esses 3 conceitos?


> "O sistema é adaptado aos novos usuários e tende a mudar ao longo do tempo, essa necessidade se dá por dois problemas: erosão arquitetônica e deriva arquitetônica."

- Foco na evolução arquitetural. Isso aqui é muito importante. Noção de que a arquitetura é rígida, mas não pode ser fixa.

> "A arquitetura de software não é algo que precise ser conceituado ou engessado, ele deve fluir conforme a solução necessite e atender a necessidade do software."

# Valter

`Gruner, Stefan. "On the historical semantics of the notion of software architecture." TD: The Journal for Transdisciplinary Research in Southern Africa 10.1 (2014): 37-66.NBR 6023.`

> "A tese é de que existem duas principais linhas de pensamento quanto ao que é arquitetura de software. Uma linha está relacionada a conceitos de sistemas operacionais, dado que muitos artigos empregam conceitos emprestados de outras engenharias, e outra linha se relaciona mais à existência de diferentes entidades no software e como se relacionam."

	- discutir mais uma vez sobre a sobrecarga do termo arquitetura.

# Yure

`M. Shaw and P. Clements, "The golden age of software architecture" in IEEE Software, vol. 23, no. 2, pp. 31-39, March-April 2006, doi: 10.1109/MS.2006.58.`

- Trata-se de uma meta-pesquisa, certo?

> se basearam no modelo Redwine-Riddle (de maturação da tecnologia).

- Não conhecia/lembrava. Pode falar um pouco mais.
- Pode ser algo que vocês queiram usar quando estiverem fazendo revisão sistemática, por exemplo [link](https://www.cs.utexas.edu/users/software/1998/pfleeger-19981203/sld005.htm).

> "A figura mostra a maturação do campo de Arquitetura de Software, excluindo as obras fundamentais das décadas de 1960 a 1970.
"
- Essa figura é um resumo bem apresentado do trabalho realizado no artigo. Vale a pena discutirmos em detalhes.

> "Por se tratar de uma análise realizada a quinze anos atrás, naturalmente não contempla o pós “era de ouro”, mas nela vê-se claramente os elementos inovadores que a caracterizaram e notadamente podemos desfrutar hoje de sua maturação. "

- O que a gente consegue ver hoje que não é abordado?













