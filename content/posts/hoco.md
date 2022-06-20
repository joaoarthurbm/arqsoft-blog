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

### Contexto

Primeiramente temos o usuário do sistema, este é um estudante do curso de Ciência da Computação na UFCG ele é responsável por enviar os seus certificados recebidos em atividades complementares para o sistema HoCo armazenar. No sistema HoCo, esses certificados podem ser facilmente enviados para a avaliação, além disso, há a opção de visualização de como os créditos das atividades dos alunos estão distribuídos entre os vários tipos de atividades complementares, o HoCo também lista as organizações estudantis do curso que possuem atividades complementares, além disso, lista também dúvidas recorrentes dos estudantes. 

Como é exibido no diagrama abaixo, há o usuário do tipo professor(a), isso porque há a implementação também web do HoCo para uso exclusivo dos professores, o HoCo Pro.

Por fim, há a API de avaliação desenvolvida pela coordenação do curso, sendo esta responsável por permitir que a avaliação e feedback das atividades complementares cadastradas sejam realizadas.

![fig1](/content/hoco/diagrama-contexto.png)
