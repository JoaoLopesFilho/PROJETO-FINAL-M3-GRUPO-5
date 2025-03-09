# Consultas SQL

Este diretório contém as consultas SQL utilizadas para extrair e analisar dados do banco de dados do Projeto Novos Saberes.

## Arquivo Disponível

### consultas_gerais.sql

Este arquivo contém cinco consultas pré-definidas que demonstram como extrair informações relevantes do banco de dados:

1. **Alunos e seus projetos**
   - Lista cada aluno e os projetos em que está inscrito
   - Colunas: nome_aluno, nome_projeto
   - Ordenado por: nome do aluno

2. **Professores e seus projetos**
   - Lista cada professor e os projetos em que leciona
   - Colunas: nome_professor, nome_projeto
   - Ordenado por: nome do professor

3. **Alunos e seus supervisores**
   - Lista cada aluno e seu supervisor designado
   - Colunas: nome_aluno, nome_supervisor
   - Ordenado por: nome do aluno
   - Inclui LEFT JOIN para mostrar também alunos sem supervisor

4. **Projetos e quantidade de alunos**
   - Lista cada projeto e a quantidade de alunos inscritos
   - Colunas: nome_projeto, quantidade_alunos
   - Ordenado por: quantidade de alunos (decrescente)
   - Utiliza GROUP BY para agrupar contagens

5. **Projetos e todos os participantes**
   - Lista cada projeto com todos os seus participantes (alunos e professores)
   - Colunas: nome_projeto, tipo_participante, nome_participante
   - Ordenado por: nome do projeto, tipo de participante e nome do participante
   - Utiliza UNION ALL para combinar resultados

## Exemplo de Uso

Para executar as consultas existentes:

```sql
SOURCE c:/caminho/para/PROJETO-FINAL-M3-GRUPO-5/database/queries/consultas_gerais.sql
```

## Sugestões para Novas Consultas

Algumas ideias para consultas adicionais que podem ser úteis:

1. Distribuição de alunos por faixa etária
2. Projetos com maior número de entidades parceiras (empresas, ONGs, etc.)
3. Análise de desempenho de alunos por supervisor
4. Disponibilidade de professores e voluntários por período
5. Distribuição de projetos por metodologia
6. Análise de frequência média dos alunos por projeto

Estas consultas poderão fornecer dados importantes para visualizações gráficas do sistema.
