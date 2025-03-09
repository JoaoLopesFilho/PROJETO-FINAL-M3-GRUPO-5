USE Projeto_novos_saberes;

DELIMITER //

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

DELIMITER ;
