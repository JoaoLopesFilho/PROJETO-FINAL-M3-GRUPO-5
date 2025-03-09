-- Garantir que a configuração de codificação seja aplicada em toda a conexão
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

CREATE DATABASE IF NOT EXISTS Projeto_novos_saberes DEFAULT CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
USE Projeto_novos_saberes;

-- Criar tabelas principais
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

-- Criar tabelas de relacionamento
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

-- Adicionar constraints
ALTER TABLE Aluno
ADD CONSTRAINT fk_aluno_supervisor
FOREIGN KEY (id_supervisor) REFERENCES Supervisor(id_supervisor)
ON DELETE SET NULL
ON UPDATE CASCADE;

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

-- Criar procedures
DELIMITER //

-- Procedure para inserir supervisor
CREATE PROCEDURE IF NOT EXISTS inserir_supervisor(
    IN p_nome VARCHAR(100),
    IN p_contato VARCHAR(50),
    IN p_area_supervisionada VARCHAR(100),
    IN p_equipe_responsavel VARCHAR(100),
    IN p_relatorio_avaliacao TEXT
)
BEGIN
    INSERT INTO Supervisor (nome, contato, area_supervisionada, equipe_responsavel, relatorio_avaliacao)
    VALUES (p_nome, p_contato, p_area_supervisionada, p_equipe_responsavel, p_relatorio_avaliacao);

    SELECT LAST_INSERT_ID() AS id_supervisor;
END //

-- Procedure para inserir aluno
CREATE PROCEDURE IF NOT EXISTS inserir_aluno(
    IN p_nome VARCHAR(90),
    IN p_idade INT,
    IN p_situacao VARCHAR(100),
    IN p_endereco VARCHAR(100),
    IN p_contato VARCHAR(90),
    IN p_cursos VARCHAR(150),
    IN p_escolaridade VARCHAR(50),
    IN p_frequencia INT,
    IN p_desempenho VARCHAR(150),
    IN p_id_supervisor INT
)
BEGIN
    INSERT INTO Aluno (nome, idade, situacao, endereco, contato, cursos, escolaridade, frequencia, desempenho, id_supervisor)
    VALUES (p_nome, p_idade, p_situacao, p_endereco, p_contato, p_cursos, p_escolaridade, p_frequencia, p_desempenho, p_id_supervisor);

    SELECT LAST_INSERT_ID() AS id_aluno;
END //

-- Procedure para inserir professor
CREATE PROCEDURE IF NOT EXISTS inserir_professor(
    IN p_nome VARCHAR(100),
    IN p_cpf VARCHAR(14),
    IN p_contato VARCHAR(90),
    IN p_area VARCHAR(100),
    IN p_experiencia TEXT,
    IN p_disponibilidade VARCHAR(50)
)
BEGIN
    INSERT INTO Professor (nome, cpf, contato, area, experiencia, disponibilidade)
    VALUES (p_nome, p_cpf, p_contato, p_area, p_experiencia, p_disponibilidade);

    SELECT LAST_INSERT_ID() AS id_professor;
END //

-- Procedure para inserir projeto
CREATE PROCEDURE IF NOT EXISTS inserir_projeto(
    IN p_nome VARCHAR(100),
    IN p_metodologia TEXT,
    IN p_impacto_esperado TEXT
)
BEGIN
    INSERT INTO Projeto (nome, metodologia, impacto_esperado)
    VALUES (p_nome, p_metodologia, p_impacto_esperado);

    SELECT LAST_INSERT_ID() AS id_projeto;
END //

-- Procedure para inserir empresa
CREATE PROCEDURE IF NOT EXISTS inserir_empresa(
    IN p_nome VARCHAR(100),
    IN p_setor_de_atuacao VARCHAR(100),
    IN p_tipo_de_parceria VARCHAR(100),
    IN p_responsavel VARCHAR(100),
    IN p_beneficios VARCHAR(255)
)
BEGIN
    INSERT INTO Empresas_parceiras (nome, setor_de_atuacao, tipo_de_parceria, responsavel, beneficios)
    VALUES (p_nome, p_setor_de_atuacao, p_tipo_de_parceria, p_responsavel, p_beneficios);

    SELECT LAST_INSERT_ID() AS id_empresa;
END //

-- Procedure para inserir voluntário
CREATE PROCEDURE IF NOT EXISTS inserir_voluntario(
    IN p_nome VARCHAR(100),
    IN p_contato VARCHAR(90),
    IN p_area_voluntariada VARCHAR(100),
    IN p_disponibilidade VARCHAR(50),
    IN p_motivacao TEXT
)
BEGIN
    INSERT INTO Voluntario (nome, contato, area_voluntariada, disponibilidade, motivacao)
    VALUES (p_nome, p_contato, p_area_voluntariada, p_disponibilidade, p_motivacao);

    SELECT LAST_INSERT_ID() AS id_voluntario;
END //

-- Procedure para inserir ONG
CREATE PROCEDURE IF NOT EXISTS inserir_ong(
    IN p_nome VARCHAR(100),
    IN p_area_de_atuacao VARCHAR(100),
    IN p_tipo_de_apoio VARCHAR(100),
    IN p_contato_responsavel VARCHAR(100),
    IN p_projetos_conjuntos TEXT
)
BEGIN
    INSERT INTO ONG (nome, area_de_atuacao, tipo_de_apoio, contato_responsavel, projetos_conjuntos)
    VALUES (p_nome, p_area_de_atuacao, p_tipo_de_apoio, p_contato_responsavel, p_projetos_conjuntos);

    SELECT LAST_INSERT_ID() AS id_ong;
END //

-- Procedure para inserir governo
CREATE PROCEDURE IF NOT EXISTS inserir_governo(
    IN p_nome VARCHAR(100),
    IN p_contato VARCHAR(100),
    IN p_representante VARCHAR(100),
    IN p_tipo_de_apoio VARCHAR(100),
    IN p_convenios TEXT,
    IN p_regulamentos TEXT,
    IN p_parcerias TEXT
)
BEGIN
    INSERT INTO Governo (nome, contato, representante, tipo_de_apoio, convenios, regulamentos, parcerias)
    VALUES (p_nome, p_contato, p_representante, p_tipo_de_apoio, p_convenios, p_regulamentos, p_parcerias);

    SELECT LAST_INSERT_ID() AS id_instituicao;
END //

-- Procedures de relacionamento
CREATE PROCEDURE IF NOT EXISTS inserir_aluno_projeto(
    IN p_id_aluno INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Aluno_Projeto (id_aluno, id_projeto)
    VALUES (p_id_aluno, p_id_projeto);
END //

CREATE PROCEDURE IF NOT EXISTS inserir_professor_projeto(
    IN p_id_professor INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Professor_Projeto (id_professor, id_projeto)
    VALUES (p_id_professor, p_id_projeto);
END //

CREATE PROCEDURE IF NOT EXISTS inserir_empresa_projeto(
    IN p_id_empresa INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Empresa_Projeto (id_empresa, id_projeto)
    VALUES (p_id_empresa, p_id_projeto);
END //

CREATE PROCEDURE IF NOT EXISTS inserir_voluntario_projeto(
    IN p_id_voluntario INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Voluntario_Projeto (id_voluntario, id_projeto)
    VALUES (p_id_voluntario, p_id_projeto);
END //

CREATE PROCEDURE IF NOT EXISTS inserir_ong_projeto(
    IN p_id_ong INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO ONG_Projeto (id_ong, id_projeto)
    VALUES (p_id_ong, p_id_projeto);
END //

CREATE PROCEDURE IF NOT EXISTS inserir_governo_projeto(
    IN p_id_instituicao INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Governo_Projeto (id_instituicao, id_projeto)
    VALUES (p_id_instituicao, p_id_projeto);
END //

DELIMITER ;

-- Inserir dados iniciais
-- Adicionando supervisores
INSERT INTO Supervisor (nome, contato, area_supervisionada, equipe_responsavel, relatorio_avaliacao)
VALUES
('Ana Souza', 'ana@supervisores.com', 'Educação', 'Equipe Alpha', 'Avaliação positiva do projeto.'),
('Marcos Oliveira', 'marcos@supervisores.com', 'Saúde', 'Equipe Beta', 'Projetos em andamento.'),
('Carla Mendes', 'carla@supervisores.com', 'Tecnologia', 'Equipe Gamma', 'Resultados acima do esperado para o primeiro trimestre.'),
('Paulo Santos', 'paulo@supervisores.com', 'Artes', 'Equipe Delta', 'Alunos demonstrando excelente progresso nas atividades.'),
('Fernanda Lima', 'fernanda@supervisores.com', 'Esportes', 'Equipe Epsilon', 'Atividades esportivas integradas com sucesso ao programa educacional.');

-- Adicionando alunos
INSERT INTO Aluno (nome, idade, situacao, endereco, contato, cursos, escolaridade, frequencia, desempenho, id_supervisor)
VALUES
('Jonh Alex', 17, 'Ativo', 'Rua das Flores, 123', 'Jonh@aluno.com', 'Matemática, Português', 'Ensino Médio', 85, 'Excelente', 1),
('Maria Santos', 16, 'Ativo', 'Rua das Acácias, 456', 'maria@aluno.com', 'História, Geografia', 'Ensino Médio', 90, 'Bom', 2),
('Pedro Alves', 15, 'Ativo', 'Avenida Central, 789', 'pedro@aluno.com', 'Ciências, Inglês', 'Ensino Médio', 78, 'Regular', 3),
('Ana Oliveira', 16, 'Ativo', 'Rua dos Pinheiros, 101', 'ana@aluno.com', 'Artes, Música', 'Ensino Médio', 95, 'Excelente', 4),
('Lucas Mendes', 17, 'Ativo', 'Avenida Principal, 202', 'lucas@aluno.com', 'Educação Física, Biologia', 'Ensino Médio', 82, 'Bom', 5);

-- Adicionando professores
INSERT INTO Professor (nome, cpf, contato, area, experiencia, disponibilidade)
VALUES
('Carlos Lima', '123.456.789-00', 'carlos@professor.com', 'Matemática', '10 anos de experiência', 'Manhã e Tarde'),
('Sandra Gomes', '234.567.890-11', 'sandra@professor.com', 'Português', '8 anos de experiência', 'Tarde'),
('Roberto Almeida', '345.678.901-22', 'roberto@professor.com', 'História', '12 anos de experiência', 'Manhã'),
('Juliana Costa', '456.789.012-33', 'juliana@professor.com', 'Ciências', '5 anos de experiência', 'Manhã e Tarde'),
('Marcos Pereira', '567.890.123-44', 'marcos@professor.com', 'Educação Física', '7 anos de experiência', 'Tarde');

-- Adicionando projetos
INSERT INTO Projeto (nome, metodologia, impacto_esperado)
VALUES
('Projeto Aprender Juntos', 'Aulas práticas e teóricas', 'Melhoria no desempenho escolar dos alunos'),
('Esporte na Educação', 'Atividades esportivas integradas ao currículo', 'Desenvolvimento físico e social dos alunos'),
('Arte e Cultura', 'Oficinas de arte e expressão cultural', 'Ampliação do repertório cultural e criativo'),
('Ciência na Prática', 'Experimentos científicos e laboratórios', 'Estímulo ao pensamento científico'),
('Tecnologia Inclusiva', 'Introdução à programação e robótica', 'Preparação para o mercado de trabalho digital');

-- Adicionando empresas parceiras
INSERT INTO Empresas_parceiras (nome, setor_de_atuacao, tipo_de_parceria, responsavel, beneficios)
VALUES
('JA Solutions Engine', 'Tecnologia', 'Financeira', 'João Alex', 'Doação de equipamentos e bolsas de estudo'),
('Construtora Horizonte', 'Construção Civil', 'Infraestrutura', 'Ana Pereira', 'Reforma de espaços educacionais'),
('Banco Futuro', 'Financeiro', 'Patrocínio', 'Carlos Santos', 'Apoio financeiro e educação financeira'),
('Editora Saber Mais', 'Editorial', 'Material Didático', 'Maria Oliveira', 'Doação de livros e materiais educativos'),
('Tech Solutions', 'Tecnologia', 'Mentorias', 'Pedro Alves', 'Mentoria em programação e design');

-- Adicionando voluntários
INSERT INTO Voluntario (nome, contato, area_voluntariada, disponibilidade, motivacao)
VALUES
('Julia Mendes', 'julia@voluntario.com', 'Educação', 'Finais de semana', 'Desejo contribuir para a educação de jovens'),
('Ricardo Santos', 'ricardo@voluntario.com', 'Esportes', 'Terças e Quintas', 'Acredito no poder transformador do esporte'),
('Camila Ferreira', 'camila@voluntario.com', 'Artes', 'Segundas e Quartas', 'Quero compartilhar meu conhecimento artístico'),
('Bruno Almeida', 'bruno@voluntario.com', 'Tecnologia', 'Sextas-feiras', 'Ajudar jovens a ingressar no mercado de tecnologia'),
('Fernanda Costa', 'fernanda@voluntario.com', 'Saúde', 'Sábados', 'Promover saúde e bem-estar entre os adolescentes');

-- Adicionando ONGs
INSERT INTO ONG (nome, area_de_atuacao, tipo_de_apoio, contato_responsavel, projetos_conjuntos)
VALUES
('ONG Amigos da Educação', 'Educação', 'Recursos Humanos e Material', 'Ricardo Gomes', 'Projeto Leitura para Todos'),
('Instituto Esporte e Vida', 'Esportes', 'Equipamentos e Treinadores', 'Sandra Pereira', 'Campeonatos Esportivos Interescolares'),
('Cultura para Todos', 'Artes', 'Oficinas e Eventos', 'Paulo Mendes', 'Festival de Arte Jovem'),
('Ciência na Escola', 'Educação Científica', 'Laboratórios Móveis', 'Marina Costa', 'Feira de Ciências Regional'),
('Tech4All', 'Tecnologia', 'Equipamentos e Cursos', 'Roberto Silva', 'Hackathon Social');

-- Adicionando instituições governamentais
INSERT INTO Governo (nome, contato, representante, tipo_de_apoio, convenios, regulamentos, parcerias)
VALUES
('Secretaria de Educação', 'secretaria@edu.gov', 'Dr. Paulo Freitas', 'Infraestrutura', 'Convênio #2023-01', 'Regulamento Estadual de Educação', 'Parceria com escolas públicas'),
('Ministério da Cultura', 'cultura@gov.br', 'Dra. Ana Souza', 'Financiamento de Projetos', 'Edital MC-2023-05', 'Lei de Incentivo Cultural', 'Centros Culturais Regionais'),
('Secretaria de Esportes', 'esporte@gov.br', 'Dr. Carlos Santos', 'Espaços Esportivos', 'Convênio SE-2023-12', 'Programa Esporte na Escola', 'Federações Esportivas'),
('Secretaria de Ciência e Tecnologia', 'ciencia@gov.br', 'Dra. Marta Silva', 'Laboratórios', 'Projeto CT-2023-08', 'Diretrizes para Inovação', 'Universidades Estaduais'),
('Ministério da Saúde', 'saude@gov.br', 'Dr. Roberto Alves', 'Palestras e Check-ups', 'Programa Saúde na Escola', 'Normas Sanitárias Escolares', 'Postos de Saúde Locais');

-- Adicionando relacionamentos
INSERT INTO Aluno_Projeto VALUES (1, 1), (1, 2), (2, 1), (2, 3), (3, 2), (3, 4), (4, 3), (4, 5), (5, 4), (5, 1);
INSERT INTO Professor_Projeto VALUES (1, 1), (1, 4), (2, 1), (2, 3), (3, 2), (3, 3), (4, 4), (4, 5), (5, 2), (5, 5);
INSERT INTO Empresa_Projeto VALUES (1, 5), (2, 1), (3, 2), (4, 3), (5, 4);
INSERT INTO Voluntario_Projeto VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
INSERT INTO ONG_Projeto VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
INSERT INTO Governo_Projeto VALUES (1, 1), (2, 3), (3, 2), (4, 5), (5, 4);

-- Confirmação
SELECT 'Banco de dados configurado e populado com sucesso!' AS Resultado;
