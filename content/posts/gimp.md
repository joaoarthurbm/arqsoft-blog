+++
title = "Documentação arquitetural para o GIMP" 
date = 2020-12-07 
tags = [] 
categories = [] 
+++

***

Este documento descreve a arquitetura do projeto GIMP.

***

# Autores

Este documento foi produzido por Mariana Araújo Lucena.

- Matrícula: 115211305
- Contato: mariana.lucena@ccc.ufcg.edu.br
- Projeto documentado: https://github.com/GNOME/gimp

# Descrição Arquitetural -- GNOME/gimp

Este documento foi produzido para a disciplina de Arquitetura de Software da UFCG, e tem como objetivo descrever parte da arquitetura do projeto [GNOME/gimp](https://github.com/GNOME/gimp). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar que não será descrita toda a arquitetura do GIMP. O foco aqui é a descrição de um serviço específico de análise do GIMP, que é parte fundamental do projeto.

## Descrição Geral sobre o GIMP

GIMP (acrônimo para GNU Image Manipulation Program) é um programa voltado, essencialmente, para edição e criação de imagens raster e, em menor escala, para desenho vetorial. O software é repleto de recursos, de fácil uso e uma boa alternativa gratuita ao mais conhecido dos editores, o gigante Adobe Photoshop.

## Os Plugins de filtros no GIMP

### Objetivo Geral

As funcionalidades do GIMP pode ser facilmente estendida por meio de plugins. Plugins do GIMP são programas externos que são executados sob o controle da aplicação principal GIMP e interagem com ela muito de perto. Plugins podem manipular imagens de quase todas as formas que os usuários querem. 

Várias dezenas de plugins estão incluídas na distribuição oficial do GIMP e são instaladas automaticamente junto com o programa. A maioria deles pode ser acessada através do menu filtros (na verdade, tudo nesse menu é um plugin ou um script), mas vários deles estão localizados em outros menus. Em muitos casos, você pode usar um sem nunca perceber que é um plugin: por exemplo, a função "Normalizar" para correção automática de cores é na verdade um plugin, embora não há nada na maneira como ela funciona que iria demonstrar isso.

Os filtros permitem fazer efeitos complexos com poucos cliques, efeitos como de iluminação, distorção, entre outros. No menu “Filtros”, você tem acesso a mais de 140 tipos de filtros diferentes. Os filtros são divididos em 15 categorias para que você consiga achá-los mais facilmente. Essas categorias são: desfocar, realces, distorções, efeitos de sombra, efeitos de luz, ruído detectar borda, genéricos, combinar, filtros artísticos, mapear, renderizar, web, animação, alfa para logo, decoração.


### Contexto

É necessário executar o download do instalador do GIMP e abrir o arquivo de instalação. Depois da instalação, pode começar a usá-lo. Para a aplicação de filtros em uma imagem, é necessário fazer o upload da mesma para o programa, no menu superior selecionar a janela "Filtros" e, logo após, escolher o filtro. 

Para adicionar um plugin de um novo filtro na interface do GIMP é necessário instalar o plugin, descompactá-lo, entrar na pasta do efeito e copiar todos os arquivos .py. Logo após, é necessário acessar a pasta de plugins do GIMP e colar os arquivos .py selecionados anteriormente. Reinicie o programa e o novo filtro já poderá ser visto na aba "Filtros" do menu. 

Abaixo está o diagrama de contexto.

<img class="center" border="15px" src="https://github.com/marianaalucena/mini-projeto/blob/main/imagens/contexto1.jpg?raw=true" />



### Containers

Script-Fu é uma linguagem para escrever scripts, que permite que você execute uma série de comandos do GIMP automaticamente.

Python-Fu é um conjunto de módulos Python que funcionam como um conteúdo adicional para libgimp, permitindo a escrita de plug-ins para o GIMP.

<img class="center" border="15px" src="https://github.com/marianaalucena/mini-projeto/blob/main/imagens/containers.jpg?raw=true" />


### Componentes

O GIMP foi projetado para ser extensível com scripts e plug-ins. Esses dois são tecnicamente diferentes, os scripts estão em Script-Fu e são interpretados pelo interpretador de script integrado. Plugins são processos independentes escritos em potencialmente qualquer idioma. Por muito tempo isso significou apenas C, mas desde o 2.6 também existe uma interface para Python. Mas, para complicar as coisas, a maioria dos "plug-ins" python são escritos como scripts: eles são principalmente colados entre as chamadas para a API do Gimp, como as de script-fu, então você ouvirá sobre scripts Python (mas eles são realmente plug-ins).

#### Script-Fu

Script-Fu é o que o alguns aplicativos chamam de "macros". Script-Fu é baseado em uma linguagem interpretada chamada Scheme, e funciona usando funções do banco de procedimentos do GIMP. É possível fazer todos os tipos de coisas com Script-Fu, mas um usuário comum do GIMP provavelmente irá usá-lo para automatizar as coisas que: faz com frequência e/ou são muito complicadas de fazer, e difíceis de lembrar.

Existem muitos scripts que vêm com o GIMP por padrão, mas existem também grandes quantidades de scripts que estão disponíveis para download em toda Internet.

Se você tiver baixado um script, copie ou mova o para seu diretório de scripts. Ele pode ser encontrado em Preferências: Pastas → Scripts.

Faça uma atualização usando filtros → Script-Fu → Atualizar Scripts no menu imagem. O script agora vai aparecer em um dos seus menus. Se você não encontrá-lo, procurar nos filtros no menu de arquivos raiz. Se ele não aparecer em lugar nenhum, algo estava errado com o script e ele não funcionou. (por exemplo, contém erros de sintaxe).

#### Python-Fu

Gimp-Python é uma extensão de script para Gimp, semelhante ao Script-Fu. A principal diferença está no que é chamado primeiro. No Script-Fu, o plugin script-fu executa o script, enquanto no Gimp-Python o script está no controle. Outro ponto de diferença entre o Gimp-Python e o Script-Fu é que o Gimp-Python armazena imagens, camadas, canais e outros tipos como objetos em vez de apenas armazenar seus IDs. Isso permite uma melhor verificação de tipo que está faltando no Script-Fu e permite que esses tipos atuem como objetos, completos com atributos e métodos.

Além disso, o Gimp-Python não se limita apenas a chamar procedimentos do PDB. Ele também implementa o resto do libgimp , incluindo blocos e regiões de pixel, e acesso a outras funções de nível inferior.

Existe um módulo python chamado plugin.py que define uma estrutura para plug-ins e implementa algumas coisas que eram muito difíceis ou impossíveis de fazer em C.

O principal objetivo do plugin.py é implementar uma estrutura orientada a objetos para plug-ins. Além disso, ele lida com tracebacks, que de outra forma são ignorados por libgimp, e fornece um método para chamar outros plug-ins Gimp-Python sem passar pelo banco de dados procedural.


### Código

<pre>
Nesta etapa não faremos diagramas que apresentam detalhes da
implementação. Faremos isso mais adiante.
</pre>

### Visão de Informação

O Arquivo é primeiramente selecionado pelo usuário para realização de upload no programa, em seguida é necessário selecionar o filtro desejado, aplicá-lo na imagem, a partir dai tem-se duas opções: salvar e fechar o arquivo ou reverter ao original.

<img class="center" border="15px" src="https://github.com/marianaalucena/mini-projeto/blob/main/imagens/infoFiltro.jpg?raw=true" />

# Contribuições Concretas

Até o presente momento ainda não foi aberto nenhum pull request desta documentação para o repositório de docs do GNOME/GIMP.
