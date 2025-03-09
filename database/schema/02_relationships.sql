USE Projeto_novos_saberes;

-- =========================
-- TABELAS DE RELACIONAMENTO (N:N)
-- =========================

CREATE TABLE Aluno_Projeto (
    id_aluno INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_aluno, id_projeto)
) ENGINE=InnoDB;

CREATE TABLE Professor_Projeto (
    id_professor INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_professor, id_projeto)
) ENGINE=InnoDB;

CREATE TABLE Empresa_Projeto (
    id_empresa INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_empresa, id_projeto)
) ENGINE=InnoDB;

CREATE TABLE Voluntario_Projeto (
    id_voluntario INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_voluntario, id_projeto)
) ENGINE=InnoDB;

CREATE TABLE ONG_Projeto (
    id_ong INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_ong, id_projeto)
) ENGINE=InnoDB;

CREATE TABLE Governo_Projeto (
    id_instituicao INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY (id_instituicao, id_projeto)
) ENGINE=InnoDB;
