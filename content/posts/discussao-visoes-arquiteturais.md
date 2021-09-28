+++
title = "Discussão sobre visões arquiteturais"
date = 2021-09-07
tags = []
categories = []
+++

---

Este é um documento utilizado como guia para discutir em sala de aula alguns conceitos sobre visões arquiteturais.

---

# Vinicius Brandão

`Baragry, Jason, and Karl Reed. "Why we need a different view of software architecture." Proceedings Working IEEE/IFIP Conference on Software Architecture. IEEE, 2001.`

- por que a associação faz mal?

# Rodrigo Santos

`Kruchten, Philippe B. "The 4+ 1 view model of architecture." IEEE software 12.6 (1995): 42-50.`

"Visão Lógica: Descreve o modelo de objeto do projeto quando um método de projeto orientado a objeto é usado. Para projetar um aplicativo que é muito orientado a dados, você pode usar uma abordagem alternativa para desenvolver alguma outra forma de visão lógica, como um diagrama de entidade - relacionamento.

Visão de Processo: Descreve os aspectos de simultaneidade e sincronização do projeto.

Visão Física: Descreve o mapeamento do software no hardware e reflete seu aspecto distribuído.

Visão de Desenvolvimento: descreve a organização estática do software em seu ambiente de desenvolvimento.
"

- Vamos discutir um pouco sobre cada visão proposta. Vamos debater essas com as que vimos em sala de aula. Essas visões são "atuais"? Como vemos o mundo de desenvolvimento de software hoje se encaixando nessas visões?

- O conceito de +1.

"A arquitetura por si só deve se tornar estável e não se deve encontrar novas abstrações, subsistemas, processos ou interfaces importantes após a construção inicial."

- Isso significa que a arquitetura não deve evoluir?

# Sarah Albuquerque

`Kruchten, Philippe B. "The 4+ 1 view model of architecture." IEEE software 12.6 (1995): 42-50.`

"Pontos de destaque são que as diferentes arquiteturas não são completamente independentes; o processo proposto não é linear, requer algumas iterações para se estruturar a arquitetura; não é necessário usar as 05 perspectivas.
"

- O que siginifica não ser linear?

# Valter

`Baragry, Jason, and Karl Reed. "Why we need a different view of software architecture." Proceedings Working IEEE/IFIP Conference on Software Architecture. IEEE, 2001.`

"O principal problema não é a falta de resposta para as questões que surgem, e sim a grande quantidade de respostas diferentes."

- Relação com integridade conceitual na área.

"Enquanto essas analogias facilitam a criação dos conceitos de desenvolvimento de software, elas falham em considerar adequadamente as diferenças entre desenvolvimento e outras disciplinas da área de Engenharia de Software."

- Importância da escolha de metáforas. Ajudam, mas podem atrapalhar também. Qual é o caso aqui?

"A análise dessas falhas foi muito bem desenvolvida no artigo, desde a categorização até a discussão dos principais aspectos de cada uma. "

- Vamos discutir um pouco mais esse tópico?

# João Neto

"Os autores encontraram 3 categorias no qual a analogia falha, sendo elas: Diferenças entre software  sistemas projetados tradicionalmente,   diferenças entre o conteúdo abordado sobre visões arquiteturais nas respectivas disciplinas (software e engenharia tradicional) e as diferenças entre como essas visualizações são usadas no processo de desenvolvimento."

- Vamos detalhar essas categorias e discutir melhor.

"Por exemplo, quanto a diferença entre sistemas, os produzidos pela engenharia tradicional, tem forma física (ex: documentos) e tangibilidade que permite identificar sua arquitetura. Por outro lado, na engenharia de software você não consegue identificar a arquitetura olhando apenas para as linhas do código fonte do sistema. Portanto, sistemas de software não tem forma física análogo, logo não são tangíveis e  suas representações de nível, abstração e de design devem ser diferentes para aqueles produzidos pelo mesmo nível de design na engenharia tradicional. Além disso, o conteúdo das visões de arquitetura como ponto de vista de subconjuntos orientados do design ou implementação global não é apresentado em visualizações de arquitetura de software, uma vez que  em sistemas tradicionais não é abordado como o sistema vai operar, e sim como esse aspecto do sistema existirá como um artefato físico."

- Importante destacar essa exemplificação.

"No entanto, acredito que é de grande importância o uso de analogias para os casos em que tal mecanismo pode ser aplicado. Uma vez que ajuda na didática e entendimento do sistema em uma perspectiva de mais alto nível. "

- Interessante esse contraponto.