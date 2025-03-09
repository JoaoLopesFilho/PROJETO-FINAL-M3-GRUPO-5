USE Projeto_novos_saberes;

-- Adicionando chaves estrangeiras para a tabela Aluno
ALTER TABLE Aluno
ADD CONSTRAINT fk_aluno_supervisor
FOREIGN KEY (id_supervisor) REFERENCES Supervisor(id_supervisor)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Adicionando chaves estrangeiras para as tabelas de relacionamento
ALTER TABLE Aluno_Projeto
ADD CONSTRAINT fk_aluno_projeto_aluno
FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_aluno_projeto_projeto
FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Professor_Projeto
ADD CONSTRAINT fk_professor_projeto_professor
FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_professor_projeto_projeto
FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Empresa_Projeto
ADD CONSTRAINT fk_empresa_projeto_empresa
FOREIGN KEY (id_empresa) REFERENCES Empresas_parceiras(id_empresa)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_empresa_projeto_projeto
FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Voluntario_Projeto
ADD CONSTRAINT fk_voluntario_projeto_voluntario
FOREIGN KEY (id_voluntario) REFERENCES Voluntario(id_voluntario)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_voluntario_projeto_projeto
FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ONG_Projeto
ADD CONSTRAINT fk_ong_projeto_ong
FOREIGN KEY (id_ong) REFERENCES ONG(id_ong)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_ong_projeto_projeto
FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Governo_Projeto
ADD CONSTRAINT fk_governo_projeto_governo
FOREIGN KEY (id_instituicao) REFERENCES Governo(id_instituicao)
ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_governo_projeto_projeto
FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
ON DELETE CASCADE ON UPDATE CASCADE;
