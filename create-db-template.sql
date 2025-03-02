CREATE DATABASE Projeto_novos_saberes
    DEFAULT CHARACTER SET = 'utf8mb4';
    USE Projeto_novos_saberes

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

INSERT INTO(Cursos) 
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