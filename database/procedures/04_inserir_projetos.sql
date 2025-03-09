USE Projeto_novos_saberes;

DELIMITER //

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

DELIMITER ;
