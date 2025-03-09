# Schema do Banco de Dados

Este diretório contém os scripts responsáveis pela criação da estrutura do banco de dados do Projeto Novos Saberes.

## Arquivos Disponíveis

1. **00_create_database.sql**
   - Cria o banco de dados `Projeto_novos_saberes`
   - Define UTF-8 como conjunto de caracteres padrão

2. **01_tables.sql**
   - Cria todas as tabelas principais do banco de dados
   - Define os campos, tipos de dados e chaves primárias
   - Tabelas criadas:
     - Supervisor
     - Aluno
     - Professor
     - Projeto
     - Empresas_parceiras
     - Voluntario
     - ONG
     - Governo

3. **02_relationships.sql**
   - Cria as tabelas de relacionamento para conexões N:N (muitos-para-muitos)
   - Tabelas criadas:
     - Aluno_Projeto
     - Professor_Projeto
     - Empresa_Projeto
     - Voluntario_Projeto
     - ONG_Projeto
     - Governo_Projeto

4. **03_constraints.sql**
   - Adiciona as chaves estrangeiras (foreign keys) às tabelas
   - Define os comportamentos de CASCADE e SET NULL para ações de UPDATE e DELETE
   - Estabelece as restrições de integridade referencial

## Detalhes dos Tipos de Dados

- **Identificadores**: INT AUTO_INCREMENT para chaves primárias
- **Campos de nome**: VARCHAR(100) (90 para alunos)
- **Contatos**: VARCHAR(90) ou VARCHAR(50) dependendo da entidade
- **Descrições**: TEXT para campos longos como relatórios e experiências
- **Campos de status**: VARCHAR para situação, disponibilidade, etc.
- **Campos numéricos**: INT para idade e frequência

## Ordem de Execução

Os scripts devem ser executados na seguinte ordem:

1. `00_create_database.sql`
2. `01_tables.sql`
3. `02_relationships.sql`
4. `03_constraints.sql`

Isso garante que o banco seja criado corretamente antes das tabelas, e que as tabelas existam antes das constraints.

## Comando de Execução

Para executar todos os scripts de schema em ordem:

docker já faz essa execução

exec manual =>

```sql
/database/schema/00_create_database.sql
/database/schema/01_tables.sql
/database/schema/02_relationships.sql
/database/schema/03_constraints.sql
```
