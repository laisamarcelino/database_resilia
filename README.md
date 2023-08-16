# database_resilia_M3
Projeto em grupo do Módulo 3 -> Criação de um banco de dados fictício

O projeto foi desenvolvido utilizando o sistema de gerenciamento de banco de dados relacional MySQL utilizando o SQL (Structured Query Language) como linguagem para a manipulação e consulta de dados.

Objetivo: O projeto foi criado com o intuito de promover o estudo e prática do conteúdo Banco de Dados a partir de uma problemática fictícia, em que a equipe foi escalada pela Resília, instituição de ensino privada, para modernizar o processo de armazenamento de dados da empresa por meio da construção de um banco de dados para o gerenciamento da estrutura de ensino da empresa.

Plataformas utilizadas:

* DbDiagram -> Ferramenta online que permite criar modelos visuais de diagramas de bancos de dados de forma simples e intuitiva. Utilizada para a modelagem do banco de dados, isto é criação das tabelas e cardinalidades entre elas;
* MySQL Workbench -> Ferramenta visual de administração e design para o sistema de gerenciamento de banco de dados MySQL. Utilizada como ambiente de trabalho para o desenvolvimento das tabelas, inserção de dados e consultas a informações.

Informações contidas no Banco de Dados:

* Endereço dos estudantes e funcionários da Resília;
* Informações básicas (como nome, telefone, CPF, etc.) para identificação dos estudantes e funcionários, bem como seu e-mail e senha para ingresso na plataforma Resília;
* Listagem dos facilitadores e estudantes, bem como a frequência deste último;
* Listagem dos cursos da empresa, bem como os módulos que estes possuem;
* Listagem das turmas existentes;
* Informações sobre datas de avaliação e notas dos alunos;
* Quais facilitadores e alunos fazem parte de determinada turma.

Para utilizar o Banco de Dados instale e configure o MySQL Workbench, copie e cole os arquivos na seguinte ordem:
* criacao_tabelas.sql -> cria o banco de dados e suas respectivas tabelas;
* insercao_dados.sql -> insere dados nas tabelas criadas;
* consultas_ao_bd.sql -> realiza exemplos de consultas.
