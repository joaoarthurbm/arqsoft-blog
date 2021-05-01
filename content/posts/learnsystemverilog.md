+++
title = "Documentação arquitetural para o Simulador Didático de SystemVerilog" 
date = 2021-04-15 
tags = [] 
categories = [] 
+++

***

Esse documento descreve a arquitetura do projeto Simulador Didático de SystemVerilog

***

# Autores 

Este documento foi produzido por Matheus de Souza Coutinho

- Matrícula: 116111247
- Contato: Matheus.coutinho@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/learn-systemverilog/learn-systemverilog.github.io

# Descrição Arquiteturial

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Este documento foi produzido para a disciplina de Arquitetura de Software da UFCG, descreve a arquitetura do projeto [Simulador Didático de SystemVerilog] (https://github.com/learn-systemverilog/learn-systemverilog.github.io) e usando como descrição principalmente o modelo [C4](https://c4model.com/)

## Descrição Geral sobre o Projeto

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O LearnSystemVerilog tem como principal objetivo tornar o aprendizado e a prática da programação em SystemVeriLog em placas FPGA mais acessível e de forma mais intuitiva, de forma a simular os mesmo resultados e a mesma execução de uma placa física real, obtendo a vantagem de ter a compilação mais rápida em relação as placas físicas e poder ser acessada de qualquer lugar, a qualquer momento utilizando dispositivos móveis.

## O Simulador Didático

### Objetivo Geral

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Implementar um sistema que compile código em SystemVerilog e execute as operações em um modelo de placa FPGA virtual, mantendo todas as funcionalidades de uma placa física de mesmo aspecto. 

### Objetivos Específicos

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Simular códigos de SystemVerilog em uma placa FPGA virtual com qualidade e eficiência, buscando um melhor desempenho e um tempo de compilação menor que as placas físicas(frequentemente tendem a demorar minutos para realizar a compilação do código).  Além disso, buscar ampliar a acessibilidade ao aprendizado dessa linguagem através de uma aplicação Web, podendo ser acessada em qualquer lugar do mundo com um computador ou celular.


### Contexto

<img src="../learnSystemVerilog/contexto.png" alt="Diagrama de contexto" ></img>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O Learn System Verilog é um sistema simples porém bastante eficiente na coleta e transmissão de dados. Na Single Page principal são realizadas todas as funções do sistema que os usuários podem acessar a qualquer momento. </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Na página do sistema, existe como foco principal o simulador virtual da placa FPGA, logo em seguida os mecanismos de edição de código no Code Editor e a verificação de execução do código em Console. </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
A transmissão de dados entre os componentes do <i>Frontend</i> e API é realizada através da tecnologia <i>Server Sent Event</i> (SSE), essa tecnologia permite que dados sejam transmitidos ao ponto de <i>Real-Time</i> e isso contribui para a eficiência e torna vantajosa a utilização dessa
placa virtual em relação às físicas.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Os dados que são transmitidos na comunicação com a API são basicamente: código System Verilog escrito pelo usuário no Code Editor e código JavaScript. </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
A API é responsável por converter o código em SystemVerilog para um código JavaScript que será responsável por manipular os componentes do <i>Frontend</i> no simulador virtual FPGA. 
</p>
	
### Containers


<img src="../learnSystemVerilog/container.png" alt="Containers" ></img>
<p>Conforme o diagrama acima, pode-se analisar que o Learn SystemVerilog é um sistema bem simples e robusto, não possuindo banco de dados e portanto sendo dividido em dois subsistemas: A parte do client que é onde os usuários acessam o sistema, portanto o <i>Frontend</i>, e a parte do <i>WebServer</i> que é onde o client realizará requisições para transmitir e receber dados.</p>

<p>Descrevendo os containers apresentados no diagrama, vamos ter:</p>

+ **External API(Google API)**: É o Container que dá acesso a uma API externa para que o usuário possa realizar login com uma conta do Google, e assim que ele consiga logar o sistema ficará disponível para que as funcionalidades possam ser acessadas pelo mesmo.

+ **User Web(React JS)**: Container que compõe todas as funcionalidades do sistema que o usuário pode visualizar e interagir, nesse container também é realizado as funções solicitadas pelo usuário.  Além disso, realiza a comunicação com a parte Server do sistema, transmitindo e recebendo dados.  A comunicação é realizada através do Protocolo *HTTP* utilizando a tecnologia *Server Sent Events*. 

+ **API(transpile)**: Este container é responsável por receber os dados enviados para o Server, e a partir dos dados recebidos realizar os procedimentos internos designados. É a partir desse container que os mecanismos essenciais propostos no sistema são executados.

+ **Export Logs(Server Send Events)**: Container responsável por enviar dados para o Client sobre os status do código System Verilog enviado para o Server para ser compilado, os dados são do tipo *txt* e seu conteúdo é de acordo com a situação de cada etapa de compilação e execução do código enviado. O protocolo de comunicação utilizado é o *HTTP* utilizando a tecnologia *Server Sent Events*.

+ **Response API transpile(Server Send Events)**: Este container tem como objetivo enviar o código traduzido em System Verilog para JavaScript de forma que sejam utilizados nos componentes do container *User Web*(JavaScript). Então esse container é responsável por compilar, checar falhas, traduzir e enviar os novos dados para outro container. Para a execução de compilação e tradução foi utilizada a tecnologia *transpile*, implementada no próprio sistema. O protocolo de comunicação utilizado é o *HTTP* utilizando a tecnologia *Server Sent Event*.
	
	
### Componentes
<p />
<img src="../learnSystemVerilog/componentes.png" alt="Diagrama de componentes" ></img>
<p /><p />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Os componentes que estão sendo apresentados no Diagrama de Componentes englobam todas as funcionalidades que o sistema propõe, e serão descritos a seguir:
	
+ **Single Page Application**: É nesse componente que estão os outros quatro componentes que interagem diretamente com o usuário, é nesse componente que o usuário realiza as funções disponíveis no sistema e é onde os outros componentes que estão nele são renderizados.

+ **Sign in Google Account**: É o componente externo ao sistema que tem como responsabilidade solicitar ao usuário que realize login com um email válido do Gmail, caso essa ação seja realizada com sucesso, então as funcionalidades do sistema ficarão disponíveis para que o usuário as utilize, caso contrário, o sistema não permitirá que o usuário manipule outros componentes.

+ **Simulator FPGA**: É o componente principal em questão de visualização do usuário, este componente receberá um código JavaScript convertido pelo *Server* e o atribuirá em seus componentes JavaScript de forma que simulem o funcionamento de uma placa FPGA física, por ser um simulador a visualização dos componentes base desse componente se assemelha a uma placa FPGA real, o mesmo pode ser dito para o comportamento desses componentes quando executados. O usuário também poderá manipular os objetos e de acordo com o código passado terá diferentes ações.

+ **Code Editor**: É o componente responsável por iniciar o processo de compilação e execução do simulador proposto no sistema. É a partir desse componente que o usuário pode escrever um código em SystemVerilog, compilar e verificar sua execução no componente do Simulador FPGA. O código escrito é enviado para o componente Learn-SystemVerilog API para ser convertido e compilado.

+ **Console**: É o componente intermediário de execução do sistema, após o usuário ter escrito e compilado o código, o console mostrará em formato *txt* os status do código que está sendo compilado, informando ao usuário onde existe erro no código, se foi compilado com sucesso, entre outras coisas. Se não houver erros no código, o simulador FPGA começará a simular a execução do código. As informações são recebidas através do componente Learn-SystemVerilog API.

+ **Learn-SystemVerilog API**: Componente da parte do *Server* que recebe requisições e transmite dados. Esse componente é responsável por receber o código System Verilog, compilar, gerar os resultados da compilação, convertê-lo em código JavaScript e transferi-lo para os componentes Console e Simulator FPGA do *Client*. Utiliza a API *transpile* para conversão dos códigos.

### Visão de Informação

<img src="../learnSystemVerilog/Fluxo de Informacoes.png" alt="Visão de Informações" ></img>


<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O sistema caracteriza-se por ser bastante simples de utilizar, basta que o usuário logue em qualquer conta do Google, e após isso pode estudar, implementar e testar seus códigos em um simulador eficiente, rápido e sofisticado, capaz de realizar todas as funcionalidades que uma placa FPGA física real. O sistema possui apenas um campo para escrever o código System Verilog e um botao para compilar, a parte principal é de fato o simulador que execurá os comandos passados no código após ser compilado, e além disso, o usuário poderá verificar os status de compilação e possíveis erros, tornando-se uma ferramenta bastante didática e intuitiva para todos os níveis de usuários.</p>


