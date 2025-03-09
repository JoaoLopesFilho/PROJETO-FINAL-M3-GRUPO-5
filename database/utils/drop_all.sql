-- Este script remove todas as tabelas e procedures criados no banco de dados

USE Projeto_novos_saberes;

-- Deletando procedures
DROP PROCEDURE IF EXISTS inserir_supervisor;
DROP PROCEDURE IF EXISTS inserir_aluno;
DROP PROCEDURE IF EXISTS inserir_professor;
DROP PROCEDURE IF EXISTS inserir_projeto;
DROP PROCEDURE IF EXISTS inserir_empresa;
DROP PROCEDURE IF EXISTS inserir_voluntario;
DROP PROCEDURE IF EXISTS inserir_ong;
DROP PROCEDURE IF EXISTS inserir_governo;
DROP PROCEDURE IF EXISTS inserir_aluno_projeto;
DROP PROCEDURE IF EXISTS inserir_professor_projeto;
DROP PROCEDURE IF EXISTS inserir_empresa_projeto;
DROP PROCEDURE IF EXISTS inserir_voluntario_projeto;
DROP PROCEDURE IF EXISTS inserir_ong_projeto;
DROP PROCEDURE IF EXISTS inserir_governo_projeto;

-- Tabelas de relacionamento devem ser excluídas primeiro para evitar erros de chave estrangeira
DROP TABLE IF EXISTS Aluno_Projeto;
DROP TABLE IF EXISTS Professor_Projeto;
DROP TABLE IF EXISTS Empresa_Projeto;
DROP TABLE IF EXISTS Voluntario_Projeto;
DROP TABLE IF EXISTS ONG_Projeto;
DROP TABLE IF EXISTS Governo_Projeto;

-- Tabelas principais
DROP TABLE IF EXISTS Aluno;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Projeto;
DROP TABLE IF EXISTS Supervisor;
DROP TABLE IF EXISTS Empresas_parceiras;
DROP TABLE IF EXISTS Voluntario;
DROP TABLE IF EXISTS ONG;
DROP TABLE IF EXISTS Governo;

-- Confirmação
SELECT 'Todas as tabelas e procedures foram removidos com sucesso.' AS Resultado;
