# Utilitários do Banco de Dados

Este diretório contém scripts utilitários para gerenciar o banco de dados do Projeto Novos Saberes. Estes scripts facilitam a manutenção do ambiente de desenvolvimento.

## Arquivos Disponíveis

### drop_all.sql

Este script remove todas as tabelas e procedimentos armazenados do banco de dados. É útil quando você precisa limpar completamente o banco de dados sem excluí-lo.

**Operações realizadas:**
1. Remove todos os procedimentos armazenados
2. Remove todas as tabelas de relacionamento (para evitar erros de chave estrangeira)
3. Remove todas as tabelas principais
4. Exibe mensagem de confirmação

**Atenção:** Este script exclui todos os dados sem possibilidade de recuperação. Use com cautela!

## Método Recomendado

Atualmente, recomendamos usar o Docker para gerenciar o ambiente de banco de dados completo:

```bash
# Para iniciar o banco de dados
cd ../../docker
docker-compose up -d

# Para reiniciar com dados limpos
docker-compose down -v
docker-compose up -d
```

## Uso dos Scripts Utilitários (Método Manual)

Se você estiver executando manualmente os scripts em seu servidor MySQL:

### Para limpar completamente o banco de dados:

```sql
SOURCE caminho direto - /utils/drop_all.sql
```

## Observação

Os arquivos `reset_database.sql` e `setup_completo.sql` foram descontinuados em favor da abordagem Docker, que proporciona um ambiente mais consistente e fácil de configurar.

Se você estiver usando o cliente MySQL via linha de comando, poderá executar scripts assim:

```bash
mysql -u seu_usuario -p seu_banco_dados < C:/caminho/para/seu/script.sql
```
