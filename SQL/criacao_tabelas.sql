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