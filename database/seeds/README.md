# Seeds (Dados Iniciais)

Este diretório contém scripts para popular o banco de dados do Projeto Novos Saberes com dados iniciais de teste.

## Arquivos Disponíveis

1. **01_supervisores.sql**
   - Insere dados na tabela de Supervisores
   - Exemplo: Ana Souza, Marcos Oliveira

2. **02_alunos.sql**
   - Insere dados na tabela de Alunos
   - Exemplo: João Silva, Maria Santos

3. **03_professores.sql**
   - Insere dados na tabela de Professores
   - Exemplo: Carlos Lima

4. **04_projetos.sql**
   - Insere dados na tabela de Projetos
   - Exemplo: Projeto Aprender Juntos

5. **05_empresas.sql**
   - Insere dados na tabela de Empresas parceiras
   - Exemplo: Empresa XYZ

6. **06_voluntarios.sql**
   - Insere dados na tabela de Voluntários
   - Exemplo: Julia Mendes

7. **07_ongs.sql**
   - Insere dados na tabela de ONGs
   - Exemplo: ONG Amigos da Educação

8. **08_governo.sql**
   - Insere dados na tabela de instituições Governamentais
   - Exemplo: Secretaria de Educação

9. **09_relacionamentos.sql**
   - Insere dados nas tabelas de relacionamento
   - Conecta alunos e professores aos projetos

## Observação Importante

Atualmente, cada tabela possui apenas 1-2 registros de exemplo. **Para atender aos requisitos do projeto, é necessário adicionar pelo menos 5 registros em cada tabela** antes da entrega final.

## Ordem de Execução

Os scripts devem ser executados na ordem numérica para garantir que as chaves estrangeiras funcionem corretamente:

1. Primeiro as tabelas principais (01 a 08)
2. Por último as tabelas de relacionamento (09)

## Comando de Execução

Para executar todos os scripts de seeds em ordem:

docker já trata automaticamente essas execuções

em caso de exec manual =>
```sql
/database/seeds/01_supervisores.sql
/database/seeds/02_alunos.sql
/database/seeds/03_professores.sql
/database/seeds/04_projetos.sql
/database/seeds/05_empresas.sql
/database/seeds/06_voluntarios.sql
/database/seeds/07_ongs.sql
/database/seeds/08_governo.sql
/database/seeds/09_relacionamentos.sql
```
