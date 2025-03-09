# Banco de Dados do Projeto Novos Saberes

Esta pasta contém todos os arquivos relacionados ao banco de dados do Projeto Novos Saberes, organizados em subdiretórios específicos.

## Estrutura de Diretórios

O banco de dados está organizado da seguinte forma:

```
database/
│
├── schema/            # Scripts para criar as tabelas do banco de dados
│   ├── 00_create_database.sql
│   ├── 01_tables.sql
│   ├── 02_relationships.sql
│   └── 03_constraints.sql
│
├── seeds/             # Scripts para popular as tabelas com dados iniciais
│   ├── 01_supervisores.sql
│   ├── 02_alunos.sql
│   ├── 03_professores.sql
│   ├── 04_projetos.sql
│   ├── 05_empresas.sql
│   ├── 06_voluntarios.sql
│   ├── 07_ongs.sql
│   ├── 08_governo.sql
│   └── 09_relacionamentos.sql
│
├── procedures/        # Procedures para automação da inserção de dados
│   ├── 01_inserir_supervisores.sql
│   ├── 02_inserir_alunos.sql
│   ├── 03_inserir_professores.sql
│   ├── 04_inserir_projetos.sql
│   ├── 05_inserir_empresas.sql
│   ├── 06_inserir_voluntarios.sql
│   ├── 07_inserir_ongs.sql
│   ├── 08_inserir_governo.sql
│   └── 09_inserir_relacionamentos.sql
│
├── queries/           # Consultas gerais para extração de dados
│   └── consultas_gerais.sql
│
└── utils/             # Scripts utilitários para resetar ou remover o banco
    └── drop_all.sql
```

## Visão Geral do Modelo de Dados

O modelo de dados do Projeto Novos Saberes conecta diversas entidades:

- **Alunos**: Beneficiários diretos do projeto
- **Supervisores**: Responsáveis por acompanhar os alunos
- **Professores**: Ministram aulas e atividades nos projetos
- **Projetos**: Iniciativas educacionais desenvolvidas
- **Empresas parceiras**: Apoiam os projetos com recursos
- **Voluntários**: Contribuem com tempo e conhecimento
- **ONGs**: Organizações não-governamentais parceiras
- **Instituições Governamentais**: Entidades públicas de apoio

Para instruções detalhadas sobre cada componente, consulte os READMEs específicos em cada pasta.

## Método Recomendado de Instalação

Recomendamos fortemente usar o ambiente Docker configurado na pasta `docker/` para uma experiência consistente:

```bash
cd ../docker
docker-compose up -d
```

## Execução Manual (Alternativa)

Se você preferir executar os scripts manualmente em seu servidor MySQL:

1. Execute os scripts da pasta `schema/` na ordem numérica
2. Execute os scripts da pasta `procedures/` na ordem numérica
3. Execute os scripts da pasta `seeds/` na ordem numérica

Para mais detalhes sobre a execução manual, consulte os READMEs em cada subdiretório.
