+++
title = "Discussão sobre erosão arquitetural"
date = 2021-09-07
tags = []
categories = []
+++

---

Este é um documento utilizado como guia para discutir em sala de aula alguns artigos sobre erosão arquitetural.

---

# Vinícius Brandão Araújo



`Design erosion: problems and causes. Jilles van Gurp and Jan Bosch. Journal of systems and software 61.2, 2002.`


- Fala mais um pouco sobre o caso do Mozilla.


"O artigo traz consigo as possíveis causas que levam ao problema de erosão de software. Desse modo, os autores elencam diversas causas que levam a esse problema, tais como o aumento do custo de manutenção para grandes sistemas, adição de novas funcionalidades não planejadas, métodos iterativos entre outros."

	- Vamos falar mais sobre essas causas.



 "não importa o quão ambiciosas sejam as intenções dos arquitetos, as arquiteturas de software tendem a se desgastar com o tempo, a ponto de redesenhar do zero se tornar uma alternativa viável em comparação com o prolongamento da vida útil da arquitetura existente."

 	- Comparação com um processo natural de evelhecimento.


 "Porém,Porem, acredito que mesmo com essa afirmação faltou um embasamento maior dos autores para um estudo de caso mais específico de projetos grandes da indústria, explanando com mais detalhe como ocorreu e consequentemente uma pesquisa com os desenvolvedores desses projetos para medir no aspecto de desenvolvimento o que levou ao problema de erosão. "

 	- Crítica à metodologia.

 "Por fim, a metodologia abordada de explicação através de um exemplo traz ao leitor uma visão interessante de como ocorre o problema de erosão, portanto, até leitores que não teve a experiência de participar de um desenvolvimento de software consegue ter domínio e identificar onde e como ocorre erosão de softwares."

 	- Sobre didática do artigo. A tripla problema-causa-remédio.


# Valter Vinícius Marinho de Lucena


`Assessing architectural drift in commercial software development: a case study.
Jacek Rosik, Andre Le Gear, Jim Buckley, Muhammad Ali Babar e Dave Connolly, 2010.`

" A abordagem utilizada foi a Reflexion Modelling, e o estudo acompanhou um time durante a criação de um sistema de software comercial. "

	- Vamos discutir um pouco mais essa abordagem.

"Os resultados mostraram que a abordagem utilizada, ao contrário do que era esperado, oculta algumas das inconsistências que aconteceram durante o desenvolvimento. "

	- Pode dar mais detalhes? Como a abordagem serviu para ocultar inconsistências?

"Os autores propõem, também, checagens contínuas da arquitetura, assim como geração de alertas através da integração das checagens nas próprias IDEs utilizadas pelos desenvolvedores, uma vez que, quanto mais tempo um erro existe no código, mais complicado é resolvê-lo. "

	- Importância da inclusão perene no processo de desenvolvimento. 

"não existe uma solução única para o problema do desvio arquitetural."

	- *No silver bullet.*

# Vinícius de Medeiros Soares

`VAN GURP, Jilles; BOSCH, Jan; BRINKKEMPER, Sjaak. Design erosion in evolving software products. In: ELISA workshop. 2003.`

"O trabalho tem foco em entender a erosão arquitetural no contexto de grandes projetos, e as questões de pesquisa que são respondidas através dos estudos de caso podem servir como base para a evolução de qualquer empresa em relação a como identificar, resolver e prevenir a erosão."

	- Quais foram as questões de pesquisa?

"Os autores concluíram antecipadamente que a erosão arquitetural é inevitável, por isso o estudo focou em como lidar com essa erosão, ao invés de como preveni-la."

	- De novo, um processo "natural".

"Outro aspecto apontado é que além de fatores técnicos, há fatores não técnicos que contribuem para a erosão arquitetural."

	- Quais?

"Os autores destacam na conclusão que a habilidade de lidar com a erosão é mais importante que a prevenção."

	- Vamos discutir um pouco mais sobre isso.

# João Antonio Leite Dos Santos Neto

`Eick, Stephen G., et al. "Does code decay? assessing the evidence from change management data." IEEE Transactions on Software Engineering 27.1 (2001): 1-12.NBR 6023`

"O presente artigo tem como objetivo avaliar como as mudanças em sistemas de larga escala impactam negativamente na qualidade do código."

	- Como foi feito?

"criaram um modelo conceitual para auxiliar na identificação de causas, sintomas e fatores de riscos para a decadência de código."

	- Mais uma vez essa perspectiva de problema-causa-ação/remédio.

"Um código é considerado em decadência quando é mais difícil de mudar do que deveria ser, em três perspectivas: O custo (esforço) da mudança, que é efetivamente a quantidade de pessoas necessárias para implementar tais mudanças; O intervalo  para completar a mudança, ex:  o calendário/e horas necessárias para implementar as mudanças; Qualidade do software alterado."

	- A tripla: custo, tempo e qualidade. Sempre ela em Engenharia de Software.
	- Como medir quão difícil?

# Yure Pereira Campos

`C. Izurieta and J. M. Bieman, "How Software Designs Decay: A Pilot Study of Pattern Evolution" First International Symposium on Empirical Software Engineering and Measurement (ESEM 2007), 2007, pp. 449-451, doi: 10.1109/ESEM.2007.55.`


## Hipóteses

- H1,0: Existem poucas violações estruturais das realizações de padrões de design.

- H2,0: O número de relacionamentos externos de uma realização de padrão de design permanece o mesmo ao longo do tempo.

- H3,0: A organização do namespace dos componentes que compõem um padrão de design permanece a mesma ao longo do tempo.

	- Vamos discutir um pouco essas hipóteses.

"deterioração do design é uma consequência da evolução do software,"
	- deterioração como consequência.
































