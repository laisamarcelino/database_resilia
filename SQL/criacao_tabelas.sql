CREATE DATABASE resilia;
USE resilia;

CREATE TABLE `Endereco` (
  `endereco_id` int PRIMARY KEY AUTO_INCREMENT,
  `cep` varchar(8) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(6) NOT NULL,
  `complemento` varchar(20)
);

CREATE TABLE `Pessoas` (
  `id_pessoa` int PRIMARY KEY AUTO_INCREMENT,
  `tipo_de_cadastro` varchar(11),
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11),
  `data_nascimento` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(14) NOT NULL,
  `endereco_id` int
);

CREATE TABLE `Facilitadores` (
  `id_facilitador` int PRIMARY KEY AUTO_INCREMENT,                                                   
   `area_atuacao`varchar (20),
   `salario` int NOT NULL, 
   `id_pessoa` int
);

CREATE TABLE `Estudantes` (
  `id_estudante` int PRIMARY KEY AUTO_INCREMENT,
  `frequencia` int DEFAULT 0,
  `id_pessoa` int
);

CREATE TABLE `Modulos` (
  `id_modulo` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `modulo` INT NOT NULL
);

CREATE TABLE `Cursos` (
  `id_curso` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `tempo_duracao` int NOT NULL,
  `custo` int NOT NULL
);

CREATE TABLE `Cursos_modulos` (
  `id_curso` int,
  `id_modulo` int
);