# Descrição Arquitetural – Serviço de similaridade entre inquéritos do ePol

Este documento descreve parte da arquitetura do projeto [ePol](https://github.com/orgs/epol-ufcg/teams/similaridade/repositories). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do ePol. O foco aqui é a descrição de um serviço específico de similaridade entre inquéritos policiais, que é parte fundamental do projeto.

## Autores

Este documento foi produzido por: 

Eric Gonçalves:
- Matrícula: 118210349
- Contato: eric.goncalves@ccc.ufcg.edu.br

Gabriel Souto:
- Matrícula: 118210258
- Contato: gabriel.souto@ccc.ufcg.edu.br

Ruan Gomes:
- Matrícula: 118210616
- Contato: ruan.alves@ccc.ufcg.edu.br

Victor Andrade:
- Matrícula: 118210406
- Contato: victor.andrade@ccc.ufcg.edu.br

## Descrição geral do ePol

O epol é um projeto que visa automatizar o processamento de inquéritos policiais pela Polícia Federal do Brasil. A intenção da etapa atual do projeto, ao qual o serviço a ser documentado pertence, é automatizar a busca por inquéritos policiais similares em tempo real, a partir de sumarização de documentos e geração de grafos de investigação.

## Serviço de Similaridade entre inquéritos

### Objetivo

Implementar um serviço de busca por inquéritos similares a partir de um inquérito alvo, utilizando o texto do inquérito e dados obtidos do mesmo.

### Objetivos Específicos

Queremos encontrar inquéritos similares a partir de um inquérito alvo *on the fly* em tempo hábil. Para isso, utilizamos modelos de *Machine Learning* envolvendo Processamento de Linguagem Natural (PLN), juntamente com busca por dados similares via SQL utilizando dados obtidos de um inquérito alvo.

### Contexto

O usuário, agente da Polícia Federal, utiliza o Frontend do SmartPol para processar documentos, gerar e buscar dados de inquéritos. O Frontend se comunica com o módulo de Similaridade para iniciar e buscar casos similares. O módulo citado anteriormente, cujo é o alvo desse documento, é responsável por iniciar o processamento de similaridade entre inquéritos, realizando a persistência dos resultados desse processamento através de comunicação com o módulo de Grafos. Além disso, juntamente com o módulo de Sumarização e com o módulo de Grafos, é responsável pela transformação de um caso temporário em um caso permanente.

![Diagrama de contexto do ePol](./epol/context-diagram-epol.png)

