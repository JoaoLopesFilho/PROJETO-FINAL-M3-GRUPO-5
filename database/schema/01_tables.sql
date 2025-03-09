-- Active: 1741528115357@@localhost@3306@Projeto_novos_saberes
USE Projeto_novos_saberes;

-- =========================
-- TABELAS PRINCIPAIS
-- =========================

CREATE TABLE Supervisor (
    id_supervisor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    area_supervisionada VARCHAR(100),
    equipe_responsavel VARCHAR(100),
    relatorio_avaliacao TEXT
) ENGINE=InnoDB;

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
    id_supervisor INT
) ENGINE=InnoDB;

CREATE TABLE Professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    contato VARCHAR(90) NOT NULL,
    area VARCHAR(100),
    experiencia TEXT,
    disponibilidade VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE Projeto (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    metodologia TEXT,
    impacto_esperado TEXT
) ENGINE=InnoDB;

CREATE TABLE Empresas_parceiras (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    setor_de_atuacao VARCHAR(100),
    tipo_de_parceria VARCHAR(100),
    responsavel VARCHAR(100),
    beneficios VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE Voluntario (
    id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(90) NOT NULL UNIQUE,
    area_voluntariada VARCHAR(100),
    disponibilidade VARCHAR(50),
    motivacao TEXT
) ENGINE=InnoDB;

CREATE TABLE ONG (
    id_ong INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    area_de_atuacao VARCHAR(100),
    tipo_de_apoio VARCHAR(100),
    contato_responsavel VARCHAR(100),
    projetos_conjuntos TEXT
) ENGINE=InnoDB;

CREATE TABLE Governo (
    id_instituicao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    representante VARCHAR(100),
    tipo_de_apoio VARCHAR(100),
    convenios TEXT,
    regulamentos TEXT,
    parcerias TEXT
) ENGINE=InnoDB;
