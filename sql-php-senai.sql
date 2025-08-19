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

-- 
CREATE DATABASE redesocial;
USE redesocial;

CREATE TABLE IF NOT EXISTS usuarios(
idusuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
genero ENUM('M', 'F', 'Outro'),
interesses SET('Música', 'Esporto', 'Tecnologia', 'Viagens'),
cpf CHAR(11) UNIQUE,
data_nascimento DATE,
biografia TEXT,
foto_perfil BLOB,
online BIT(1)
);

drop TABLE usuarios;

-- Inserir registros na tabela usuarios
INSERT INTO usuarios(
    nome, 
    genero, 
    interesses, 
    cpf, 
    data_nascimento, 
    biografia, 
    foto_perfil, 
    online)
VALUES(
    'Ana Souza',
    'F',
    'Música, Via',
    '12345678901',
    '2000-08-19',
    'Estudante apaixonada por viagens.',
    null,    
    ''
);

SELECT * FROM usuarios;

CREATE TABLE postagens(
idpost INT AUTO_INCREMENT PRIMARY KEY,
conteudo LONGTEXT,
datapost DATETIME,
likes INT DEFAULT 0,
views INT
);

-- Cria registro de postagem

INSERT INTO postagens(
    conteudo,
    datapost,
    likes,
    views
)
VALUES(
    'Primeiro post da Ana: Bom dia!',
    NOW(),
    10,
    100
);




