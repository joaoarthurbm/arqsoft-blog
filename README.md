# 2020.3 Arquitetura de Software - Computação @ UFCG
Repositório para organizar as documentações arquiteturais produzidas pelos alunos da turma de Arquitetura de Software do curso de Ciência da Computacao @ UFCG

# Criando um Post

## Pré-quisitos

Você precisa instalar o hugo na sua máquina. Veja este link: https://gohugo.io/getting-started/installing/

## Passo a passo


### Setup git/github

1. Faça um fork do projeto https://github.com/joaoarthurbm/arqsoft-blog.

2. Faça clone do repositório e dos submodulos https://github.com/SEU-USUARIO/arqsoft-blog/

	`git clone --recurse-submodules https://github.com/SEU-USUARIO/arqsoft-blog.git`

3. Crie uma branch cujo nome será o seu login @ccc

	`git branch NOME.SOBRENOME`

4. Mude para a branch que você acabou de criar

	`git checkout NOME.SOBRENOME`

### Produzindo conteúdo

1. Entre na pasta `content/posts`
	
	`cd content/posts`

Nesta pasta estarão os documentos de vocês. Aqui você deve criar um arquivo e um diretório:

- O markdown do seu documento. 
Use o nome do projeto que você está documentando. Por exemplo: `instagram.md`. Este documento é onde você vai escrever o conteúdo da sua descrição arquitetural. Veja um exemplo de markdown que eu gerei ([link](https://github.com/joaoarthurbm/arqsoft-blog/blob/master/content/posts/documento-guia.md))
		 
- um diretório com o mesmo nome que você deu ao markdown (exceto pela extensão). No exemplo que tratei, seria um diretório chamado `instagram`. Neste diretório estarão as imagens que você usará no seu documento (as que são referenciadas no markdown). 

2. Verifique se o seu post está bem formatado.

	2.1 Vá para a raiz do projeto.
	
	2.2 execute `hugo server` ou `docker compose up -d`. A versão do hugo que uso é a v0.75.1.
	
	2.3 Verifique o seu post em `http://localhost:1313/arqsoft-blog/`

Observe que agora você pode mudar o markdown e ver o resultado sempre. O hugo fica monitorando atualizações nos arquivos e atualiza sempre que um arquivo for modificado. 


Veja aqui a descrição detalhada de como criar um post em fazer um PR no blog: https://joaoarthurbm.github.io/arqsoft-blog/posts/instrucoes/


# Ferramentas

## Hugo no Docker
Caso não queira instalar o hugo, utilize o docker.

```shell
docker-compose up -d
```

Em seguida, acesse http://localhost:1313/arqsoft-blog
