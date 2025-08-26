-- 1. Crie as tabelas respeitando as restrições de chaves primárias e estrangeiras.

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema escolaIdiomas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema escolaIdiomas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `escolaIdiomas` DEFAULT CHARACTER SET utf8 ;
USE `escolaIdiomas` ;

-- -----------------------------------------------------
-- Table `escolaIdiomas`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escolaIdiomas`.`professores` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(100) NOT NULL,
  `especialidade_professor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_professor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escolaIdiomas`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escolaIdiomas`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(100) NOT NULL,
  `carga_horaria` TIME NOT NULL,
  `id_professor` INT NOT NULL,
  PRIMARY KEY (`id_curso`),
  INDEX `fk_cursos_professores1_idx` (`id_professor` ASC),
  CONSTRAINT `fk_cursos_professores1`
    FOREIGN KEY (`id_professor`)
    REFERENCES `escolaIdiomas`.`professores` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escolaIdiomas`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `escolaIdiomas`.`alunos` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(100) NOT NULL,
  `idade_aluno` INT(3) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `id_curso` INT NOT NULL,
  PRIMARY KEY (`id_aluno`),
  INDEX `fk_alunos_cursos_idx` (`id_curso` ASC),
  CONSTRAINT `fk_alunos_cursos`
    FOREIGN KEY (`id_curso`)
    REFERENCES `escolaIdiomas`.`cursos` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


use escolaIdiomas;

-- 2. Insira registros de exemplo (mínimo 6 alunos, 5 cursos e 3 professores).

insert into professores (nome_professor, especialidade_professor)
values
('Paulo Silva', 'Inglês'),
('Joao Oliveira', 'Espanhol'),
('Bruno Sousa', 'Alemão');

select * from professores;

insert into cursos(nome_curso, carga_horaria, id_professor)
values
('Inglês basico', '50:00', 1),
('Inglês avançado', '100:00', 1),
('Espanhol basico', '50:00', 2),
('Espanhol avançado', '100:00', 2),
('Alemão do basico ao avançado', '250:00', 3);

select * from cursos;

insert into alunos(nome_aluno, idade_aluno, email, id_curso)
values
('Ana Silva', 20, 'ana@gmail.com', 1),
('Bruna Silva', 25, 'bruna@gmail.com', 1),
('Caio Alencar', 30, 'caio@gmail.com', 2),
('Mario Torres', 28, 'mario@gmail.com', 3),
('Nivea Santos', 33, 'nivea@gmail.com', 4),
('Luna Silva', 40, 'luna@gmail.com', 5);

select * from alunos;

-- 3. Atualize o curso de um aluno que decidiu mudar de idioma.

update alunos
set id_curso = 2
where id_aluno = 2;

-- 4. Delete o registro de um aluno que desistiu do curso.

delete from alunos
where id_aluno = 6;

select * from alunos;

-- 5. Faça o DROP da tabela Professores.

drop table professores;

-- 6. Crie dois usuários específicos do banco de dados com permissão apenas para inserir novos alunos (use GRANT).

create user 'diretor'@'localhost' identified by 'dir123';
create user 'professor'@'localhost' identified by 'prof456';

grant insert on escolaIdiomas.alunos to 'diretor'@'localhost';
grant insert on escolaIdiomas.alunos to 'professor'@'localhost';

-- 7. Remova a permissão de um dos usuários (use REVOKE).

revoke insert on escolaIdiomas.alunos from 'professor'@'localhost';


-- Desafio opcional (Vale Ponto Extra):
-- 1. Crie uma consulta que exiba: o nome do aluno e o id do curso no qual ele está matriculado.

select nome_aluno, cursos.id_curso, cursos.nome_curso
from alunos
join cursos 
on alunos.id_curso = cursos.id_curso;


