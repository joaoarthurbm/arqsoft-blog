+++
title = "Documentação arquitetural Moodle"
date = 2021-04-13
tags = []
categories = []
+++

# Autor

Este documento foi produzido por Talita Galdino Gouveia.

- Matrícula: 118111778
- Contato: talita.gouveia@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/moodle/moodle

# Descrição Arquitetural - Moodle

<div align="center">
	<img src="logo.png" style="width: 25rem;">
</div>

Este documento descreve a arquitetura do projeto [Moodle](https://github.com/moodle/moodle), baseando-se no modelo [C4](https://c4model.com/).

## Descrição geral sobre o Moodle

O moodle é uma plataforma de aprendizagem open source projetada para dar suporte a professores, alunos e administradores. Criado para possibilitar uma melhor experiência no ensiono a distância o moodle é usado por diversas escolas e universidades atualmente, inclusive a UFCG. Além do suporte a esses tipos de usuário, ele permite a personalização dos seus ambientes.


## O Serviço de plataforma de ensino do Moodle

### Objetivo Geral

Implementar uma plataforma que possibilite uma melhor experiência tanto para professores como para alunos no ensino remoto, fornecendo toda a infraestrutura necessária para construir um ambiente de gestão de aprendizagem.


### Objetivos específicos

No moodle é possível que professores e alunos tenham uma interação clara e organizada no ensino remoto. Os professores podem criar turmas, fóruns, passar e corrigir atividades, dentre outras funcionalidades. Além disso os alunos recebem de forma clara e simples os conteúdos e atividades para que sejam avaliados.


### Contexto

Como foi dito anteriormente a aplicação fornece um ambiente de ensino online e possibilita que cursos sejam criados e nesses cursos adicionados alunos ou convidados. O curso oferece um ambiente onde um professor pode criar fóruns, fornecer conteúdo em forma de texto ou vídeo, passar atividades e atribuir notas para os seus alunos, além de fornecer os dados sobre sua turma.

O moodle pode ser definido como um núcleo que poderá possuir plugins que fornecem funcionalidades específicas. Com isso pode-se dizer que a aplicação poderá comunicar-se usando diferentes APIs que são adaptadas para cada tipo de funcionalidade. Os plugins são componentes opcionais que estendem as funcionalidades do moodle. Visto que são funcionalidades opcionais podem ser adicionadas diversas comunicações externas, no exemplo do diagrama terão apenas duas como exemplo.


<div align="center" style="padding: 50px">
	<img src="contexto.jpeg" style="width: 35rem;">
	<span style="display:block;font-weight:bold;">
    Figura 1 - Diagrama de contexto do Moodle
  </span>
</div>

### Containers

Podemos definir o moodle como um agregado de muitos plugins. A API dele fornece as funcionalidades básicas da aplicação, que podem ser extendidas com os plugins. A API é REST e a comunicação é feita com o protocolo HTTP transportando os dados por JSON.  Nele existe o script de transição em PHP usado para gerar uma página. São duas camadas para a apresentação da lógica o tema que é a camada vista pelo usuário, e os renderizadores que geram o HTML à partir dos dados que os scripts de transição forneceram. O banco de dados do moodle feito em MySQL é composto por diversas tabelas, as tabelas centrais e as que pertecem aos plugins que foram adicionados ao sistema. Mas as tabelas de um plugin só se vinculam umas às outras ou a algumas centrais.

<div align="center" style="padding: 50px">
	<img src="containers.png" style="width: 35rem;">
	<span style="display:block;font-weight:bold;">
    Figura 2 - Diagrama de containers do Moodle
  </span>
</div>

### Componentes

O Moodle possui uma série de APIs principais que fornecem ferramentas para os scripts do Moodle. Alguns exemplos de APIs mais usadas são:

- API de acesso: fornece funções para que você possa determinar o que o usuário atual tem permissão para fazer
- API de manipulação de dados: permite que você leia / grave em bancos de dados de maneira consistente e segura

Existem diversas outras APIs no moodle que podem ser encontradas [aqui](https://docs.moodle.org/dev/Core_APIs).
O Moodle não tem uma API Hooks bem definida, mas ainda permite que plug-ins se conectem a diferentes processos implementando callbacks. 

O Moodle permite a comunicação entre módulos via eventos esses módulos podem acionar eventos específicos e outros módulos podem escolher manipular ou observar esses eventos. Quando uma ação ocorre, um evento é criado pela API principal do moodle (ou por um plugin dependendo do caso). O sistema de eventos divulgará essas informações para os observadores daquele evento. Assim, ele atua fazendo a comunicação entre todo o sistema moodle. Os observadores de eventos são armazenados em cache.

É importante enfatizar que o Moodle pode ser instalado em um servidor próprio.

<div align="center" style="padding: 50px">
	<img src="components.png" style="width: 35rem;">
	<span style="display:block;font-weight:bold;">
    Figura 3 - Diagrama de componentes do Moodle
  </span>
</div>

## Visão de informação

No moodle exite uma grande quantidade de dados que são manipulados. Nesta documentação será descrita a visão de uma atividade que foi postada por um professor. Inicialmente a atividade é criada por uma ação de um usuário do tipo professor, em seguida ela pode ser entregue ou não entregue pelo aluno. Mais detalhes do ciclo da atividade serão demonstradas no diagrama a seguir.

<div align="center" style="padding: 50px">
	<img src="inf.png" style="width: 35rem;">
	<span style="display:block;font-weight:bold;">
    Figura 4 - Diagrama de informação de uma atividade no Moodle
  </span>
</div>