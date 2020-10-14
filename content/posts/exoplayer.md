+++
title = "Visão arquitetural ExoPlayer"
date = 2020-10-12
tags = []
categories = []
+++


# Autor

Este documento foi produzido por Aramis Sales Araujo.

- Matrícula: 115110951
- Contato: aramis.araujo@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/google/ExoPlayer

# Descrição Arquitetural -- Reprodutor de mídia do ExoPlayer

Este documento descreve parte da arquitetura do projeto [ExoPlayer](https://github.com/google/ExoPlayer). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do ExoPlayer. O foco aqui é a descrição do módulo do reprodutor de midia, que é parte fundamental do projeto.


## Descrição Geral sobre o ExoPlayer

O ExoPlayer é uma biblioteca que fornece um reprodutor de mídias para Android. Diferente da API nativa `MediaPlayer`, o ExoPlayer é simples de customizar e estender. Além disso, suporta reprodução de transmissões [DASH](https://mpeg.chiariglione.org/standards/mpeg-dash) e outras funcionalidades não presentes no `MediaPlayer API`. Mais detalhes sobre a biblioteca podem ser vistos através [deste link](https://exoplayer.dev/).

## O reprodutor de mídia do ExoPlayer

### Objetivo Geral

Implementar um reprodutor de mídia (áudio e vídeo) para dispositivos Android capaz de suportar diversos padrões de formato de arquivos e fluxos de mídia. 

### Objetivos Específicos

Deseja-se reproduzir arquivos ou fluxos de mídia em dispositivos Android através da biblioteca e reprodutor fornecido. Estão inclusas etapas e processos de bufferização, controle de volume e playback. Uma característica importante é o suporte a diferentes formatos de mídia que não são suportados pelo reprodutor nativo Android.

### Contexto


O ExoPlayer é uma biblioteca Android que provê um reprodutor de mídias para ser incorporado à aplicações. A biblioteca também expõe chamadas de baixo nível à API nativa do sistema Android para que as mídias possam ser manipuladas com maior liberdade.

![fig1](context.jpg)


### Containers

Nesta seção eu espero duas coisas: o diagrama de containers e texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.

![fig2](containers.jpg)

### Componentes

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig3](components.jpg)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Aqui você deve descrever as informações importantes que são coletadas, manipuladas, armazenadas e distribuídas pelo sistema. Você não precisa descrever todas as informações, somente uma parte que seja essencial para o sistema. Por exemplo, se eu estivesse tratando do instagram, faria algo relacionado aos posts.

Além da descrição gostaria de ver aqui um diagrama para descrever os estados (ex: máquina de estados) de uma informação de acordo com as ações do sistema.

![fig4](information.jpg)

# Contribuições Concretas

*Descreva* aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.