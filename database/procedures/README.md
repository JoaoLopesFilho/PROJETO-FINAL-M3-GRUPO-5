# Procedimentos Armazenados (Stored Procedures)

Este diretório contém os procedimentos armazenados (stored procedures) do banco de dados do Projeto Novos Saberes. Estes procedimentos encapsulam operações comuns de inserção de dados, tornando o sistema mais robusto e fácil de manter.

## Arquivos Disponíveis

1. **01_inserir_supervisores.sql**
   - Procedure: `inserir_supervisor`
   - Parâmetros: nome, contato, area_supervisionada, equipe_responsavel, relatorio_avaliacao
   - Retorna: id_supervisor do novo registro

2. **02_inserir_alunos.sql**
   - Procedure: `inserir_aluno`
   - Parâmetros: nome, idade, situacao, endereco, contato, cursos, escolaridade, frequencia, desempenho, id_supervisor
   - Retorna: id_aluno do novo registro

3. **03_inserir_professores.sql**
   - Procedure: `inserir_professor`
   - Parâmetros: nome, cpf, contato, area, experiencia, disponibilidade
   - Retorna: id_professor do novo registro

4. **04_inserir_projetos.sql**
   - Procedure: `inserir_projeto`
   - Parâmetros: nome, metodologia, impacto_esperado
   - Retorna: id_projeto do novo registro

5. **05_inserir_empresas.sql**
   - Procedure: `inserir_empresa`
   - Parâmetros: nome, setor_de_atuacao, tipo_de_parceria, responsavel, beneficios
   - Retorna: id_empresa do novo registro

6. **06_inserir_voluntarios.sql**
   - Procedure: `inserir_voluntario`
   - Parâmetros: nome, contato, area_voluntariada, disponibilidade, motivacao
   - Retorna: id_voluntario do novo registro

7. **07_inserir_ongs.sql**
   - Procedure: `inserir_ong`
   - Parâmetros: nome, area_de_atuacao, tipo_de_apoio, contato_responsavel, projetos_conjuntos
   - Retorna: id_ong do novo registro

8. **08_inserir_governo.sql**
   - Procedure: `inserir_governo`
   - Parâmetros: nome, contato, representante, tipo_de_apoio, convenios, regulamentos, parcerias
   - Retorna: id_instituicao do novo registro

9. **09_inserir_relacionamentos.sql**
   - Procedures para inserir relacionamentos entre entidades:
     - `inserir_aluno_projeto` - Conecta alunos e projetos
     - `inserir_professor_projeto` - Conecta professores e projetos
     - `inserir_empresa_projeto` - Conecta empresas e projetos
     - `inserir_voluntario_projeto` - Conecta voluntários e projetos
     - `inserir_ong_projeto` - Conecta ONGs e projetos
     - `inserir_governo_projeto` - Conecta instituições governamentais e projetos

## Exemplo de Uso

```sql
-- Inserir um novo supervisor
CALL inserir_supervisor('Nome do Supervisor', 'contato@email.com', 'Educação', 'Equipe X', 'Relatório inicial');

-- Inserir um novo aluno
CALL inserir_aluno('Nome do Aluno', 16, 'Ativo', 'Rua Principal, 123', 'aluno@email.com', 'Matemática', 'Ensino Médio', 85, 'Bom', 1);

-- Inserir um relacionamento entre aluno e projeto
CALL inserir_aluno_projeto(1, 1);
```

## Ordem de Execução

Os scripts devem ser executados na ordem numérica para garantir que todas as dependências sejam respeitadas.

## Comando de Execução

Para criar todos os procedimentos armazenados:

```sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/01_inserir_supervisores.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/02_inserir_alunos.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/03_inserir_professores.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/04_inserir_projetos.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/05_inserir_empresas.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/06_inserir_voluntarios.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/07_inserir_ongs.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/08_inserir_governo.sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/procedures/09_inserir_relacionamentos.sql
```
