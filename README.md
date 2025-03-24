# Banco de Dados para Sistema de Vendas de Carros

Este repositório contém o esquema completo do banco de dados para um sistema de vendas de carros, projetado para gerenciar informações de clientes, vendedores, carros, vendas e muito mais.

## Visão Geral

Este banco de dados foi desenvolvido para suportar um sistema de gerenciamento de vendas de carros, abrangendo desde o cadastro de clientes e veículos até o registro de vendas e serviços de manutenção. Ele foi projetado para ser flexível e escalável, permitindo a fácil expansão de funcionalidades no futuro.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

* **`Cliente`**: Armazena informações dos clientes (id\_cliente, nome, telefone, email).
* **`Vendedor`**: Armazena informações dos vendedores (id\_vendedor, nome, telefone, email).
* **`Gerente`**: Armazena informações dos gerentes (id\_gerente, nome, telefone, email).
* **`Loja`**: Armazena informações das lojas e a relação com os gerentes (id\_loja, nome, endereco, id\_gerente).
* **`Carro`**: Armazena informações dos carros e a relação com as lojas (id\_carro, modelo, ano, preco, id\_loja).
* **`Acessorio`**: Lista de acessórios disponíveis para os carros (id\_acessorio, descricao).
* **`Carro_Acessorio`**: Relação entre carros e seus acessórios (id\_carro, id\_acessorio).
* **`Financeira`**: Lista de financeiras disponíveis para financiamento (id\_financeira, nome).
* **`Banco`**: Lista de bancos para financiamento (id\_banco, nome).
* **`TipoPagamento`**: Tipos de pagamento (À Vista, Financiamento) (id\_tipo\_pagamento, descricao).
* **`Venda`**: Registra as vendas e as relações com clientes, vendedores, carros, tipos de pagamento, financeiras e bancos (id\_venda, id\_cliente, id\_vendedor, id\_carro, id\_tipo\_pagamento, id\_financeira, id\_banco, data\_venda, valor\_total).
* **`Manutencao_Garantia`**: Registra as manutenções e garantias e as relações com carros e clientes (id\_manutencao, id\_carro, id\_cliente, descricao, data\_servico, custo).

## Diagrama ER

\[Aqui você pode inserir o diagrama Entidade-Relacionamento (ER) do banco de dados, se disponível.]

## Como Usar

### Pré-requisitos

* Um sistema de gerenciamento de banco de dados (SGBD) compatível com SQL (MySQL, PostgreSQL, SQLite, etc.).

### Instalação

1.  Clone este repositório:

    ```bash git clone https://github.com/awaldige/vendas-carros-db.git

2.  Importe o arquivo `schema.sql` para o seu SGBD.

3.  (Opcional) Importe os dados de exemplo do arquivo `dados\_exemplo.sql` para popular o banco de dados.

### Exemplos de Uso

* Listar todos os carros disponíveis em uma loja:

    ```sql
    SELECT * FROM Carro WHERE id_loja = [id_da_loja];
    ```

* Registrar uma nova venda:

    ```sql
    INSERT INTO Venda (id_cliente, id_vendedor, id_carro, id_tipo_pagamento, data_venda, valor_total) VALUES ([id_cliente], [id_vendedor], [id_carro], [id_tipo_pagamento], [data_da_venda], [valor_total]);
    ```

## Contribuição

Contribuições são bem-vindas! Se você tiver alguma sugestão de melhoria ou correção, siga estas etapas:

1.  Faça um fork deste repositório.
2.  Crie uma branch com sua alteração: `git checkout -b minha-alteracao`.
3.  Faça suas alterações e commit: `git commit -m 'Adiciona nova funcionalidade'`.
4.  Envie suas alterações para o seu fork: `git push origin minha-alteracao`.
5.  Abra um pull request neste repositório.

## Licença

Este projeto está licenciado sob a licença \[MIT License] - veja o arquivo `LICENSE.md` para detalhes.
