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

CREATE TABLE Professor(
  id_professor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) UNIQUE NOT NULL,
  contato VARCHAR(90) NOT NULL,
  area VARCHAR(100),
  experiencia TEXT,
  disponibilidade VARCHAR(50)
);

CREATE TABLE Projeto (
  id_projeto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  metodologia TEXT,
  impacto_esperado TEXT
);

CREATE TABLE Empresas_parceiras (
  id_empresa INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  setor_de_atuacao VARCHAR(100),
  tipo_de_parceria VARCHAR(100),
  responsavel VARCHAR(100),
  beneficios VARCHAR(255)
);

CREATE TABLE Voluntario(
  id_voluntario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  contato VARCHAR(90) UNIQUE NOT NULL,
  area_voluntaria VARCHAR(100),
  disponibilidade VARCHAR (50),
  motivacao TEXT
);

CREATE TABLE ONG (
  id_ong INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR (100) NOT NULL,
  area_de_atuacao VARCHAR(100),
  tipo_de_apoio VARCHAR(100),
  contato_responsavel VARCHAR(100),
  projetos_conjutos TEXT
);

CREATE TABLE Governo (
  id_instituicao INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  contato VARCHAR(100),
  representante VARCHAR(100),
  tipo_de_apoio VARCHAR(100),
  convenios TEXT,
  regulamentos TEXT,
  parcerias TEXT
);

CREATE TABLE Aluno_Projeto (
  id_aluno INT NOT NULL,
  id_projeto INT NOT NULL,
  PRIMARY KEY (id_aluno, id_projeto),
  FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Professor_Projeto (
  id_professor INT NOT NULL,
  id_projeto INT NOT NULL,
  PRIMARY KEY (id_professor, id_projeto),
  FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Empresa_Projeto (
  id_empresa INT NOT NULL,
  id_projeto INT NOT NULL,
  PRIMARY KEY (id_empresa, id_projeto),
  FOREIGN KEY (id_empresa) REFERENCES Empresas_parceiras(id_empresa)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Voluntario_Projeto (
  id_voluntario INT NOT NULL,
  id_projeto INT NOT NULL,
  PRIMARY KEY (id_voluntario, id_projeto),
  FOREIGN KEY (id_voluntario) REFERENCES Voluntario(id_voluntario)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ONG_Projeto (
  id_ong INT NOT NULL,
  id_projeto INT NOT NULL,
  PRIMARY KEY (id_ong, id_projeto),
  FOREIGN KEY (id_ong) REFERENCES ONG(id_ong)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Governo_Projeto (
  id_instituicao INT NOT NULL,
  id_projeto INT NOT NULL,
  PRIMARY KEY (id_instituicao, id_projeto),
  FOREIGN KEY (id_instituicao) REFERENCES Governo(id_instituicao)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
  ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Aluno;
SELECT * FROM Voluntario;
SELECT * FROM Governo;


-- Uso do banco de dados
USE Projeto_novos_saberes;

-- Procedure para inserir dados na tabela Supervisor
DELIMITER $$
CREATE PROCEDURE InserirSupervisor()
BEGIN
    INSERT INTO Supervisor (nome, contato, area_supervisionada, equipe_responsavel, relatorio_avaliacao)
    VALUES 
    ('Ana Souza', 'ana@supervisores.com', 'Educação', 'Equipe Alpha', 'Avaliação positiva do projeto.'),
    ('Marcos Oliveira', 'marcos@supervisores.com', 'Saúde', 'Equipe Beta', 'Projetos em andamento.'),
    ('Fernanda Lima', 'fernanda@supervisores.com', 'Tecnologia', 'Equipe Gama', 'Bom desempenho da equipe.'),
    ('Carlos Mendes', 'carlos@supervisores.com', 'Cultura', 'Equipe Delta', 'Ações culturais em desenvolvimento.');
END$$
DELIMITER ;
CALL InserirSupervisor();

-- Procedure para inserir dados na tabela Aluno
DELIMITER $$
CREATE PROCEDURE InserirAluno()
BEGIN
    INSERT INTO Aluno (nome, idade, situacao, endereco, contato, cursos, escolaridade, frequencia, desempenho, id_supervisor)
    VALUES 
    ('João Silva', 17, 'Ativo', 'Rua das Flores, 123', 'joao@aluno.com', 'Matemática, Português', 'Ensino Médio', 85, 'Bom', 1),
    ('Maria Santos', 16, 'Ativo', 'Rua das Acácias, 456', 'maria@aluno.com', 'História, Geografia', 'Ensino Médio', 90, 'Excelente', 2),
    ('Lucas Ferreira', 15, 'Ativo', 'Av. Central, 789', 'lucas@aluno.com', 'Física, Química', 'Ensino Médio', 80, 'Regular', 3);
END$$
DELIMITER ;
CALL InserirAluno();

-- Procedure para inserir dados na tabela Professor
DELIMITER $$
CREATE PROCEDURE InserirProfessor()
BEGIN
    INSERT INTO Professor (nome, cpf, contato, area, experiencia, disponibilidade)
    VALUES 
    ('Carlos Lima', '123.456.789-00', 'carlos@professor.com', 'Matemática', '10 anos de experiência', 'Manhã e Tarde'),
    ('Juliana Costa', '987.654.321-00', 'juliana@professor.com', 'Português', '8 anos de experiência', 'Noite'),
    ('Renato Souza', '111.222.333-44', 'renato@professor.com', 'História', '5 anos de experiência', 'Integral');
END$$
DELIMITER ;
CALL InserirProfessor();

-- Procedure para inserir dados na tabela Projeto
DELIMITER $$
CREATE PROCEDURE InserirProjeto()
BEGIN
    INSERT INTO Projeto (nome, metodologia, impacto_esperado)
    VALUES 
    ('Projeto Aprender Juntos', 'Aulas práticas e teóricas', 'Melhoria no desempenho escolar dos alunos'),
    ('Projeto Mão Amiga', 'Capacitação profissional', 'Inserção no mercado de trabalho'),
    ('Projeto Saúde em Dia', 'Palestras e atendimentos', 'Melhoria na qualidade de vida da comunidade');
END$$
DELIMITER ;
CALL InserirProjeto();

-- Procedure para inserir dados na tabela Empresas_parceiras
DELIMITER $$
CREATE PROCEDURE InserirEmpresa()
BEGIN
    INSERT INTO Empresas_parceiras (nome, setor_de_atuacao, tipo_de_parceria, responsavel, beneficios)
    VALUES 
    ('Tech Solutions', 'Tecnologia', 'Doação de equipamentos', 'Mariana Costa', 'Acesso a novas tecnologias'),
    ('Construtora ABC', 'Construção', 'Reformas estruturais', 'Roberto Lima', 'Melhorias nas instalações'),
    ('Supermercado Ideal', 'Alimentos', 'Doação de alimentos', 'Ana Paula', 'Cestas básicas para alunos');
END$$
DELIMITER ;
CALL InserirEmpresa();

-- Procedure para inserir dados na tabela Voluntario
DELIMITER $$
CREATE PROCEDURE InserirVoluntario()
BEGIN
    INSERT INTO Voluntario (nome, contato, area_voluntaria, disponibilidade, motivacao)
    VALUES 
    ('Lucas Martins', 'lucas@voluntario.com', 'Apoio Pedagógico', 'Finais de Semana', 'Contribuir para a educação.'),
    ('Carla Nunes', 'carla@voluntario.com', 'Organização de Eventos', 'Noite', 'Ajudar a comunidade'),
    ('Pedro Alves', 'pedro@voluntario.com', 'Saúde', 'Integral', 'Promover bem-estar social');
END$$
DELIMITER ;
CALL InserirVoluntario();

-- Procedure para inserir dados nas tabelas de relacionamento
DELIMITER $$
CREATE PROCEDURE InserirRelacionamentos()
BEGIN
    INSERT INTO Aluno_Projeto (id_aluno, id_projeto) VALUES (1, 1), (2, 2), (3, 3);
    INSERT INTO Professor_Projeto (id_professor, id_projeto) VALUES (1, 1), (2, 2), (3, 3);
    INSERT INTO Empresa_Projeto (id_empresa, id_projeto) VALUES (1, 1), (2, 2), (3, 3);
    INSERT INTO Voluntario_Projeto (id_voluntario, id_projeto) VALUES (1, 1), (2, 2), (3, 3);
END$$
DELIMITER ;
CALL InserirRelacionamentos();
-- Procedure para inserir dados na tabela Governo
DELIMITER $$
CREATE PROCEDURE InserirGoverno()
BEGIN
    INSERT INTO Governo (nome, contato, representante, tipo_de_apoio, convenios, regulamentos, parcerias)
    VALUES
    ('Ministério da Educação', 'contato@mec.gov.br', 'José Silva', 'Apoio Financeiro', 'Convênio com escolas', 'Regulamento de bolsas', 'Parceria com universidades'),
    ('Prefeitura Municipal', 'contato@prefeitura.com', 'Ana Souza', 'Infraestrutura', 'Melhoria de escolas', 'Regulamento local', 'Parceria com ONGs'),
    ('Secretaria de Saúde', 'saude@governo.com', 'Carlos Mendes', 'Apoio em Saúde', 'Convênio com hospitais', 'Regulamento sanitário', 'Parceria com clínicas');
END$$
DELIMITER ;
CALL InserirGoverno();

-- Consultas para verificar os dados inseridos
SELECT * FROM Aluno;
SELECT * FROM Projeto;
SELECT * FROM Governo;
SELECT * FROM Voluntario;
SELECT * FROM Empresas_parceiras;

DROP DATABASE Projeto_novos_saberes ;