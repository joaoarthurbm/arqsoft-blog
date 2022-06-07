# SpotBugs

# Autores

Este documento foi produzido por: 

Arthur Dantas Porto
- Matrícula: 118210628
- Contato: joao.arthur@computacao.ufcg.edu.br

Renan Nunes Viana
- Matrícula: 118210164
- Contato: joao.arthur@computacao.ufcg.edu.br

Willy Guimarães Moraes Barros
- Matrícula: 118210278
- Contato: joao.arthur@computacao.ufcg.edu.br

Victor Paiva dos Santos
- Matrícula: 118210854
- Contato: joao.arthur@computacao.ufcg.edu.br

- Projeto documentado: https://github.com/spotbugs/spotbugs

# Descrição Arquitetural

Este documento descreve parte da arquitetura do projeto [SpotBugs](https://github.com/spotbugs/spotbugs). Essa descrição foi baseada principalmente no modelo [C4](https://c4model.com/).

É importante destacar não será descrita toda a arquitetura do SpotBugs. 


## Descrição Geral sobre o SpotBugs

SpotBugs is a program which uses static analysis to look for bugs in Java code. It is free software, distributed under the terms of the [GNU Lesser General Public License.](http://www.gnu.org/licenses/lgpl-3.0.html)

SpotBugs is a fork of [FindBugs](http://findbugs.sourceforge.net/) (which is now an abandoned project), carrying on from the point where it left off with support of its community. Please check [the official manual](https://spotbugs.readthedocs.io/en/latest/) for details.

SpotBugs requires JRE (or JDK) 1.8.0 or later to run. However, it can analyze programs compiled for any version of Java, from 1.0 to 1.9.