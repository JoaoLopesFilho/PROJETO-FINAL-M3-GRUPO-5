# Diretrizes de Contribuição - Projeto Novos Saberes

Obrigado pelo seu interesse em contribuir para o Projeto Novos Saberes! Este documento fornece as diretrizes para contribuir com o desenvolvimento do banco de dados e suas funcionalidades.

## Como Contribuir

### 1. Configurando o Ambiente

1. Faça um fork do repositório para sua conta GitHub
2. Clone o fork para sua máquina local:
   `
   git clone https://github.com/seu-usuario/PROJETO-FINAL-M3-GRUPO-5.git
   `
3. Configure o repositório original como upstream:
   `
   git remote add upstream https://github.com/usuario-original/PROJETO-FINAL-M3-GRUPO-5.git
   `
4. Configure o ambiente de banco de dados usando Docker:
   `
   cd PROJETO-FINAL-M3-GRUPO-5/docker
   docker-compose up -d
   `

### 2. Criando uma Branch

Para cada nova feature ou correção, crie uma branch específica:

`
git checkout -b feature/nome-da-feature
`

Ou para correções:

`
git checkout -b fix/descricao-do-fix
`

### 3. Desenvolvimento

#### Padrões de Código SQL

- Use uppercase para palavras-chave SQL (SELECT, INSERT, CREATE, etc.)
- Use snake_case para nomes de tabelas e colunas
- Adicione comentários explicativos em queries complexas
- Mantenha a indentação consistente para melhor legibilidade

#### Adicionando Novas Tabelas

1. Crie um novo arquivo na pasta `database/schema/` com a definição da tabela
2. Atualize o arquivo `03_constraints.sql` se houver novas relações
3. Crie arquivo(s) de seed para a nova tabela em `database/seeds/`
4. Crie procedures para manipulação da nova tabela em `database/procedures/`
5. Atualize o arquivo `setup_completo.sql` na pasta `docker/sql/` para incluir suas alterações

#### Adicionando Consultas

1. Para consultas específicas, crie um novo arquivo na pasta `database/queries/`
2. Para consultas gerais, você pode adicionar ao arquivo `consultas_gerais.sql`

### 4. Teste Suas Alterações

Antes de submeter sua contribuição:

1. Atualize o arquivo `docker/sql/setup_completo.sql` com suas alterações
2. Reinicie o contêiner Docker para testar suas alterações:
   `
   docker-compose down -v
   docker-compose up -d
   `
3. Verifique se suas consultas retornam os resultados esperados
4. Teste suas procedures com diferentes parâmetros

### 5. Commit e Push

Faça commits pequenos e descritivos:

`
git add .
git commit -m "Descrição clara e concisa da alteração"
git push origin nome-da-sua-branch
`

### 6. Criando um Pull Request

1. Acesse o repositório original no GitHub
2. Clique em "New Pull Request"
3. Selecione sua branch para comparação
4. Forneça um título claro e uma descrição detalhada das suas alterações
5. Mencione quaisquer problemas ou issues relacionados

## Requisitos para Adição de Dados

Para manter a qualidade e consistência do banco de dados:

1. **Dados de Exemplo**: Cada tabela deve ter pelo menos 5 registros de teste
2. **Relacionamentos**: Certifique-se de criar registros nas tabelas de relacionamento
3. **Consistência**: Os dados devem ser consistentes (ex: IDs de supervisores referenciados por alunos devem existir)
4. **Realismo**: Tente criar dados que se aproximem de cenários reais

## Adicionando Documentação

Ao adicionar novas funcionalidades:

1. Atualize os READMEs relevantes
2. Documente novas procedures, tabelas ou consultas
3. Atualize diagramas se necessário

## Estrutura de Diretórios

Mantenha a estrutura de diretórios existente:

```
database/
│
├── schema/            # Scripts para criar as tabelas
├── seeds/             # Scripts para popular as tabelas
├── procedures/        # Procedures para automação
├── queries/           # Consultas SQL
└── utils/             # Scripts utilitários

docker/
│
├── Dockerfile         # Configuração da imagem MySQL
├── docker-compose.yml # Orquestração dos contêineres
├── .env               # Variáveis de ambiente
└── sql/               # Scripts SQL para inicialização
```

## Perguntas ou Problemas?

Se tiver dúvidas ou encontrar problemas:

1. Verifique se já existe uma issue aberta relacionada
2. Abra uma nova issue descrevendo detalhadamente o problema ou dúvida
3. Use labels apropriados para categorizar sua issue

## Agradecimentos

Agradecemos antecipadamente por suas contribuições para o Projeto Novos Saberes! Juntos, podemos criar um sistema de banco de dados robusto e eficiente para apoiar esta importante iniciativa educacional.
