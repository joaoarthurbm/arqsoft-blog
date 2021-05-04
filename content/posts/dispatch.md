+++
title = "Documentação Arquitetural do Netflix Dispatch"
date = 2021-04-29
tags = []
categories = []
+++
 
# Autores
 
Este documento foi produzido por Lucas de Medeiros Nunes Fernandes.
 
- Matrícula: 117110210
- Contato: lucas.medeiros.fernandes@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/Netflix/dispatch
 
# Descrição Arquitetural -- Netflix Dispatch
 
Este documento descreve a arquitetura do projeto [Dispatch](https://github.com/Netflix/dispatch), desenvolvido pela Netflix. Essa descrição, assim como a produção de seus diagramas, foi baseada principalmente no modelo [C4](https://c4model.com/).
 
 
## Descrição
 
O Dispatch é um **framework de gerenciamento de crises**, criado para auxiliar no processo de abertura, acompanhamento e fechamento de incidentes de segurança de uma aplicação ou plataforma.
 
Ele ajuda a gerenciar tais incidentes de maneira eficaz, oferecendo integração com ferramentas comumente utilizadas por organizações, como Slack, GSuite, Jira etc. Ao aproveitar a familiaridade existente entre todas essas ferramentas, é provido um orquestrador de incidentes e notificações, ao invés de ter que gastar esforços em integrações individuais para cada uma.
 
Ou seja, com o Dispatch, as preocupações relacionadas em criar recursos, reunir participantes, enviar notificações, rastrear tarefas e auxiliar nas revisões pós-incidentes são praticamente reduzidas a zero, permitindo que o time realmente se concentre apenas em resolver o problema!

### Objetivos

Em sua essência, o Dispatch visa gerenciar todo o ciclo de vida de um incidente, fornecer aos indivíduos relacionados à crise todo o contexto de que precisam para resolvê-la, prover integrações embutidas com ferramentas como Slack, GSuite e Jira a partir de seus plugins e também ser expansível em relação a essas integrações, permitindo que novos plugins para outras ferramentas (Zendesk, Microsoft Teams, etc. por exemplo) sejam desenvolvidos pelo time. Além disso, também busca oferecer uma solução para gerenciamento de crises internas independente de casos de uso de segurança específicos.

### Objetivos específicos

Ao introduzir um processo automatizado para gerenciar e responder a incidentes de segurança, a Netflix tem como objetivos reusar ferramentas existentes que os times já utilizavam para lidar com as crises, reduzir a curva de aprendizado para contribuir com a resolução dos incidentes, prover uma API unificada para usuários internos e ferramentas, padronizar a comunicação durante a crise e catalogar, salvar e analizar os dados dos incidentes para acelerar a sua resolução.

### Contexto

Lidar com crises internas que levam a disrupções parciais ou totais de um sistema ou plataforma é uma tarefa muito estressante e antiga. Porém, mesmo com tantos casos existentes, ainda não existem muitas soluções unificadas que facilitem o processo e a comunicação interna durante o ciclo de vida do incidente. Sempre surgem questões como *Qual o escopo?*, *Quem pode me ajudar?*, *Quem eu chamo para compor o time que vai resolver?*.

O Dispatch se dispõe a mitigar esse cenário, ao atacar quatro aspectos principais de gerenciamento de crise:

- **Gerenciamento de Recursos** -- Gerenciamento e análise dos dados e metadados coletados do incidente.
- **Agrupamento de indivíduos** -- Entender o melhor cenário para formar times de resolução dos incidentes e agrupar *participantes*.
- **Gerenciamento do Ciclo de Vida** -- Prover ferramentas ao *comandante do incidente* para gerenciar de maneira mais fácil o ciclo de vida de um incidente.
- ***Incident Learning*** -- Se basear em incidentes anteriores para acelerar a resolução de incidentes futuros.

> **IMPORTANTE**
> 
> Os **Comandantes** são os indivíduos responsáveis por conduzir o incidente à resolução.
> 
> Os **Participantes** são os indivíduos especialistas que foram adicionados no time para ajudar a resolver o incidente.
> 
> Os **Recursos** são documentos, *screenshots*, registros (logs), ou qualquer outro tipo de informação digital que é utilizada durante um incidente.

O comandante do incidente cria um incidente com algunas dados básicos. A partir disso, o Dispatch cria todo um **Fluxo de Incidente**, que consiste na automatização de tarefas como criação de canais de comunicação, criação do documento de incidente, agrupamento e orientação de indivíduos participantes, notificações a stakeholders que precisam estar cientes da crise, revisar a performance de todo o processo, acompanhar ações a serem executadas após o término e gerar aprendizado por meio da estruturação do conhecimento informal.

Tudo isso é possível graças à integração com diversas ferramentas através de seus plugins. A análise dos dados é feita de maneira interna, mas ações efetivas na organização e comunicação durante o incidente é totalmente baseada na integração com ferramentas como Slack (criação de canais), GSuite (criação de documentos e notificação de stakeholders chave), Jira (criação de tarefas e agrupamento de participantes), ou qualquer outra ferramenta a empresa utiliza e oferecer suporte a integração, por exemplo, Zendesk (abertura de tickets).

<div align="center" style="margin: 2rem 0;">
    <img src="dispatch_context.png" style="width: 75%;">
    <span style="display:block;">
        Diagrama de contexto do Dispatch
    </span>
</div>

### Containers

A implantação do Dispatch requer um (sub)domínio próprio da empresa e depende de vários serviços para funcionar, todos orquestrados pelo `docker-compose`.

Para criar um incidente, o comandante interage com a UI do Dispatch passando apenas dados básicos relacionados à crise. Essa UI fornecesse um pequeno formulário de fácil preenchimento, e pode ser acessada a partir da URL abaixo:

```
https://<seu-dominio-dispatch>/incidents/report
```

Uma vez submetido, é apresentado ao usuário uma tela com todos os recursos que ele precisa para começar a gerenciar o incidente: tickets, video conferência, conversa, documentos etc Depois que um incidente é criado, o Dispatch vai formar times de participantes automaticamente, cuja regra de agrupamento é definida no Admin UI da aplicação. Cada participante recebe um e-mail e uma mensagem no Slack com os recursos e informação para orientá-los nesse incidente.

Quando as equipes precisam gerenciar muitos incidentes, o Dispatch fornece um admin feito em **VueJS**. Essa interface também é onde é feito o gerenciamento do conhecimento obtido a partir dos incidentes, a partir de termos comuns e suas definições, indivíduos, equipes e serviços, e é usado em incidentes futuros.

Como já citado anteriormente, o sistema utiliza plugins em sua arquitetura para realizar o gerenciamento de incidentes de maneira a possibilitar integrações com ferramentas corporativas já existentes, e o plugin do **Slack** é uma das integrações mais importantes embutidas no Dispatch, ou seja, não precisa ser implementada pelo time de desenvolvimento. Este plugin, além de criar canais de comunicação e notificar de atualizações no incidente através desse plugin, também disponibiliza alguns comandos específicos para o comandante do incidente disponíveis para serem usados dentro de um canal de incidente. Esses comandos estão listados abaixo, juntamente com um link para ler mais sobre eles.

- [/dispatch-add-timeline-event](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-add-timeline-event)
- [/dispatch-assign-role](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-assign-role)
- [/dispatch-engage-oncall](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-engage-oncall)
- [/dispatch-list-my-tasks](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-my-tasks)
- [/dispatch-list-participants](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-participants)
- [/dispatch-list-resources](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-resources)
- [/dispatch-list-tasks](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-tasks)
- [/dispatch-list-workflows](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-workflows)
- [/dispatch-list-incidents](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-incidents)
- [/dispatch-notifications-group](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-notifications-group)
- [/dispatch-report-executive](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-report-executive)
- [/dispatch-report-incident](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-report-incident)
- [/dispatch-report-tactical](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-report-tactical)
- [/dispatch-update-incident](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-update-incident)
- [/dispatch-update-participant](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-update-participant)
- [/dispatch-run-workflow](https://hawkins.gitbook.io/dispatch/user-guide/incident-commander#%2Fdispatch-list-workflow)

Além do **Slack**, o Dispatch oferece plugins embutidos para **GSuite**, **Jira**, **Opsgenie**, **PagerDuty** e **Zoom**, porém a arquitetura de plugins implementada permite integrar quaisquer outras ferramentas que uma organização está utilizando, desde que tal ferramenta ofereça suporte a integrações.

<div align="center" style="margin: 2rem 0;">
    <img src="dispatch_container.png">
    <span style="display:block;">
        Diagrama de container do Dispatch
    </span>
</div>

### Componentes

Para interagir com o formulário de cadastro de incidente e com o Admin UI, o usuário se autentica. Então, para lidar com as requisições, o Dispatch fornece uma API com o serviço principal para criação e gerenciamento do fluxo de incidente.

Tal serviço, **Incident Service**, se comunica com outros serviços que auxiliam na tarefa de gerenciamento, por exemplo, serviços como **Task Service**, responsável pela criação de atividades e ações relacionadas ao incidente, **Resources Services**, responsável pelo gerenciamento dos recursos relacionados a um incidente (ver definição de recurso na seção Contexto) e **Participants Services**, responsável pela alocação e estruturação dos times que vão atuar na resolução do incidente.

O serviço de incidente também é responsável por notificar os plugins responsáveis pelas integrações a respeito das atualizações de um incidente ou de seus recursos. A partir disso, cada plugin segue a sua estratégia para interagir com a sua ferramenta externa específica, automatizando ações que originalmente seriam feitas manualmente pelo comandante do incidente. Observe o diagrama de componentes abaixo, que ilustra esses serviços, assim como seus relacionamentos.

<div align="center" style="margin: 2rem 0;">
    <img src="dispatch_component.png" style="width: 90%;">
    <span style="display:block;">
        Diagrama de componentes do Dispatch
    </span>
</div>

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Durante o ciclo de vida de um incidente, ele passa por estados até que atinga um certo grau de estabilidade. Até lá, muita informação é gerada e processada pelo Dispatch, para que seja possível gerar um conhecimento a ser utilizado para resolver incidentes similares de maneira mais eficiente no futuro. Até mesmo quando um incidente é marcado como **estável**, o Dispatch continua a ajudar com o gerenciamento de incidente criando recursos adicionais como o documento *Post Incident Review*. O diagrama de estados abaixo ajuda a ilustrar como ocorre esse processo.

<div align="center" style="margin: 2rem 0;">
    <img src="dispatch_information.png">
    <span style="display:block;">
        Visão da informação do Dispatch
    </span>
</div>
