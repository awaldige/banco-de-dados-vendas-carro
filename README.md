# 🚗 Banco de Dados para Sistema de Vendas de Carros

Este repositório contém o esquema completo do banco de dados para um sistema de vendas de carros, projetado para gerenciar informações de clientes, vendedores, carros, vendas e muito mais.

## 📌 Visão Geral

Este banco de dados foi desenvolvido para suportar um sistema de gerenciamento de vendas de carros, abrangendo desde o cadastro de clientes e veículos até o registro de vendas e serviços de manutenção. Ele foi projetado para ser flexível e escalável, permitindo fácil expansão de funcionalidades no futuro.

## 🧱 Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

- **`Cliente`**: Armazena informações dos clientes (`id_cliente`, `nome`, `telefone`, `email`).
- **`Vendedor`**: Armazena informações dos vendedores (`id_vendedor`, `nome`, `telefone`, `email`).
- **`Gerente`**: Armazena informações dos gerentes (`id_gerente`, `nome`, `telefone`, `email`).
- **`Loja`**: Armazena informações das lojas e sua relação com os gerentes (`id_loja`, `nome`, `endereco`, `id_gerente`).
- **`Carro`**: Armazena informações dos carros e sua relação com as lojas (`id_carro`, `modelo`, `ano`, `preco`, `id_loja`).
- **`Acessorio`**: Lista de acessórios disponíveis para os carros (`id_acessorio`, `descricao`).
- **`Carro_Acessorio`**: Relação entre carros e seus acessórios (`id_carro`, `id_acessorio`).
- **`Financeira`**: Lista de financeiras disponíveis para financiamento (`id_financeira`, `nome`).
- **`Banco`**: Lista de bancos para financiamento (`id_banco`, `nome`).
- **`TipoPagamento`**: Tipos de pagamento (`id_tipo_pagamento`, `descricao`).
- **`Venda`**: Registra as vendas e suas relações com clientes, vendedores, carros, tipos de pagamento, financeiras e bancos (`id_venda`, `id_cliente`, `id_vendedor`, `id_carro`, `id_tipo_pagamento`, `id_financeira`, `id_banco`, `data_venda`, `valor_total`).
- **`Manutencao_Garantia`**: Registra manutenções e garantias com relação a carros e clientes (`id_manutencao`, `id_carro`, `id_cliente`, `descricao`, `data_servico`, `custo`).

## 🗺️ Diagrama Entidade-Relacionamento (ER)

O modelo Entidade-Relacionamento fornece uma visão clara da estrutura e das relações entre as tabelas do sistema.

📎 **Arquivo disponível em**: [`modelo-entidade-relacional.png`](./modelo-entidade-relacional.png)

### 🔍 O que representa:

- Entidades como `Cliente`, `Venda`, `Carro`, `Loja`, `Vendedor`, entre outras.
- Relacionamentos entre entidades, com seus respectivos cardinalidades (1:N, N:N).
- Chaves primárias e estrangeiras que definem a integridade relacional.

> 💡 O diagrama pode ser visualizado para entender a lógica de modelagem aplicada e facilitar futuras alterações ou expansões.

## 🚀 Como Usar

### ✅ Pré-requisitos

- Um Sistema de Gerenciamento de Banco de Dados (SGBD) compatível com SQL, como MySQL, PostgreSQL ou SQLite.

### ⚙️ Instalação

1. Clone este repositório:
    ```bash
    git clone https://github.com/awaldige/vendas-carros-db.git
    ```

2. Importe o arquivo `schema.sql` no seu SGBD.

3. (Opcional) Importe os dados de exemplo do arquivo `dados_exemplo.sql`.

### 💡 Exemplos de Uso

- **Listar todos os carros disponíveis em uma loja:**
    ```sql
    SELECT * FROM Carro WHERE id_loja = [id_da_loja];
    ```

- **Registrar uma nova venda:**
    ```sql
    INSERT INTO Venda (
        id_cliente, id_vendedor, id_carro, id_tipo_pagamento,
        data_venda, valor_total
    ) VALUES (
        [id_cliente], [id_vendedor], [id_carro],
        [id_tipo_pagamento], [data_da_venda], [valor_total]
    );
    ```

## 🤝 Contribuição

Contribuições são bem-vindas! Para colaborar:

1. Faça um fork do repositório.
2. Crie uma branch: `git checkout -b minha-alteracao`.
3. Realize as alterações e faça o commit: `git commit -m "Minha contribuição"`.
4. Faça o push para sua branch: `git push origin minha-alteracao`.
5. Abra um Pull Request.

## 📄 Licença

Este projeto está licenciado sob a [Licença MIT](./LICENSE.md).
