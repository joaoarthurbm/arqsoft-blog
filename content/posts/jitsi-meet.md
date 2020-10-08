# Autores

Este documento foi produzido por Daniele A. de Melo Silva.

- Matrícula: 117110348
- Contato: daniele.silva@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/jitsi/jitsi-meet

# Descrição Arquitetural -- Serviço de gravação de uma conferência

Este documento descreve parte da arquitetura do projeto [Jitsi Meet](https://github.com/jitsi/jitsi-meet). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que não será descrita toda a arquitetura do Jitsi Meet. O foco aqui é a descrição de um serviço específico de gravação de uma conferência.

## Descrição Geral sobre o Jitsi Meet

O Jitsi Meet é uma solução de videoconferência totalmente criptografada e 100% de código aberto disponível todos os dias, gratuitamente e sem necessidade de conta. O Jitsi Meet é executado no navegador, sem instalação: https://meet.jit.si.

O Jitsi Meet permite uma colaboração muito eficiente. Os usuários podem transmitir sua área de trabalho ou apenas algumas janelas. Ele também suporta edição de documentos compartilhados com Etherpad.

## O Serviço de gravação de uma conferência

### Objetivo Geral

Implementar um serviço para capturar áudio e vídeo de uma conferência e salvar no destino escolhido pelo usuário.

### Objetivos Específicos

A fazer.

### Contexto

O contexto de gravação de uma conferência compreende os seguintes sistemas:

- Jitsi Meet - aplicativo JavaScript compatível com WebRTC que usa o Jitsi Videobridge para fornecer videoconferências ​​de alta qualidade, seguras e escaláveis.
- Jitsi Conference Focus (Jicofo) - componente server-side usado nas conferências do Jitsi Meet para gerenciar as sessões de mídia entre cada um dos participantes e o Videobridge.
- Jibri - conjunto de ferramentas para gravar e/ou transmitir uma conferência do Jitsi Meet, que funciona iniciando uma instância do Chrome renderizada em um framebuffer virtual e capturando e codificando a saída com ffmpeg.
- Prosody - servidor XMPP usado para sinalização (software externo)

Segue o diagrama de contexto para o serviço de gravação.

![fig1](context.png)

### Containers

Nesta seção eu espero duas coisas: o diagrama de containers e texto descrevendo os containers. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada container, suas tecnologias, APIs expostas, protocolos, onde são executados/implantados etc. Você pode criar um diagrama de implantação para dar mais detalhes sobre o ambiente em que os containers são implantados e executam. Essa parte de implantação pode ser uma subseção desta seção.

Importante, se um componente expor, por exemplo, uma API REST. Seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Importante, se um container expuser, por exemplo, uma API REST, seria importante descrever os principais serviços. Talvez até com exemplos de payloads (jsons) para os serviços mais importantes. Ver seção endpoints [deste documento](https://docs.google.com/document/d/1OGPN7crENY5u9AiR_AE7Cb9rT92T-U-YppZL0m4TT2s/edit?usp=sharing).

Abaixo estão exemplos de diagramas de containers e de implantação.

![fig3](c4-containers.png)
![fig4](parlametria-container.png)
![fig5](c4-implantacao.png)
![fig6](parlametria-implantacao.png)

### Componentes

Nesta seção eu espero duas coisas: o diagrama de componentes e texto descrevendo os componentes. Detalhe no nível que achar necessário, mas é importante saber do que se trata cada componente, seus relacionamentos, tecnologias, APIs expostas, protocolos, estilos, padrões etc.

Abaixo um exemplo de diagrama de componente.

![fig7](c4-componentes.png)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Aqui você deve descrever as informações importantes que são coletadas, manipuladas, armazenadas e distribuídas pelo sistema. Você não precisa descrever todas as informações, somente uma parte que seja essencial para o sistema. Por exemplo, se eu estivesse tratando do instagram, faria algo relacionado aos posts.

Além da descrição gostaria de ver aqui um diagrama para descrever os estados (ex: máquina de estados) de uma informação de acordo com as ações do sistema.

# Contribuições Concretas

_Descreva_ aqui os PRs enviados para o projeto e o status dos mesmos. Forneça os links dos PRs.
