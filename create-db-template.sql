CREATE DATABASE Projeto_novos_saberes
    DEFAULT CHARACTER SET = 'utf8mb4';
    USE Projeto_novos_saberes;

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(90),
    Idade INT,
    Situacao VARCHAR(100),
    Endereco VARCHAR(100),
    Contato VARCHAR(90),
    Cursos VARCHAR(150),
    Escolaridade VARCHAR(50),
    Frequencia INT,
    Desempenho VARCHAR(150)
);

SELECT * FROM aluno;

INSERT INTO aluno (Nome,Idade,Situacao,Endereco,Contato,Cursos,Escolaridade,Frequencia,Desempenho)
VALUES 
('Anderson', 17, 'Média renda', 'São Paulo', 'anderson674@gmail.com','Projeto de vida', 'Ensino medio', 89, 'Ótimo'),  
('Felipe', 16, 'Baixa renda', 'São Paulo', 'felipeCD@gmail.com','Projeto de vida' , 'Ensino medio', 82, 'Ótimo'),  
('Lucas', 18, 'Média renda', 'Santa Catarina', 'luscTHELAST@gmail.com','Direito' , 'Ensino medio completo', 94, 'Excelente'),  
('Cristiano', 19, 'Baixa renda', 'São Paulo', 'criscris73@gmail.com', 'Sociologia', 'Ensino medio', 96, 'Excelente'),  
('Luis', 19, 'Baixa renda', 'Espirito Santo', 'luisjr@gmail.com', 'Gestão de renda', 'Ensino Medio Completo', 78, 'Regular'),  
('Ana', 22, 'Média renda', 'São Paulo', 'ana22@email.com','Direito' , 'Ensino Superior Incompleto', 85, 'Bom'),  
('Carlos', 18, 'Baixa renda', 'Rio de Janeiro', 'carlos_rj@email.com','Sociologia' , 'Ensino Médio', 70, 'Regular'),  
('Mariana', 20, 'Alta renda', 'Minas Gerais', 'marianaCJ@email.com', 'Gestão de renda', 'Ensino Superior Completo', 95, 'Excelente'),  
('João', 21, 'Baixa renda', 'Bahia', 'joaobahia@email.com', 'Gestão de renda', 'Ensino Médio Completo', 80, 'Bom'),  
('Fernanda', 23, 'Média renda', 'Pernambuco', 'fernandape@email.com','Projeto de vida' ,  'Ensino Superior Incompleto', 88, 'Ótimo'),  
('Roberto', 19, 'Baixa renda', 'Paraná', 'robertinho@email.com', 'Sociologia', 'Ensino Médio', 76, 'Regular'),  
('Clara', 22, 'Alta renda', 'Santa Catarina', 'clara_sc@email.com', 'Sociologia', 'Ensino Superior Completo', 97, 'Excelente'),  
('Miguel', 20, 'Média renda', 'Ceará', 'miguelce@email.com','Direito' , 'Ensino Superior Incompleto', 83, 'Bom'),  
('Sofia', 18, 'Baixa renda', 'Maranhão', 'sofia.ma@email.com','Sociologia' , 'Ensino Médio Completo', 75, 'Mediano'),  
('Christopher', 18, 'Baixa renda', 'Acre', 'chrisgoat@gmail.com','Sociologia' , 'Ensino Médio Completo', 79, 'Mediano'); 

INSERT INTO Cursos
VALUES
('Projeto de vida'),
('Gestão de renda'),
('Direito'),
('Direito'),
('Projeto de vida'),
('Gestão de renda'),
('Sociologia'),
('Projeto de vida'),
('Sociologia'),
('sociologia'),
('Direito'),
('Gestão de renda'),
('Gestão de renda'),
('Direito'),
('Direito');

TRUNCATE TABLE aluno;

CREATE TABLE Supervisores (
    ID_supervisor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    contato VARCHAR(50),
    area_supervisionada VARCHAR(100),
    equipe_responsavel VARCHAR(100),
    relatorio_avaliacao TEXT
);

INSERT INTO Supervisores (nome, contato, area_supervisionada, equipe_responsavel, relatorio_avaliacao)
VALUES
  ('João Silva', 'joao.silva@gmail.com', 'Acompanhamento e suporte aos alunos', 'Equipe A', 'João tem demonstrado um excelente acompanhamento e suporte aos alunos, garantindo que todos estejam bem orientados e recebam o apoio necessário.'),
  ('Mathias Cardoso', 'mathias.cardoso@gmail.com', 'Professores e voluntários', 'Equipe B', 'Mathias tem sido fundamental no gerenciamento de professores e voluntários, promovendo uma excelente comunicação e cooperação entre todos os membros.'),
  ('Anny Lorenço', 'anny.lorenco@gmail.com', 'Gestão das atividades', 'Equipe C', 'Anny tem gerido as atividades de forma eficiente, assegurando que todas as tarefas sejam cumpridas dentro do prazo e com alta qualidade.'),
  ('Heloisa Souza', 'heloisa.souza@gmail.com', 'Avaliação do projeto', 'Equipe D', 'Heloisa tem se destacado na avaliação do projeto, oferecendo feedbacks construtivos que contribuem significativamente para o aprimoramento contínuo.'),
  ('Luiz Soares', 'luiz.soares@gmail.com', 'Missão do projeto', 'Equipe E', 'Luiz tem liderado com sucesso a missão do projeto, sempre focado nos objetivos principais e garantindo que todos os esforços estejam alinhados à visão do projeto.'),
  ('Jusara Almeida', 'jusara.almeida@gmail.com', 'Doações e relacionamentos', 'Equipe F', 'Jusara tem gerido de forma exemplar as doações e os relacionamentos, sempre mantendo um canal de comunicação transparente e eficaz com os doadores e parceiros.');

SELECT * FROM Supervisores;

CREATE TABLE Empresas_parceiras (
  ID_empresas INT PRIMARY KEY,
  Nome VARCHAR(100),
  Setor_de_atuacao VARCHAR(100),
  Tipo_de_parceria VARCHAR(100),
  Responsavel VARCHAR(100),
  Beneficios VARCHAR(100)
);

INSERT INTO Empresas_parceiras (ID_empresas, Nome, Setor_de_atuacao, Tipo_de_parceria, Responsavel, Beneficios)
VALUES
  (1, 'TechCorp', 'Tecnologia', 'Patrocínio', 'Ana Silva', 'Apoio financeiro'),
  (2, 'EducaMais', 'Educação', 'Parceria Educacional', 'Carlos Souza', 'Cursos gratuitos'),
  (3, 'HealthCare', 'Saúde', 'Doações', 'Marina Lopes', 'Equipamentos médicos');

SELECT * FROM Empresas_parceiras;

CREATE TABLE ONGs (
  ID_ONG INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(100),
  Area_de_atuacao VARCHAR(100),
  Contato_responsavel VARCHAR(100),
  Tipo_de_apoio VARCHAR(100),
  Projetos_conjuntos VARCHAR(200)
);

-- INSERT INTO ONGs (Nome, Area_de_atuacao, Contato_responsavel, Tipo_de_apoio, Projetos_conjuntos)
-- VALUES
-- ('Hope Foundation',   'Educação e Cidadania',   'Vanessa Silva',  'Materiais Didáticos', 'Projeto Crescer, Projeto Cidadania'),
-- ('Amigos do Futuro',  'Desenvolvimento Social', 'Jonh Alex',  'Treinamentos',        'Projeto Jovem Aprendiz'),
-- ('Mão Solidária',     'Assistência Social',     'Mariana Castro','Doações de Alimentos','Campanha Alimentar, Projeto Saúde'),
-- ('Nova Chance',       'Reinserção Social',      'Pedro Almeida', 'Apoio Financeiro',    'Projeto Reintegração');

-- SELECT * FROM ONGs;
