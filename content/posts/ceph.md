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

O Ceph é um software que armazena os dados em blocos e os distribui em um cluster escalonável de armazenamento, composto por Object Storage Devices (OSD). O Ceph possui também um monitor com acesso à informações do cluster, e pode ter um servidor de metadados (MDS) para intermediar o acesso a inodes e diretórios no CephFS.

Mais detalhes podem ser vistos [nesse link](https://docs.ceph.com/en/latest/).

## Ceph

### Objetivo Geral
...

### Objetivos Específicos
...

### Contexto
...

### Containers
...

### Componentes
...

### Código
<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação
...