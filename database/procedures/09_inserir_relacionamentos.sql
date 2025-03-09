USE Projeto_novos_saberes;

DELIMITER //

-- Relacionamento entre Aluno e Projeto
CREATE PROCEDURE IF NOT EXISTS inserir_aluno_projeto(
    IN p_id_aluno INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Aluno_Projeto (id_aluno, id_projeto)
    VALUES (p_id_aluno, p_id_projeto);
END //

-- Relacionamento entre Professor e Projeto
CREATE PROCEDURE IF NOT EXISTS inserir_professor_projeto(
    IN p_id_professor INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Professor_Projeto (id_professor, id_projeto)
    VALUES (p_id_professor, p_id_projeto);
END //

-- Relacionamento entre Empresa e Projeto
CREATE PROCEDURE IF NOT EXISTS inserir_empresa_projeto(
    IN p_id_empresa INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Empresa_Projeto (id_empresa, id_projeto)
    VALUES (p_id_empresa, p_id_projeto);
END //

-- Relacionamento entre Voluntário e Projeto
CREATE PROCEDURE IF NOT EXISTS inserir_voluntario_projeto(
    IN p_id_voluntario INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Voluntario_Projeto (id_voluntario, id_projeto)
    VALUES (p_id_voluntario, p_id_projeto);
END //

-- Relacionamento entre ONG e Projeto
CREATE PROCEDURE IF NOT EXISTS inserir_ong_projeto(
    IN p_id_ong INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO ONG_Projeto (id_ong, id_projeto)
    VALUES (p_id_ong, p_id_projeto);
END //

-- Relacionamento entre Governo e Projeto
CREATE PROCEDURE IF NOT EXISTS inserir_governo_projeto(
    IN p_id_instituicao INT,
    IN p_id_projeto INT
)
BEGIN
    INSERT INTO Governo_Projeto (id_instituicao, id_projeto)
    VALUES (p_id_instituicao, p_id_projeto);
END //

DELIMITER ;
