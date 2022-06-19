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


## Diagrama de componetes

Abaixo, é possível observar o diagrama de componentes do sistema:

![ComponetDiagram](/content/posts/hoco/diagrama-componetes.png)

**Nos componentes, temos:**

*Os componentes referentes à sessão de perguntas e organizações são bastante semelhantes.*

**Questions Controller e Organization Controller:** São REST Controllers do Flask que fazem o controle sobre a sessão de perguntas e de organização do HoCo, respectivamente, pois é possível que o usuário administrador cadastre dúvidas e suas respostas e organizações e comunidades existentes na graduação no HoCo, esses componetes fazem uso respectivamente dos componetes Questions Modells e Organization Modells. Ambos não precisam de login;

**Questions Models e Organization Models:** São componetes que fazem a conexão com o Banco de Dados, fazendo leitura e/ou escrita dos dados no mesmo;

**Login Controller:** Esse componente é um REST Controller do Flask que faz o controle da sessão de login, é responsável por realizar o login e logout do usuário e a restauração da senha do usuário, fazendo uso do componente Security Component;

**Security Component:** É o componente responsável por criptografar e descriptografar as senhas dos usuários, verificar se os dados de login estão corretos, verificar se o usuário tem permissão de acesso à funcionalidade solicitada pelo mesmo;

**User Controller:** É um REST Controller do Flask que provê todas as funcionalidades referentes à um usuário em específico, por isso faz uso do Security Component, pois é necessário que o usuário esteja logada para que a pessoa possa acessar funcionalidades especificas, como cadastro de atividades (Rota de acessoa 
 dúvidas e respostas, organizações e cadastro do usuário são públicas para qualquer pessoa acessar sem login), como o cadastro do usuário (não precisa de login), exclusão de conta, cadastro de atividades, exclusão de atividade, edição de perfil, aprovar atividade (precisa que o usuário tenha mais permissões, não permitindo que um aluno aprove atividades);

**User Models:** É o componenente que faz a conexão com o Banco de Dados, fazendo a leitura e escrita dos dados no mesmo;

**Atividade Service:** É o componente responsável por prover todas as funcionalidades referentes às atividades, como cadastro, cálculo de créditos, recuperação das atividades e suas informações. Esse componente tambem faz conexão com o Banco de Dados, fazendo a leitura e escrita dos dados no mesmo;