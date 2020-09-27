+++
title = "Instruções para escrever o post"
date = 2019-10-29
tags = []
categories = []
+++

***

Por favor, leia com cuidado as instruções abaixo.

# O que você deve produzir?

Um documento de descrição arquitetural. [Neste link](https://joaoarthurbm.github.io/arqsoft20203/posts/documento-guia/) estão as instruções sobre formato e sobre o que é preciso em cada seção do documento. Por favor, mantenha o formato que estabeleci.

# Como escrever o documento?

Você vai escrever em Markdown, que é uma linguagem simples de marcação. Não se preocupe se não souber a sintaxe, pois você pode, por exemplo, basear a escrita no Markdown que gerou este post ([link](https://raw.githubusercontent.com/joaoarthurbm/arqsoft20203/master/content/posts/documento-guia.md)). 

Markdown é bem simples de entender e há muito material sobre markdown na web.

# Onde escrever?

Nós vamos usar este repositório: https://github.com/joaoarthurbm/arqsoft20203

Você terá que submeter o markdown (e as figuras que produziu) como Pull Requests.

Este pull request que você fará, será revisado por mim e, quando aceito, automaticamente vira um post em https://joaoarthurbm.github.io/arqsoft20203/

# Como fazer?

## Pré-quisitos

Você precisa instalar o hugo na sua máquina. Veja este link: https://gohugo.io/getting-started/installing/

## Passo a passo


### Setup git/github

1. Faça um fork do projeto https://github.com/joaoarthurbm/arqsoft20203/.

2. Faça clone do repositório e dos submodulos https://github.com/SEU-USUARIO/arqsoft20203/

	`git clone --recurse-submodules https://github.com/SEU-USUARIO/arqsoft20203.git`

3. Crie uma branch cujo nome será o seu login @ccc

	`git branch NOME.SOBRENOME`

4. Mude para a branch que você acabou de criar

	`git checkout NOME.SOBRENOME`

### Produzindo conteúdo

1. Entre na pasta `content/posts`
	
	`cd content/posts`

Nesta pasta estarão os documentos de vocês. Aqui você deve criar um arquivo e um diretório:

- O markdown do seu documento. 
Use o nome do projeto que você está documentando. Por exemplo: `instagram.md`. Este documento é onde você vai escrever o conteúdo da sua descrição arquitetural. Veja um exemplo de markdown que eu gerei ([link](https://github.com/joaoarthurbm/arqsoft20203/blob/master/content/posts/documento-guia.md))
		 
- um diretório com o mesmo nome que você deu ao markdown (exceto pela extensão). No exemplo que tratei, seria um diretório chamado `instagram`. Neste diretório estarão as imagens que você usará no seu documento (as que são referenciadas no markdown). 

2. Verifique se o seu post está bem formatado.

	2.1 Vá para a raiz do projeto.
	
	2.2 execute `hugo server`
	
	2.3 Verifique o seu post em `http://localhost:1313/arqsoft20203/`

Observe que agora você pode mudar o markdown e ver o resultado sempre. O hugo fica monitorando atualizações nos arquivos e atualiza sempre que um arquivo for modificado. 

# Como entregar?

Simples. Faça um Pull Request do markdown e do diretório de figuras que você criou. Eu revisarei e, assim que for aceito, seu post estará publicado em https://joaoarthurbm.github.io/arqsoft20203