USE Projeto_novos_saberes;

-- Consulta para listar alunos e seus projetos
SELECT a.nome AS nome_aluno, p.nome AS nome_projeto
FROM Aluno a
JOIN Aluno_Projeto ap ON a.id_aluno = ap.id_aluno
JOIN Projeto p ON ap.id_projeto = p.id_projeto
ORDER BY a.nome;

-- Consulta para listar professores e seus projetos
SELECT pr.nome AS nome_professor,
       GROUP_CONCAT(p.nome SEPARATOR ', ') AS projetos
FROM Professor pr
JOIN Professor_Projeto pp ON pr.id_professor = pp.id_professor
JOIN Projeto p ON pp.id_projeto = p.id_projeto
GROUP BY pr.nome
ORDER BY pr.nome;

-- Consulta para listar alunos e seus supervisores
SELECT a.nome AS nome_aluno, s.nome AS nome_supervisor
FROM Aluno a
LEFT JOIN Supervisor s ON a.id_supervisor = s.id_supervisor
ORDER BY a.nome;

-- Consulta para listar projetos e quantidade de alunos
SELECT p.nome AS nome_projeto, COUNT(ap.id_aluno) AS quantidade_alunos
FROM Projeto p
LEFT JOIN Aluno_Projeto ap ON p.id_projeto = ap.id_projeto
GROUP BY p.id_projeto, p.nome
ORDER BY quantidade_alunos DESC;

-- Consulta para listar projetos e todos os participantes
SELECT
    p.nome AS nome_projeto,
    'Aluno' AS tipo_participante,
    a.nome AS nome_participante
FROM
    Projeto p
JOIN Aluno_Projeto ap ON p.id_projeto = ap.id_projeto
JOIN Aluno a ON ap.id_aluno = a.id_aluno

UNION ALL

SELECT
    p.nome AS nome_projeto,
    'Professor' AS tipo_participante,
    prof.nome AS nome_participante
FROM
    Projeto p
JOIN Professor_Projeto pp ON p.id_projeto = pp.id_projeto
JOIN Professor prof ON pp.id_professor = prof.id_professor

ORDER BY
    nome_projeto, tipo_participante, nome_participante;


-- Consulta para ver quantos alunos com mais de 18 anos temos e se estão cursando ensino médio ou superior 
--DevDg
SELECT 
    escolaridade, 
    COUNT(*) AS quantidade_alunos
FROM Aluno
WHERE idade > 18 
AND escolaridade IN ('Ensino Médio', 'Ensino Superior')
GROUP BY escolaridade;


-- Consulta para contar quantos alunos têm desempenho classificado como "Excelente", "Bom", "Regular" ou "Ruim" 
--DevDg
SELECT desempenho, COUNT(*) AS quantidade_alunos
FROM Aluno
GROUP BY desempenho
ORDER BY quantidade_alunos DESC;

--Consulta para listar os alunos com alta presença (maior que 90%) e seus desempenhos 
--DevDg

SELECT nome, frequencia, desempenho
FROM Aluno
WHERE frequencia > 90
ORDER BY frequencia ASC;

