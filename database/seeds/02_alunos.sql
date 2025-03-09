USE Projeto_novos_saberes;

-- Adicionando alunos
INSERT INTO Aluno (nome, idade, situacao, endereco, contato, cursos, escolaridade, frequencia, desempenho, id_supervisor)
VALUES
('Jonh Alex', 17, 'Ativo', 'Rua das Flores, 123', 'jonh@aluno.com', 'Matemática, Português', 'Ensino Médio', 85, 'Excelente', 1),
('Maria Santos', 16, 'Ativo', 'Rua das Acácias, 456', 'maria@aluno.com', 'História, Geografia', 'Ensino Médio', 90, 'Bom', 2);
