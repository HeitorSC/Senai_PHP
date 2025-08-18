CREATE DATABASE escola;	
SHOW DATABASES;
USE escola;
CREATE TABLE alunos(
matricula INT PRIMARY KEY,
nome VARCHAR(100),
curso VARCHAR(50)
);

INSERT INTO alunos(matricula, nome, curso) 
VALUES(1, "Joao", "InformáticaSELECT `alunos`.`matricula`,
    `alunos`.`nome`,
    `alunos`.`curso`
FROM `escola`.`alunos`;
");

INSERT INTO alunos(matricula, nome, curso)
VALUES(2, 'Maria Ferreira' , 'Administração');

INSERT INTO alunos(matricula, nome, curso)
VALUES(3, 'Daniel Santos', 'Back-end PHP');

UPDATE alunos
SET curso = 'Informática'
WHERE matricula = '1';

SELECT * FROM alunos;

SELECT A.matricula,
    A.nome,
    A.curso
FROM escola.alunos as A
WHERE matricula = 1 or matricula = 2;





