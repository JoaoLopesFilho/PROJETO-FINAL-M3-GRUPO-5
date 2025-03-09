# Projeto Novos Saberes - Documentação do Banco de Dados

Este repositório contém a estrutura do banco de dados para o sistema de gestão do Projeto Novos Saberes, uma iniciativa educacional que conecta alunos, professores, supervisores e diversas entidades de apoio.

## Regras de Negócio

O Projeto Novos Saberes opera seguindo estas regras de negócio principais:

1. Um **Supervisor** pode supervisionar múltiplos **Alunos** (relação 1:N)
2. Um **Aluno** pode participar de múltiplos **Projetos** e um **Projeto** pode ter múltiplos **Alunos** (relação N:N)
3. Um **Professor** pode estar associado a múltiplos **Projetos** e um **Projeto** pode ter múltiplos **Professores** (relação N:N)
4. Uma **Empresa parceira** pode apoiar múltiplos **Projetos** e um **Projeto** pode ter várias **Empresas parceiras** (relação N:N)
5. Um **Voluntário** pode colaborar em múltiplos **Projetos** e um **Projeto** pode ter múltiplos **Voluntários** (relação N:N)
6. Uma **ONG** pode estar associada a múltiplos **Projetos** e um **Projeto** pode ter múltiplas **ONGs** (relação N:N)
7. Uma instituição **Governamental** pode apoiar múltiplos **Projetos** e um **Projeto** pode ter o apoio de várias instituições **Governamentais** (relação N:N)

## Tipos de Dados Utilizados

O banco de dados utiliza diversos tipos de dados para armazenar as informações:

- **Identificadores**: INT (AUTO_INCREMENT) para chaves primárias
- **Textos curtos**: VARCHAR(50-255) para nomes, contatos, endereços
- **Textos longos**: TEXT para campos como experiência, motivação, relatórios
- **Numéricos**: INT para idade, frequência
- **Chaves estrangeiras**: INT para relacionamentos entre tabelas

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

```
projeto-novos-saberes/
│
├── database/           # Estrutura do banco de dados distribuída em arquivos
│   ├── schema/         # Scripts para criar as tabelas
│   ├── seeds/          # Scripts para popular as tabelas
│   ├── procedures/     # Procedures para automação
│   ├── queries/        # Consultas SQL
│   └── utils/          # Scripts utilitários
│
└── docker/             # Configuração Docker para ambiente de desenvolvimento
    ├── Dockerfile      # Configuração da imagem MySQL
    ├── docker-compose.yml  # Orquestração dos contêineres
    ├── .env            # Variáveis de ambiente
    └── sql/            # Scripts SQL para inicialização
```

Para mais detalhes sobre cada componente, consulte o README específico em cada pasta.

## Diagrama Entidade-Relacionamento (ER)

O diagrama ER completo pode ser encontrado nos arquivos de documentação. As principais relações são resumidas nas regras de negócio acima.

## Instalação Rápida com Docker

A maneira recomendada para configurar o ambiente de desenvolvimento é usando Docker:

1. Certifique-se de ter o Docker e o Docker Compose instalados
2. Navegue até a pasta `docker/`
3. Execute o comando:

```bash
docker-compose up -d
```

Para mais detalhes sobre a configuração com Docker, consulte o [README na pasta docker](./docker/README.md).

## Instalação Manual (Alternativa)

Alternativamente, você pode configurar o banco de dados manualmente executando os scripts SQL diretamente no seu servidor MySQL. Consulte os README específicos nas pastas do diretório `database/` para instruções detalhadas.

## Licença

Este projeto é licenciado sob os termos da licença MIT.

## Contribuição

Para contribuir com este projeto, consulte as diretrizes de contribuição no arquivo [CONTRIBUTING.md](./CONTRIBUTING.md).
