USE Projeto_novos_saberes;

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS inserir_ong(
    IN p_nome VARCHAR(100),
    IN p_area_de_atuacao VARCHAR(100),
    IN p_tipo_de_apoio VARCHAR(100),
    IN p_contato_responsavel VARCHAR(100),
    IN p_projetos_conjuntos TEXT
)
BEGIN
    INSERT INTO ONG (nome, area_de_atuacao, tipo_de_apoio, contato_responsavel, projetos_conjuntos)
    VALUES (p_nome, p_area_de_atuacao, p_tipo_de_apoio, p_contato_responsavel, p_projetos_conjuntos);

    SELECT LAST_INSERT_ID() AS id_ong;
END //

DELIMITER ;
