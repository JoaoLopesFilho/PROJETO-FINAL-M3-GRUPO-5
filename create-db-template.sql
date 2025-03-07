CREATE DATABASE Projeto_novos_saberes
    DEFAULT CHARACTER SET = 'utf8mb4';
    USE Projeto_novos_saberes;

CREATE TABLE Supervisor (
  id_supervisor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  contato VARCHAR(50) NOT NULL,
  area_supervisionada VARCHAR(100),
  equipe_responsavel VARCHAR(100),
  relatorio_avaliacao TEXT
);

CREATE TABLE Aluno (
  id_aluno INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(90) NOT NULL,
  idade INT,
  situacao VARCHAR(100),
  endereco VARCHAR(100),
  contato VARCHAR(90) NOT NULL UNIQUE,
  cursos VARCHAR(150),
  escolaridade VARCHAR(50),
  frequencia INT,
  desempenho VARCHAR(150),
  id_supervisor INT,
  FOREIGN KEY (id_supervisor) REFERENCES Supervisor(id_supervisor)
  ON DELETE SET NULL ON UPDATE CASCADE
);
