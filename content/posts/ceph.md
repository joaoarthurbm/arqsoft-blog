+++
title = "Documentação arquitetural do Ceph"
date = 2021-07-28
tags = []
categories = []
+++

---

Este documento explica aspectos da arquitetura do sistema de arquivos Ceph. O Ceph é um sistema que armazena seus arquivos em um cluster distribuído.

---

# Autores

Este documento foi produzido por Luis Eduardo Barroso Mafra.

- Matrícula: 118110175
- Contato: luis.mafra@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/ceph/ceph

# Descrição Arquitetural - Ceph

Este documento descreve a arquitetura do Ceph. Essa descrição foi baseada principalmente no modelo C4. O foco principal é descrever como esse software realiza o armazenamento de dados e o acesso à eles.

## Descrição Geral sobre o Ceph

O Ceph é um software que armazena os dados em blocos e os distribui em um cluster escalonável de armazenamento, composto por Object Storage Daemons (OSD). O Ceph possui também um monitor com acesso à informações do cluster, e pode ter um servidor de metadados (MDS) para intermediar o acesso a inodes e diretórios no CephFS.

Mais detalhes podem ser vistos [nesse link](https://docs.ceph.com/en/latest/).

## Ceph

### Objetivo Geral

Implementar um sistema de arquivos distribuídos que permite leitura e escrita de arquivos de forma eficiente.

### Objetivos Específicos

O Ceph é um software que tem como objetivo criar um cluster de armazenamento de arquivos escalonável, garantindo replicação e tolerância a falhas, assim como um acesso eficiente aos dados armazenados nesse cluster.

### Contexto
Abaixo, é possível observar o diagrama de contexto do sistema.
![context](context.png)

Quando o cluster for criado, o cliente poderá acessar o diretório em que o ceph foi montado, e armazenar os arquivos. Esses arquivos serão dividos em objetos e armazenados de forma balanceada entre os vários servidores de armazenamento que compõem o cluster. Também é possível adquirir informações sobre arquivos e diretórios com comandos básicos (`ls`, `find`,`stat`, etc), que irá pegar isso do cluster de metadadados caso o tipo de cliente seja CephFS.

### Containers

Abaixo, observamos o diagrama de container para o Ceph:

![container](container.png)

Vamos detalhar cada container e sua função no sistema:

- **Monitor**: Esse é o container que guarda uma mapa do estado do cluster, que inclui o mapa do **Manager**, o mapa do **OSD**, o mapa do próprio **Monitor**, e o CRUSH Map. Esses mapas possuem informações necessárias para que os daemons do Ceph se comuniquem entre si. Ele também é responsável por gerenciar a autenticação entre o cliente e os daemons, através de uma chave secreta.
- **Manager**: Esse é o container responsável por manter métricas em tempo de execução do cluster, incluindo espaço utilizado e métricas de desempenho. Ele também possui módulos em python para exibir informações do cluster em uma plataforma web através de um Dashboard.
- **Object Storage Daemon(OSD)**: Esse é o container responsável por armazenar os dados dos arquivos, lidar com replicação e rebalanceamento desses dados entre os nodes, e fornece informações de monitoramente para o **Monitor** e o **Manager**. É possível(e esperado) ter vários OSDs para garantir uma maior segurança e eficiência.

### Componentes

Abaixo, é possível observar o diagrama de componentes do sistema:

![component](component.png)

Nos componentes, temos:

- **Data Striping**: Responsável por dividir os dados do arquivo em vários objetos menores para que o arquivo fique espalhado em diferentes OSDs. Dessa forma, o Ceph garante uma maior eficiência na leitura de dados, podendo ler o arquivo de várias OSDs ao mesmo tempo.
- **Algoritmo CRUSH**: O Algoritmo CRUSH mapeia objetos em Placement Groups(PG), e PGs em OSDs dinamicamente utilizando uma função hash pseudo-aleatória para que os objetos sejam distribuídos de forma uniforme. Essas informações são armazenadas no CRUSH Map para posterior utilização.
- **Replication**: A OSD usa o algoritmo CRUSH para calcular onde as réplicas dos objetos devem ser armazenadas. Quando um objeto é criado, ele é armazenado na OSD primária, e a OSD recupera o número de réplicas esperada por arquivos, e utiliza o CRUSH Map para armazenar nas OSDs secundárias.
- **Rebalancing**: Responsável por atualizar o Cluster Map quando uma OSD for adicionada ou removida do cluster, migrando alguns Placement Groups para garantir que os objetos continuem distribuidos uniformemente entre as OSDs.
- **Heartbeat**: Responsável por verificar o "batimento cardíaco" de outras OSDs, e reportar ao monitor se verificar que umas das OSDs tenha caído.

### Código
<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação
...