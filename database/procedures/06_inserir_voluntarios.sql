USE Projeto_novos_saberes;

DELIMITER //

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

DELIMITER ;
