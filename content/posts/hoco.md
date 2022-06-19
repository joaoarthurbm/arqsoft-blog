# Autores

Esse documento foi produzido pelos alunos:
**Daniel Gomes de lima**

- Github: https://github.com/dnlgomesl
- Matrícula: 118210357;
- Contato: daniel.gomes.silva@ccc.ufcg.edu.br

**Ícaro Chagas de Almeida**

- Github: https://github.com/icaro-chagas
- Matrícula: 119210960;
- Contato: icaro.almeida@ccc.ufcg.edu.br

**Leandra de Oliveira Silva**

- Github: https://github.com/LeandraOS
- Matrícula: 120111020;
- Contato: leandra.silva@ccc.ufcg.edu.br

**Rodrigo Eloy Cavalcanti**

- Github: https://github.com/RodrigoEC
- Matrícula: 118210111;
- Contato: rodrigo.cavalcanti@ccc.ufcg.edu.br

**Projeto documentado**: https://github.com/Guardians-DSC/HoCo

# Descrição arquitetural - HoCo

Esse documento descreve o funcionamento da arquitetura do HoCo, projeto da organização estudantil `Guardians`. Essa descrição foi criada com baseada no modelo C4.

## Descrição geral sobre o HoCo

O HoCo tem como objetivo principal sanar uma deficiência conhecida no curso de Ciência da Computação na UFCG, a falta de conhecimento sobre o funcionamento de horas e atividade complementares do curso, implementando uma plataforma que trás acesso a essa informação e que facilita a avaliação das atividades complementares por parte da coordenação do curso.

# O HoCo

## Objetivo Geral

O projeto visa criar uma plataforma onde os alunos poderão fazer o gerenciamento das suas atividades complementares de forma simples e unificada, tirar suas possíveis dúvidas quanto ao funcionamento destas e enviar suas atividades para que esta seja analisada pelo professor responsável por essa análise.

## Objetivos específicos

O HoCo possuirá uma API interna com o objetivo de intermediar o acesso de dois frontend, o HoCo e o HoCo-pro, ao banco de dados onde estarão os dados dos usuários.

A plataforma do HoCo será voltada unicamente para as pessoas que são alunas do curso. Nela o usuário conseguirá fazer o cadastro de atividades com seus certificados e em seguida envia-los para análise. Por outro lado o HoCo-pro será voltado unicamente para que a pessoa professora possa ter acesso às atividades complementares enviadas para anaĺise e avalia-las, aprovando, desaprovando ou requisitando edições.
