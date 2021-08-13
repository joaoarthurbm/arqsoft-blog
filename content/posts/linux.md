# Autor

Este documento foi produzido por Italo Modesto Pereira.

- Matrícula: 116211154
- Contato: italo.pereira@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/torvalds/linux

# Descrição arquitetural - Kernel do Linux

Este documento descreve a arquitetura do [kernel do Linux](https://github.com/torvalds/linux). E esta descrição segue o modelo [C4](https://c4model.com/).

## Sobre o Kernel do Linux

O Kernel, ou núcleo, do linux é a parte do sistema operacional (SO) responsável por gerenciar os recursos de hardware do sistema computacional e também é responsável pela sincronização dos processos que executam nesse SO. 

### Contexto

<img src="linux/kernel_contexto.png"></img>

Quando as aplicações que estão em execução no linux precisam de uma operação do hardware, como por exemplo buscar dados no disco ou simplesmente processar algum comando, essas aplicações não têm permissão para acessar o hardware diretamente. Para intermediar essa comunicação, e fazer muito mais do que isso, existe o kernel, que estende a interface de programação do hardware provendo a sua pŕopria interface para as aplicações, a system call interface (interface de chamadas ao sistema).
Uma vez que o kernel recebe as chamadas ao sistema das aplicações, ele gerenciará todos os recursos de hardware necessários para atender àquela chamada. 

### Containers

<img src="linux/kernel_containers.png"></img>

**Applications**: representa as aplicações que executam no linux e se comunicam com o kernel através de chamadas ao sistema.
<br>
**System Call Interface:** representa a interface de chamadas ao sistema que é provida pelo kernel e consumida pelas aplicações que executam no SO.
<br>
**Kernel Subsystems:** Nesse módulo estão contidos os subsistemas do kernel que recebem as chamadas ao sistema das aplicações, por meio da interface de chamadas ao sistema, e gerenciam os recursos de hardware necessários para atender a essas chamadas.
<br>

### Componentes

![fig4](anki_componentes.png)

**Obs.**: os componentes com contorno em **vermelho** não estão disponíveis na plataforma **AnkiWeb (Decks)** no navegador, apenas nos aplicativos para desktop e celular.

Há uma relação próxima entre os gerenciadores de configurações, baralhos, tipos de cartões, notas e cartões:
- Uma **configuração** é um conjunto de parâmetros que define quantos cartões novos serão mostrados por dia, o fator de multiplicação para o tempo em que o cartão será mostrado novamente de acordo com a resposta, a quantidade diária máxima de revisões etc. Pode ser criado qualquer número de configurações e uma configuração pode ser usada por qualquer quantidade de baralhos.
- Um **tipo de nota** é um esquema que define quais campos uma nota terá. O padrão são dois campos (frente e verso), mas podem ser adicionados mais tipos com outros campos (como mídia e informações adicionais). Um tipo de nota possui um ou mais **tipos de cartão**. O tipo padrão possui o campo da frente na frente e o campo do verso no verso, mas isso pode ser customizado (e deve, caso campos além da frente e verso sejam adicionados). Os cartões são escritos em HTML.
- Uma **nota** é uma instância de um tipo de nota, com as informações a serem inseridas nos campos daquele tipo. Uma nota representa uma quantidade de cartões igual à quantidade de tipos de cartão naquele tipo de nota.
- Um **baralho** é um conjunto de notas. As notas de um baralho não precisam ser todas do mesmo tipo. O conjunto de cartões de um baralho é a união dos cartões de cada nota. Permitir ao usuário estudar os cartões de um baralho é o principal objetivo do Anki.

O Anki já vem com alguns tipos de nota padrão, para que não seja necessário que o usuário saiba gerenciá-los ou precise criar as formatações para os cartões em HTML.

### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>


### Visão de Informação

![fig5](anki_informacao.png)

**Obs.**: no diagrama de informação, as setas e contornos pontilhados roxos indicam que aquele fluxo ou etapa é opcional.

O objetivo do usuário do Anki é estudar seus baralhos; para isso, ele precisa criá-los, tendo a opção de buscar um pronto no AnkiWeb (Shared) ou criar um novo, seguindo o fluxo de informação indicado. Já tendo baralhos com cartões, o usuário sincroniza sua coleção com o AnkiWeb antes e depois de estudá-los.
