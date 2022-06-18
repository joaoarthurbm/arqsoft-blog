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

## Descrição geral sobre o HoCo

O HoCo tem como objetivo principal sanar uma deficiência conhecida no curso de Ciência da Computação na UFCG, a falta de conhecimento sobre o funcionamento de horas e atividade complementares do curso.

O projeto visa criar uma plataforma onde os alunos poderão fazer o gerenciamento das suas atividades complementares de forma simples e unificada. Ao fazer uso do HoCo o aluno poderá cadastrar suas atividades complementares e estas serão enviadas para a coordenação do curso para que essas sejam avaliadas quanto a sua corretude e validez de forma automática.

### Visão de Informação

A máquina de estados a seguir explicita o ciclo de vida do processo de dispensa de horas complementares proposto pelo HoCo. Para tal, inicialmente cadastra-se atividades do aluno informando o nome da atividade, os créditos obtidos na atividade, as horas equivalentes a atividade, e a categoria da atividade (tais dados são persistidos em um banco de dados). Caso algum dado necessite de alteração, efetua-se a edição dos dados (um ou mais campos de interesse). Em seguida, para comprovar a validade das informações fornecidas, os arquivos comprovatórios de cada atividade são carregados e enviados para a coordenação do curso para que a validação dos dados possa ser efetuada. Caso as informações entre os dados e os arquivos sejam compatíveis o processo de dispensa de horas é efetuado. Caso contrário, o usuário é informado de uma incompatibilidade entre as informações, e o ciclo deve seguir novamente a partir do estado de edição.

![figME](maquina-estados.png)