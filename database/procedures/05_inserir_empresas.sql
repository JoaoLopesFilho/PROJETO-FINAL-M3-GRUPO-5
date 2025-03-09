USE Projeto_novos_saberes;

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS inserir_empresa(
    IN p_nome VARCHAR(100),
    IN p_setor_de_atuacao VARCHAR(100),
    IN p_tipo_de_parceria VARCHAR(100),
    IN p_responsavel VARCHAR(100),
    IN p_beneficios VARCHAR(255)
)
BEGIN
    INSERT INTO Empresas_parceiras (nome, setor_de_atuacao, tipo_de_parceria, responsavel, beneficios)
    VALUES (p_nome, p_setor_de_atuacao, p_tipo_de_parceria, p_responsavel, p_beneficios);

    SELECT LAST_INSERT_ID() AS id_empresa;
END //

DELIMITER ;
