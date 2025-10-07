# Biblioteca Acadêmica - Software de gerenciamento
Como destacado por Puga, França e Goya (2013) e Amadeu (2014) nos livros "Banco de Dados: Implementação em SQL, PL/SQL e Oracle 11g" e "Banco de Dados", a utilização de lugares para armazenar informações de forma acessível e segura são fundamentais para o gerenciamento e organização de grandes volumes de informações, sejam essas informações interligadas entre si como não conectadas, tais informações essas que contribuem diretamente para decisões mais assertivas em toda e qualquer área de atuação.

O projeto se consistiu no desenvolvimento de um sistema de gerenciamento para uma biblioteca acadêmica utilizando a linguagem C#, utilizando o banco de dados Microsoft SQL Server como ferramenta para armazenar as informações em atualizações futuras do sistema, durante o desenvolvimento do projeto tive como responsabilidade o gerenciamento e criação completa do banco de dados, desde sua modelagem em nível conceitual até seu desenvolvimento em linguagem SQL aqui presente. Fui responsável por toda a modelagem lógica e física, configuração do ambiente, criação das requisições SQL e a estruturação da arquitetura de dados, seguindo as três primeiras formas normais, de forma a garantir escalabilidade para funcionalidades futuras, melhor desempenho e integridade dos dados.

Foram implementadas rotinas de backup e recuperação de dados, além de medidas de segurança da informação, como a preparação das tabelas para receber dados em hash devido a forma de criptografia usada, prevenção contra SQL Injection no recebimento das requisições e técnicas para mitigar ataques de Rainbow Tables.

## Fases de criação:
### 1. Análise de requisitos
Durante essa etapa crucial no planejamento, foi realizadas tentativas de contato com a equipe responsável pela biblioteca, para o esclarecimento de dúvidas recorrentes ao fluxo de processos realizados pelos funcionários e como funciona a organização da biblioteca.

### 2. Modelagem de Entidade-Relacionamento - MER
Como discutido na faculdade e no livro “Sistemas de Banco de Dados” de Elmasri e Navathe na página 131. A primeira etapa da modelagem do banco de dados é a criação e elaboração de um Modelo Conceitual, criado para se conseguir uma visão clara do que precisa ser feito, como quais são os dados que irão ser recebidos e o relacionamento entre as tabelas, sendo a descrição conceitual e visual de como o Banco de Dados precisa ser criado para que ele possa armazenar e atuar de forma correta dentro do projeto.

![modelo_entidade_relacionamento](images\MER.png)

### 3. Diagrama de Entidade-Relacionamento - DER
Como discutido em sala de aula e no site na IBM na página [O que é diagrama de entidade e relacionamento (DER)?](https://www.ibm.com/think/topics/entity-relationship-diagram). A próxima etapa da elaboração de um banco de dados é a criação do Diagrama de Entidade-Relacionamento, sendo a criação visual da estrutura do banco de dados de forma mais detalhada e lógica, garantindo uma melhor clareza dos dados, realizando o planejamento de como os dados serão armazenados.

![diagrama_entidade_relacionamento](images\DER.png)

### 4. Desenvolviemnto em linguagem SQL
O desenvolvimento do banco no Microsoft SQL Server pode ser visto em:
-   data/database/db_setup: Script de criação do banco
-   data/database/sql_queries: Requisições gerais ao banco
A conexão com o banco usando a linguagem Python pode ser vista em: 
`data/database/connection.py`

## Diretórios principais:
### 1. Estrutura de pastas - Requisições / Queries
Para uma melhor organização e escalabilidade, os scripts do banco foram divididos em diretórios:  
**Observação:** Tudo falado aqui está dentro da pasta `database` localizada em `data`!
`db_setup/` -> Aqui fica o script sql completo de criação do banco.  
`sql_queries/` -> Todas as requisições ao banco ficam aqui, ex: Comandos de Insert, Select e Update
`db_config` -> Aqui fica armazenado todas as requisições relacionadas as configurações do banco

As pastas dentro de `sql_queries/` estão divididas por entidades e tipos de requisição, exemplo:
**Caminho:** `sql_queries/livro/select/`
*   Dentro de `sql_queries` ficam todas as entidades presentes no banco.
*   Dentro de `livro/` ficam todas as requisições diretamente relacionadas a entidade livros.
*   Dentro de `select/` fica todas as requisições select diretamente relacionadas.

### 2. Estrutura de pastas - Políticas de Acesso
Para realizar o acesso ao banco de dados, foi criado um perfil de usuário responsável por cada interação com o banco, sendo um usuário para realização de cada tipo de requisição dentro do banco, como INSERTS, UPDATES e BACKUPS. A seguir, apresentamos os códigos que proporcionam segurança de acesso. A conexão com o banco de dados seria por meio desses usuários em questão.
*   Dentro de `data/database/db_config/acesso`

### 3. Estrutura de pastas - Políticas de Backup
Para evitar a perda de arquivos importantes no sistema, foi implementado uma política de Backup completo dos dados do banco. Essa operação deverá ser realizada semanalmente para garantir que dados importantes não sejam perdidos, assim reduzirá os riscos causados como em casos de falha onde o banco está armazenado e erros de utilização dos usuários, além de possibilitar a realização de uma cópia de um banco de dados de um servidor para outro. Como analisado na documentação do SQL Server, os arquivos do banco ficam salvos em um arquivo de extensão .BAK dentro de um diretório de local especificado, no exemplo citado foi criado um diretório chamado “SQLServerBackups” dentro do diretório 'C:', ficando com esse caminho: `C:\SQLServerBackups` de utilização.
Dentro de `data/database/db_config/backup` fica localizado os seguintes arquivos:
*   `db_config/backup/backup_file` -> Código para realização do backup do sistema.
*   `db_config/backup/backup_list` -> Código que exibe todos os backups realizados.
*   `db_config/backup/first_backup` -> Código responsável por criar o arquivo de backup.
*   `db_config/backup/restore_data` -> Código para realizar a restauração do banco de dados.
