# Docker para o Projeto Novos Saberes

Este diretório contém os arquivos necessários para executar o banco de dados do Projeto Novos Saberes em um ambiente Docker. Isso simplifica a configuração e garante que todos os desenvolvedores trabalhem com o mesmo ambiente.

## Pré-requisitos

- [Docker](https://www.docker.com/get-started) instalado em sua máquina
- [Docker Compose](https://docs.docker.com/compose/install/) instalado em sua máquina

## Estrutura de Arquivos

```
docker/
│
├── Dockerfile             # Configuração para criar a imagem do MySQL
├── docker-compose.yml     # Configuração para orquestrar os serviços
├── .env                   # Variáveis de ambiente para configuração
├── sql/                   # Diretório com scripts SQL
│   └── setup_completo.sql # Script de inicialização do banco de dados
└── README.md              # Este arquivo
```

## Configuração

As credenciais e configurações do banco de dados estão no arquivo `.env`. Você pode modificá-lo conforme necessário:

```
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=Projeto_novos_saberes
MYSQL_USER=admin
MYSQL_PASSWORD=password
MYSQL_PORT=3306
```

## Instruções de Uso

### Iniciando o Banco de Dados

1. Abra um terminal na pasta `docker`
2. Execute o seguinte comando:

```bash
docker-compose up -d
```

Isso irá:
- Construir a imagem Docker para o MySQL
- Iniciar um contêiner com o MySQL
- Executar automaticamente o script `setup_completo.sql` para criar e popular o banco de dados

### Credenciais do Banco

As credenciais são configuradas no arquivo `.env`:

- **Host**: localhost ou 127.0.0.1
- **Porta**: A porta definida em `MYSQL_PORT` (padrão: 3306)
- **Banco de dados**: O valor de `MYSQL_DATABASE`
- **Usuário**: O valor de `MYSQL_USER`
- **Senha**: O valor de `MYSQL_PASSWORD`
- **Usuário root**: root
- **Senha root**: O valor de `MYSQL_ROOT_PASSWORD`

### Conectando ao Banco de Dados

Você pode conectar ao banco de dados usando qualquer cliente MySQL, como:

```bash
# Via linha de comando (substitua as variáveis conforme seu arquivo .env)
docker exec -it projeto_novos_saberes_db mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE

# Ou usando um cliente como MySQL Workbench, DBeaver, etc.
# Use as credenciais definidas no arquivo .env
```

### Parando o Contêiner

Para parar o servidor do banco de dados:

```bash
docker-compose down
```

### Reiniciando com Dados Limpos

Se você quiser reiniciar com um banco de dados limpo:

```bash
# Parar e remover o contêiner e o volume
docker-compose down -v

# Iniciar novamente
docker-compose up -d
```

## Persistência de Dados

Os dados do MySQL são armazenados em um volume Docker chamado `mysql_data`. Isso significa que:

- Os dados persistem mesmo depois que o contêiner é parado
- Para remover completamente os dados, você precisa remover o volume (`docker-compose down -v`)

## Solução de Problemas

### Porta já em uso

Se você receber um erro dizendo que a porta já está em uso:

1. Verifique se você tem um servidor MySQL já rodando localmente
2. Edite o arquivo `.env` e altere `MYSQL_PORT` para outro valor (ex: 3307)

### Erro ao executar o script SQL

Se o banco de dados iniciar, mas o script não for executado corretamente:

1. Inicie o contêiner
2. Execute o script manualmente:
   ```bash
   # Substitua as variáveis pelos valores do seu arquivo .env
   docker exec -i projeto_novos_saberes_db mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < ./sql/setup_completo.sql
   ```

### Problemas com o arquivo .env

Se o Docker não estiver reconhecendo o arquivo `.env`:

1. Verifique se o arquivo `.env` está na mesma pasta do `docker-compose.yml`
2. Você pode passar as variáveis manualmente:
   ```bash
   MYSQL_ROOT_PASSWORD=root MYSQL_DATABASE=Projeto_novos_saberes MYSQL_USER=admin MYSQL_PASSWORD=password MYSQL_PORT=3306 docker-compose up -d
   ```
