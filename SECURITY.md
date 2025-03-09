# Política de Segurança - Projeto Novos Saberes

## Reportando Vulnerabilidades de Segurança

O Projeto Novos Saberes leva a segurança muito a sério. Valorizamos os esforços da comunidade de segurança em identificar e reportar vulnerabilidades de forma responsável.

### Como Reportar uma Vulnerabilidade

Se você descobrir uma vulnerabilidade de segurança no Projeto Novos Saberes, siga estas etapas:

1. **Não divulgue a vulnerabilidade publicamente** - Evite criar issues públicos, pull requests ou mencionar o problema em canais públicos
2. **Envie um e-mail para**: it.jonhpaz@gmail.com com detalhes da vulnerabilidade
3. **Forneça informações detalhadas**:
   - Descrição clara da vulnerabilidade
   - Passos para reproduzir o problema
   - Ambiente em que a vulnerabilidade foi descoberta (versão do banco de dados, sistema operacional, etc.)
   - Possível impacto da vulnerabilidade
   - Sugestões para mitigação ou correção, se possível

Nossa equipe de segurança responderá ao seu relatório o mais rapidamente possível e trabalhará com você para entender e resolver o problema.

## Política de Divulgação

Seguimos os princípios da divulgação coordenada de vulnerabilidades:

1. Sua mensagem será confirmada dentro de 48 horas após o recebimento
2. Nossa equipe irá investigar e verificar o problema reportado
3. Manteremos contato regular com você durante todo o processo
4. Uma vez que o problema seja resolvido, reconheceremos sua contribuição (se você desejar)
5. Divulgaremos publicamente a vulnerabilidade após a correção estar disponível

## Práticas de Segurança para Contribuidores

Ao contribuir para o Projeto Novos Saberes, siga estas práticas de segurança:

### Segurança do Banco de Dados

1. **Nunca armazene senhas em texto simples** - Utilize sempre funções de hash seguras
2. **Utilize senhas fortes** nos arquivos de configuração e variáveis de ambiente
3. **Não compartilhe credenciais de banco de dados** em repositórios públicos
4. **Implemente validação de entrada** para prevenir injeção SQL
5. **Configure corretamente os privilégios de usuário** no banco de dados

### Segurança do Docker

1. **Mantenha as imagens atualizadas** com as últimas correções de segurança
2. **Evite executar containers como root** quando possível
3. **Não exponha portas desnecessárias** no docker-compose.yml
4. **Utilize secrets ou variáveis de ambiente** para armazenar credenciais
5. **Não armazene informações sensíveis** nas imagens Docker

### Segurança do Código

1. **Verifique inputs do usuário** para prevenir injeção
2. **Evite usar funções nativas perigosas** que possam causar overflow
3. **Mantenha as dependências atualizadas** para evitar vulnerabilidades conhecidas
4. **Revise o código** regularmente para identificar problemas de segurança

## Configurações Recomendadas

### MySQL/MariaDB

```sql
-- Configuração recomendada para produção
SET GLOBAL log_bin_trust_function_creators = 0;
SET GLOBAL local_infile = 0;
SET GLOBAL secure_file_priv = '/var/lib/mysql-files';
```

### Docker

Considere adicionar estas configurações ao seu docker-compose.yml para produção:

```yaml
services:
  mysql:
    security_opt:
      - no-new-privileges:true
    read_only: true
    tmpfs:
      - /tmp
      - /var/run/mysqld
    volumes:
      - mysql_data:/var/lib/mysql:rw
```

## Auditorias de Segurança

O Projeto Novos Saberes realiza revisões de segurança periodicamente. Encorajamos a comunidade a:

1. Realizar testes de penetração responsáveis
2. Realizar análise estática de código
3. Revisar configurações e implementações
4. Sugerir melhorias na segurança geral

## Reconhecimento

Agradecemos a todos que contribuem para a segurança do projeto. Seus esforços ajudam a proteger os dados e infraestrutura do Projeto Novos Saberes.

---

*Última atualização: Novembro 2025 por @Jonhvmp*
