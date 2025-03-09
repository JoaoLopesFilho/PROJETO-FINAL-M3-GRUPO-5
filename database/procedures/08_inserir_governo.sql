USE Projeto_novos_saberes;

DELIMITER //

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

DELIMITER ;
