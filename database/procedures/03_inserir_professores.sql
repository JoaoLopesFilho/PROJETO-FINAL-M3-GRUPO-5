USE Projeto_novos_saberes;

DELIMITER //

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

DELIMITER ;
