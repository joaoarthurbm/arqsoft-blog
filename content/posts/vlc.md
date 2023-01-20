+++
title = "Documentação Arquitetural do VLC"
date = 2021-04-30
tags = []
categories = []
+++

***

Este documento descreve a arquitetura de uma parte do projeto VLC.

![vlc](vlc.gif)
***

# Autores

Este documento foi produzido por Higor Santos de Brito Dantas.

- Matrícula: 118110808
- Contato: higor.dantas@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/videolan/vlc

<div style="display: flex; flex-direction: row; align-items: center;">
  <img src="icon.png" style="width: 60px; box-shadow: none; margin-right: 30px">
  <h1>Descrição Arquitetural – VLC</h1>
</div>

Este documento descreve parte da arquitetura do projeto [VLC](https://github.com/videolan/vlc). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do VLC. Apenas suas partes principais, e com um foco maior dado no módulo responsável por realizar a saída de vídeo, que é uma das partes mais importantes do programa.

## Descrição Geral sobre o VLC

O VLC é um projeto desenvolvido pela [VideoLAN](https://www.videolan.org/vlc/index.pt_BR.html) que funciona como um player de arquivos de vídeos e como um servidor de mídia via streaming. Atualmente, o VLC pode ser instalado em computadores com os sistemas operacionais `Windows`, `MacOS`, `Linux`, `Chrome OS`, entre outros, além de dispositivos móveis com `Android`, `iOS`, `iPadOS`, `Tizen`.  
O software é capaz de reproduzir a maioria dos codificadores (MPEG-2, MPEG-4, MKV, H.264, MP3...) sem ser necessário instalar pacotes adicionais, suporta reprodução de CDs e DVDs, além de vários protocolos de streaming.

## VLC

### Objetivo Geral

O VLC busca servir de um `media player` completo.

### Objetivos Específicos

O VLC tem diversas funcionalidades como reprodução de arquivos de vídeos, de CDs e DVDs, de streaming, entre outras. E, em grande parte, uma atividade necessita ser realizada: a saída das imagens na tela do computador, celular, TV..., enfim, qualquer dispositivo que o mesmo esteja sendo executado. Portanto, ele busca prover uma ferramenta que facilite a visualização de vídeos.

### Contexto

O VLC é software que pode ser adquirido livremente no site da [VideoLAN](https://www.videolan.org/vlc/index.pt_BR.html) e executado por qualquer usuário que esteja utilizando os sistemas operacionais suportados pelo mesmo. A partir daí, o usuário poderá usufruir de todas as funcionalidades já citadas nas seções anteriores e mais um pouco, já que o software permite adicionar complementos e extensões, possibilitando adicionar novos temas, capas ou serviços, como o TuneIn Radio.  
Além disso, o VLC, por ser um reprodutor de áudios/vídeos, necessita conversar com os drivers do dispositivo, no diagrama abaixo é destacado apenas o driver de vídeo, pois, essa documentação buscará focar no módulo responsável por realizar a saída de vídeo.
  
![Diagrama de Contexto](diagrama-de-contexto.jpg)

### Containers

Inicialmente, o usuário interage diretamente com a interface do VLC que dependendo o sistema operacional utilizado a tecnologia pode variar. Por exemplo, desde a versão `0.9.0`, as interfaces do aplicativo para Windows e Linux utilizam a biblioteca [Qt](https://pt.wikipedia.org/wiki/Qt), antes era utilizado a [wxWidgets](https://pt.wikipedia.org/wiki/WxWidgets). Além disso, é possível adicionar temas que podem ser baixados e adicionados para personalizar a interface (não disponível para MacOS).  
A GUI se comunica com o libVLCcore que é o núcleo da aplicação, ele quem realiza os gerenciamentos de threads, os módulos, como os codecs, os relógios etc. Inclusive, utilizando um exemplo dado pela própria documentação, é o núcleo que realiza a sincronização das faixas de áudio, vídeo e legenda. Além disso, existe a libVLC que é uma biblioteca que dá suporte a muitas das funcionalidades do aplicativo e que pode ser utilizada por terceiros para utilizar as mesmas funções empregadas no núcleo, que a utiliza para dar suporte e modularizar as funcionalidades da melhor maneira possível.  

![Diagrama de Containers](diagrama-de-container.jpg)

### Componentes

Por simplicidade, foi aberto apenas o componente do núcleo do VLC, chamada de libVLCcore, e nem todos os componentes estão mostrados já que são muitos. Então, estão representados apenas os componentes de demultiplexação, playlist, saida de áudio, internet, saída de vídeo, streaming.
O componente de demultiplexação é o responsável por receber o arquivo do módulo de `input` e separar em vários fluxos, um para cada elemento: áudio, vídeo e legenda; em seguida, envia cada um para o decodificador.  
Os componentes de saída de áudio e de vídeo são responsáveis por pegar quadros de áudio e de vídeo, respectivamente, decodificados e passar para o componente do hardware que irá realizar a operação de saída de dados.  
O componente Playlist é responsável por controlar a lista de arquivos de mídia, já o de Internet fornece uma interface que permite aos demais se comunicar com a rede que, inclusive, é utilizado pelo componente de Streaming, que realiza as operações necessárias para a saída da transmissão de vídeos via internet.

![Diagrama de Componentes](diagrama-de-componentes.jpg)

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

Assim que é definido qual o arquivo de mídia irá ser aberto e o abre com o VLC, o primeiro passo será buscar o demultiplexador para o formato do arquivo, caso seja um formato não aceito pelo programa é impossível prosseguir com o processo e, portanto, será encerrado.  
Caso contrário, o demultiplexador é encontrado, separa o arquivo em fluxos elementares e repassa cada um para o `codec` responsável. Após toda a operação realizada pelo codec, o fluxo de dados é levado ao componente de saída de vídeo, que irá repassar a solicitação para os drivers e, enfim, mostrar na tela.

![Visão de Informação](visao-da-informacao.jpg)

# Contribuições Concretas

_Até o momento, não foi realizada nenhuma contribuição no repositório do software estudado ao longo deste documento._
