CREATE DATABASE Escola;


USE Escola;

CREATE TABLE alunos(
	id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    email VARCHAR(100)
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE matriculas(
	id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


-- EXERCICIOS DML ************************
-- INSERIR ALUNOS
INSERT INTO aluno(id_aluno, nome, data_nascimento, email, telefone)
VALUES
(1, 'Ana Souza','2000-05-10','ana@email.com'),
(2, 'Carlos Lima', '1999-11-22','carlos@email.com');

-- INSERIR CURSOS
INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES
(1,'Ciência da computação','100'),
(2,'Matematica','200');

SELECT * FROM cursos;
-- INSERIR MATRICULAS
INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES
(1,1, 101, '2024-03-02'),
(2,2, 102, '2024-03-02');

UPDATE alunos SET telefone = '119237283712' WHERE id_aluno = 1;

DELETE FROM cursos WHERE nome_curso = 'Matematica';-- ESTA DANDO ERRO POIS NÃO PODE APAGAR
 
ALTER TABLE alunos ADD telefone VARCHAR(20);

-- ALTERAR TIPO DA COLUNA CARGA HORÁRIA
ALTER TABLE cursos

MODIFY COLUMN carga_horaria SMALLINT;

-- selecionar tabela alunos
SELECT * FROM alunos;