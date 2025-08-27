
-- criando a tablea filmes no db locadora
CREATE TABLE filmes(
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

-- craindo a tabela clientes
CREATE TABLE clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome_cliente VARCHAR(100) NOT NULL,
id_filme INT,
FOREIGN KEY(id_filme) REFERENCES filmes(id_filme)
);

INSERT INTO filmes(titulo)
VALUES
('Matrix'), 
('Aliens'),
('Fast and Furious');

INSERT INTO clientes (nome_cliente, id_filme)
VALUES
('Joao da Silva', 1),
('Sergio dos Santos', 2),
('Rafaela Oliveira', 3);


SELECT 
    clientes.id_cliente,
    clientes.id_filme,
    filmes.id_filme,
    clientes.nome_cliente, 
    filmes.titulo
FROM 
    clientes
JOIN filmes 
ON clientes.id_filme = filmes.id_filme;

-- Aula de 25/08/2025

DROP DATABASE IF EXISTS empresaDB;

CREATE DATABASE empresaDB;

USE empresaDB;

CREATE TABLE IF NOT EXISTS funcionarios(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cargo VARCHAR(50) NOT NULL,
salario DECIMAL(10,2) NOT NULL
);

INSERT INTO funcionarios (nome, cargo, salario) VALUES
('Ana Silva', 'Gerente', 8500.00),
('Bruno Souza', 'Analista', 4500.00),
('Carla Mendes', 'Analista', 4700.00),
('Diego Alves', 'Desenvolvedor', 3500.00),
('Fernanda Costa', 'Desenvolvedor', 3600.00),
('Gabriel Lima', 'Estagiário', 1500.00);

SELECT * FROM funcionarios;

CREATE USER 'user_gerente'@'localhost' 
IDENTIFIED by '123';

CREATE USER 'user_analista'@'localhost'
IDENTIFIED BY '456';

CREATE USER 'user_dev'@'localhost'
IDENTIFIED BY '789';

CREATE USER 'user_estagiario'@'localhost'
IDENTIFIED BY '100';

-- CONCEDER PERMISSÕES PARA USUÁRIOS
GRANT ALL PRIVILEGES  ON empresaDB.funcionarios 
TO 'user_gerente'@'localhost';

GRANT SELECT, UPDATE ON empresaDB.funcionarios 
TO 'user_analista'@'localhost';

GRANT SELECT ON empresaDB.funcionarios 
TO 'user_dev'@'localhost';

GRANT SELECT ON empresaDB.funcionarios 
TO 'user_estagiario'@'localhost';

REVOKE ALL PRIVILEGES ON empresaDB.funcionarios
FROM 'user_gerente'@'localhost';

CREATE DATABASE clinicavidaplena;

use clinicavidaplena;


CREATE TABLE `clinicavidaplena`.`pacientes` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL UNIQUE,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_paciente`));

  CREATE TABLE `clinicavidaplena`.`medicos` (
  `id_Medico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `especialidade` ENUM('Clinico Geral', 'Pediatra', 'Cardiologia') NULL,
  `crm` VARCHAR(20) NULL UNIQUE,
  PRIMARY KEY (`id_Medico`));

CREATE TABLE `clinicavidaplena`.`consultas` (
  `id_Consultas` INT NOT NULL AUTO_INCREMENT,
  `id_Paciente` INT NOT NULL,
  `id_Medico` INT NOT NULL,
  `data_consulta` DATETIME NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id_Consultas`),
  INDEX `id_Paciente_idx` (`id_Paciente` ASC),
  INDEX `fk_medico_idx` (`id_Medico` ASC),
  CONSTRAINT `fk_Paciente`
    FOREIGN KEY (`id_Paciente`)
    REFERENCES `clinicavidaplena`.`pacientes` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico`
    FOREIGN KEY (`id_Medico`)
    REFERENCES `clinicavidaplena`.`medicos` (`id_Medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO PACIENTES(nome, cpf, data_nascimento, telefone)
VALUES('Joao da Silva', '12345678901', '2000-01-01', '61912344567'),
('Pedro Oliveira', '12345678902', '2000-01-02', '61912344568'),
('Julia Nascimento', '12345678903', '2000-01-03', '61912344569');

INSERT INTO medicos (nome, especialidade, crm)
VALUES('Antonio Junior', 'Cardiologia', '123456'),
('Karol Barbosa', 'Pediatra', '123457');

INSERT INTO consultas (id_paciente, id_medico, data_consulta, valor)
VALUES
(1, 1, '2025-08-26 09:30', 800.00),
(2, 2, '2025-08-26 10:30', 700.00),
(3, 1, '2025-08-26 09:30', 800.00);


SELECT *
FROM consultas
JOIN medicos ON consultas.id_medico = medicos.id_medico
JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente;

SELECT * FROM pacientes;

SELECT * FROM medicos;

SELECT * FROM consultas;

UPDATE pacientes
SET telefone = '6291000000'
WHERE id_paciente = 1;

UPDATE medicos
SET nome = 'Antonio Jose H'
WHERE id_medico = 1;

UPDATE consultas
SET data_consulta = '2025-08-26 08:30'
where id_consultas = 1;

DELETE FROM pacientes
WHERE id_paciente = 3;

DELETE FROM medicos
WHERE id_medico = 2;

DELETE FROM consultas
WHERE id_consultas = 1;

use clinicavidaplena;
    drop table pacientes;

    drop table medicos;

    drop table consultas;
