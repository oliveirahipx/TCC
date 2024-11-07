DROP DATABASE IF EXISTS Escola;
CREATE DATABASE Escola;

USE Escola;

CREATE TABLE Direcao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE
);

-- 4. Tabela para os Professores
CREATE TABLE Professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    token_direcao VARCHAR(255) NOT NULL,
    FOREIGN KEY (token_direcao) REFERENCES Direcao(token) ON DELETE CASCADE
);

-- 5. Tabela para os Alunos
CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- 6. Tabela para Notas
CREATE TABLE Notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT NOT NULL,
    id_aluno INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    materia VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professores(id) ON DELETE CASCADE,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id) ON DELETE CASCADE
);

INSERT INTO Direcao (nome, token)
VALUES ('Direção Escolar', 'direcao_123456');

INSERT INTO Professores (nome, email, senha, token_direcao)
VALUES ('Professor João', 'joao@escola.com', 'senha123', 'direcao_123456');

INSERT INTO Alunos (nome, data_nascimento, email)
VALUES ('Carlos Silva', '2005-02-15', 'carlos@escola.com');

select * from Alunos;

INSERT INTO Notas (id_professor, id_aluno, nota, materia, data)
VALUES (1, 1, 8.5, 'Matemática', '2024-11-07');



