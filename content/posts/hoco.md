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

Primeiramente temos o usuário do sistema, este é um estudante do curso de Ciência da Computação na UFCG. Esse usuário é responsável por enviar os seus certificados recebidos em atividades complementares para o sistema HoCo armazenar. No sistema HoCo, esses certificados podem ser facilmente enviados para a avaliação.

 Além disso, temos a opção de visualização de como os créditos das atividades dos alunos estão distribuídos entre os vários tipos de atividades complementares, o HoCo também lista as organizações estudantis do curso que possuem atividades complementares e do mesmo modo lista dúvidas recorrentes dos estudantes. 

Como é exibido no diagrama abaixo, existe um segundo tipo de usuário, o(a) professor(a), isso porque há a implementação também web do HoCo para uso exclusivo dos professores, o HoCo-pro, onde a pessoa professora poderá fazer a avaliação das atividades complementares.

Por fim, há a API de avaliação desenvolvida pela coordenação do curso, sendo esta responsável por permitir que a avaliação e feedback das atividades complementares cadastradas sejam realizadas.

![fig1](/content/hoco/diagrama-contexto.png)

### Containers

Como exibido no diagrama abaixo, o HoCo é composto por vários containers que compõe o sistema.

O primeiro deles, é o HoCo web que é uma aplicação que utiliza o protocolo HTTPS e que pode ser acessada pelos estudantes por meio de qualquer browser, sendo assim, ela é desenvolvida para uso em diversos dispositivos, como celular e tablets. Para isto, está sendo utilizada a biblioteca [React](https://pt-br.reactjs.org/) 
Esse container tem a responsabilidade de fazer o armazenamento, envio de certificados de atividades complementares, além de cuidar da exibição da distribuição de horas dos alunos, bem como listagens de atividades e dúvidas

Em segundo lugar, se tem o HoCo-pro que é uma aplicação também web que utiliza o protocolo HTTPS e pode ser acessada pelos professores atráves de qualquer browser, este também faz uso da biblioteca [React](https://pt-br.reactjs.org/), e tem a função de permitir a análise dos certificados de atividades complementares e envio de feedbacks.

Ambos sistemas listados acima HoCo e HoCo-pro fazem uso da API RESTful HoCo desenvolvida em Python utilizando o framework [Flask](https://flask.palletsprojects.com/en/2.1.x/). Esse container tem a responsabilidade de servir tanto as funcionalidades e fazer o agente intermediário entre o frontend e o banco de dados, tratando e processando os possíveis dados.

Algumas das principais operações que a API HoCo disponibiliza são:

```
GET /credits
```

```
GET /categories/
```

```
POST /activity
```

```
GET /activities
```

```
PATCH /activity?id=<atividade_id>
```

```
DELETE /atividade?id=<atividade_id>
```

```
POST /org
```

```
GET /orgs
```

```
DELETE /org?id=<org_id>
```

```
POST /question
```

```
GET /questions
```

```
DELETE /question?id=<question_id>
```

O sistema HoCo-pro além de fazer uso da API HoCo também fará uso do container API de avaliação que será desenvolvida utilizando [Java](https://www.java.com/) e [Spring Boot](https://spring.io/projects/spring-boot) e é responsável por disponibilizar rotas para a avaliação das atividades complementares cadastradas pelos estudantes.

Por fim, existe o container Database, como é exibido no diagrama está sendo utilizado o MongoDB que é um banco de dados não relacional que armazena os dados dos estudantes, certificados de atividades complementares, imagens das organizações, dúvidas recorrentes e etc.

![fig1](/content/hoco/diagrama-containers.png)
