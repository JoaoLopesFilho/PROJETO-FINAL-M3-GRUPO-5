USE Projeto_novos_saberes;

DELIMITER //

CREATE PROCEDURE IF NOT EXISTS inserir_supervisor(
    IN p_nome VARCHAR(100),
    IN p_contato VARCHAR(50),
    IN p_area_supervisionada VARCHAR(100),
    IN p_equipe_responsavel VARCHAR(100),
    IN p_relatorio_avaliacao TEXT
)
BEGIN
    INSERT INTO Supervisor (nome, contato, area_supervisionada, equipe_responsavel, relatorio_avaliacao)
    VALUES (p_nome, p_contato, p_area_supervisionada, p_equipe_responsavel, p_relatorio_avaliacao);

    SELECT LAST_INSERT_ID() AS id_supervisor;
END //

DELIMITER ;
