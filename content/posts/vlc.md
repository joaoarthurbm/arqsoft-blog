+++
title = "Documentação Arquitetural do VLC"
date = 2021-04-25
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

# Descrição Arquitetural -- VLC

Este documento descreve parte da arquitetura do projeto [VLC](https://github.com/videolan/vlc). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do VLC. O foco será dado no módulo responsável por realizar a saída de vídeo, que é uma das partes mais importantes do programa.

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

> TODO

### Componentes

> TODO

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

> TODO

# Contribuições Concretas

> TODO
