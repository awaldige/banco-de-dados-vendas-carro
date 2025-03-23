CREATE DATABASE VendasCarros;
USE VendasCarros;

-- Tabela de Clientes
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do cliente
    nome VARCHAR(100) NOT NULL,  -- Nome do cliente
    telefone VARCHAR(20),  -- Número de telefone do cliente
    email VARCHAR(100)  -- Endereço de e-mail do cliente
);
-- Tabela de Vendedores
CREATE TABLE Vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do vendedor
    nome VARCHAR(100) NOT NULL,  -- Nome do vendedor
    telefone VARCHAR(20),  -- Número de telefone do vendedor
    email VARCHAR(100)  -- Endereço de e-mail do vendedor
);
-- Tabela de Gerentes
CREATE TABLE Gerente (
    id_gerente INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do gerente
    nome VARCHAR(100) NOT NULL,  -- Nome do gerente
    telefone VARCHAR(20),  -- Número de telefone do gerente
    email VARCHAR(100)  -- Endereço de e-mail do gerente
);
-- Tabela de Lojas
CREATE TABLE Loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único da loja
    nome VARCHAR(100) NOT NULL,  -- Nome da loja
    endereco VARCHAR(255),  -- Endereço da loja
    id_gerente INT,  -- Chave estrangeira para o gerente da loja
    FOREIGN KEY (id_gerente) REFERENCES Gerente(id_gerente)  -- Relacionamento com a tabela Gerente
);
-- Tabela de Carros
CREATE TABLE Carro (
    id_carro INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do carro
    modelo VARCHAR(100) NOT NULL,  -- Modelo do carro
    ano INT NOT NULL,  -- Ano de fabricação do carro
    preco DECIMAL(10,2) NOT NULL,  -- Preço do carro
    id_loja INT,  -- Chave estrangeira para a loja onde o carro está
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)  -- Relacionamento com a tabela Loja
);
-- Tabela de Acessórios
CREATE TABLE Acessorio (
    id_acessorio INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do acessório
    descricao VARCHAR(100) NOT NULL  -- Descrição do acessório
);
-- Tabela de Relação Carro - Acessórios
CREATE TABLE Carro_Acessorio (
    id_carro INT,  -- Chave estrangeira para o carro
    id_acessorio INT,  -- Chave estrangeira para o acessório
    PRIMARY KEY (id_carro, id_acessorio),  -- Chave primária composta
    FOREIGN KEY (id_carro) REFERENCES Carro(id_carro),  -- Relacionamento com a tabela Carro
    FOREIGN KEY (id_acessorio) REFERENCES Acessorio(id_acessorio)  -- Relacionamento com a tabela Acessorio
);
-- Tabela de Financeiras
CREATE TABLE Financeira (
    id_financeira INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único da financeira
    nome VARCHAR(100) NOT NULL  -- Nome da financeira
);
-- Tabela de Bancos
CREATE TABLE Banco (
    id_banco INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do banco
    nome VARCHAR(100) NOT NULL  -- Nome do banco
);
SELECT * FROM TipoPagamento;
INSERT INTO TipoPagamento (descricao) VALUES
('À Vista'),
('Financiamento');
-- Tabela de Tipos de Pagamento
 CREATE TABLE TipoPagamento (
    id_tipo_pagamento INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único do tipo de pagamento
    descricao ENUM('À Vista', 'Financiamento') NOT NULL  -- Tipo de pagamento: À Vista ou Financiamento
);
-- Tabela de Vendas
CREATE TABLE Venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único da venda
    id_cliente INT,  -- Chave estrangeira para o cliente
    id_vendedor INT,  -- Chave estrangeira para o vendedor
    id_carro INT,  -- Chave estrangeira para o carro
    id_tipo_pagamento INT,  -- Chave estrangeira para o tipo de pagamento
    id_financeira INT NULL,  -- Chave estrangeira para a financeira
    id_banco INT NULL,  -- Chave estrangeira para o banco
    data_venda DATE NOT NULL,  -- Data da venda
    valor_total DECIMAL(10,2) NOT NULL,  -- Valor total da venda
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),  -- Relacionamento com a tabela Cliente
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),  -- Relacionamento com a tabela Vendedor
    FOREIGN KEY (id_carro) REFERENCES Carro(id_carro),  -- Relacionamento com a tabela Carro
    FOREIGN KEY (id_tipo_pagamento) REFERENCES TipoPagamento(id_tipo_pagamento),  -- Relacionamento com a tabela TipoPagamento
    FOREIGN KEY (id_financeira) REFERENCES Financeira(id_financeira),  -- Relacionamento com a tabela Financeira
    FOREIGN KEY (id_banco) REFERENCES Banco(id_banco)  -- Relacionamento com a tabela Banco
);
-- Tabela de Manutenção/Garantia
CREATE TABLE Manutencao_Garantia (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único da manutenção/garantia
    id_carro INT,  -- Chave estrangeira para o carro
    id_cliente INT,  -- Chave estrangeira para o cliente
    descricao VARCHAR(255) NOT NULL,  -- Descrição do serviço realizado
    data_servico DATE NOT NULL,  -- Data do serviço de manutenção/garantia
    custo DECIMAL(10,2),  -- Custo do serviço
    FOREIGN KEY (id_carro) REFERENCES Carro(id_carro),  -- Relacionamento com a tabela Carro
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)  -- Relacionamento com a tabela Cliente
);
-- inserir clientes 
INSERT INTO Cliente (nome, telefone, email) VALUES
('João Silva', '11987654321', 'joao@email.com'),
('Maria Oliveira', '21987654322', 'maria@email.com'),
('Carlos Santos', '31987654323', 'carlos@email.com'),
('Ana Souza', '41987654324', 'ana@email.com'),
('Pedro Lima', '51987654325', 'pedro@email.com');

-- inserir vendedor
INSERT INTO Vendedor (nome, telefone, email) VALUES
('Lucas Almeida', '11912345678', 'lucas@email.com'),
('Fernanda Rocha', '21912345679', 'fernanda@email.com'),
('Rafael Mendes', '31912345680', 'rafael@email.com'),
('Juliana Castro', '41912345681', 'juliana@email.com'),
('Bruno Ferreira', '51912345682', 'bruno@email.com');

-- inserir gerente
INSERT INTO Gerente (nome, telefone, email) VALUES
('Roberto Nunes', '31912345670', 'roberto@email.com'),
('Mariana Costa', '41912345671', 'mariana@email.com'),
('Eduardo Lima', '51912345672', 'eduardo@email.com'),
('Fernanda Soares', '61912345673', 'fernanda@email.com'),
('Gustavo Pereira', '71912345674', 'gustavo@email.com');

-- inserir loja
INSERT INTO Loja (nome, endereco, id_gerente) VALUES
('AutoCar Center', 'Av. Principal, 1000', 1),
('Top Veículos', 'Rua Secundária, 200', 2),
('Mega Autos', 'Av. das Nações, 300', 3),
('Elite Motors', 'Rua das Flores, 400', 4),
('Luxo Carros', 'Av. Central, 500', 5);

-- inserir carro 
INSERT INTO Carro (modelo, ano, preco, id_loja) VALUES
('Toyota Corolla', 2022, 120000.00, 1),
('Honda Civic', 2021, 110000.00, 2),
('Chevrolet Onix', 2023, 90000.00, 3),
('Ford Ranger', 2022, 180000.00, 4),
('Jeep Compass', 2021, 150000.00, 5),
('Volkswagen Golf', 2023, 130000.00, 1),
('Nissan Kicks', 2022, 95000.00, 2),
('Fiat Toro', 2023, 120000.00, 3),
('Hyundai Creta', 2021, 105000.00, 4),
('Renault Duster', 2022, 98000.00, 5);

-- inserir acessorio 
INSERT INTO Acessorio (descricao) VALUES
('Ar-condicionado'),
('Teto solar'),
('Banco de couro'),
('Vidros elétricos'),
('Câmbio automático'),
('Freios ABS'),
('Sensor de estacionamento'),
('Central multimídia'),
('Faróis de LED'),
('Airbags laterais');

-- inserindo  carro_acessorio
INSERT INTO Carro_Acessorio (id_carro, id_acessorio) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),  -- Ford Ranger com Vidros elétricos
(5, 5),  -- Jeep Compass com Câmbio automático
(6, 6),  -- Volkswagen Golf com Freios ABS
(7, 7),  -- Nissan Kicks com Sensor de estacionamento
(8, 8);  -- Fiat Toro com Central multimídia

-- inserir financeira
INSERT INTO Financeira (nome) VALUES
('Financeira XYZ'),
('Financeira Alfa'),
('Financeira Beta'),
('Financeira Omega'),
('Financeira Delta'),
('Financeira Sigma');

-- inserir banco 
INSERT INTO Banco (nome) VALUES
('Banco ABC'),
('Banco Itaú'),
('Banco Bradesco'),
('Banco Santander'),
('Banco do Brasil'),
('Caixa Econômica Federal');

-- inserir venda
INSERT INTO Venda (id_cliente, id_vendedor, id_carro, id_tipo_pagamento, id_financeira, id_banco, data_venda, valor_total) VALUES
(1, 1, 1, 2, 1, NULL, '2025-03-20', 120000.00),
(2, 2, 2, 1, NULL, 1, '2025-03-21', 110000.00),
(3, 3, 3, 2, 1, 1, '2025-03-22', 90000.00),  
(4, 4, 4, 1, NULL, NULL, '2025-03-23', 180000.00), 
(5, 5, 5, 2, 2, 2, '2025-03-24', 150000.00), 
(1, 1, 6, 1, NULL, 1, '2025-03-25', 130000.00), 
(2, 2, 7, 2, 3, NULL, '2025-03-26', 95000.00); 

-- inserir manutenção_garantia
INSERT INTO Manutencao_Garantia (id_carro, id_cliente, descricao, data_servico, custo) VALUES
(1, 1, 'Troca de óleo e revisão geral', '2025-03-22', 500.00),
(1, 1, 'Revisão de motor e troca de filtros', '2025-03-27', 800.00),  
(2, 2, 'Substituição de pastilhas de freio', '2025-03-28', 400.00),  
(3, 3, 'Ajuste na suspensão e alinhamento', '2025-03-29', 300.00),  
(4, 4, 'Troca de pneus e alinhamento', '2025-03-30', 600.00),  
(5, 5, 'Instalação de sistema de som e revisão de ar-condicionado', '2025-03-31', 700.00);  


