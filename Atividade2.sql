CREATE DATABASE Comercio;
Use Comercio;

DROP DATABASE Comercio;

DROP TABLE categoria;

CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR (100)
);

CREATE TABLE produtos(
	fk_categoria INT,
	id_produto INT PRIMARY KEY,
    descricao VARCHAR(100),
    preco_unitario DECIMAL(10,2),
    estoque INT,
    FOREIGN KEY (fk_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY,
    nome VARCHAR(100), 	
	cidade VARCHAR(100),
    uf VARCHAR(2),
    data_cadastro DATE
);

CREATE TABLE vendas(
	id_venda INT PRIMARY KEY,
    fk_cliente INT,
    fk_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (fk_cliente) REFERENCES clientes(id_cliente),  	
	FOREIGN KEY (fk_produto) REFERENCES produtos(id_produto)
) ENGINE=InnoDB;

-- CATEGORIAS (ID_Categoria, Nome_Categoria)
INSERT INTO categorias VALUES (1, 'Eletrônicos');
INSERT INTO categorias VALUES (2, 'Móveis');
INSERT INTO categorias VALUES (3, 'Informática');

-- PRODUTOS (ID_Produto, Descricao, Preco_Unitario, Estoque)
INSERT INTO produtos VALUES (1, 101, 'Smartphone X', 2500.00, 50);
INSERT INTO produtos VALUES (2, 102, 'Cadeira Gamer', 1200.00, 15);
INSERT INTO produtos VALUES (3, 103, 'Mouse Sem Fio', 150.00, 100);
INSERT INTO produtos VALUES (3, 104, 'Monitor 4K', 3200.00, 10);
INSERT INTO produtos VALUES (2, 105, 'Mesa de Escritório', 850.00, 8);


-- CLIENTES (ID_Cliente, Nome, Cidade, UF, Data_Cadastro)
INSERT INTO clientes VALUES (10, 'Ana Silva', 'São Paulo', 'SP', '2023-01-15');
INSERT INTO clientes VALUES (11, 'Bruno Souza', 'Curitiba', 'PR', '2023-05-20');
INSERT INTO clientes VALUES (12, 'Carla Dias', 'São Paulo', 'SP', '2024-02-10');
INSERT INTO clientes VALUES (13, 'Diego Lemos', 'Belo Horizonte', 'MG', '2024-03-01');

-- VENDAS (ID_Venda, FK_Cliente, FK_Produto, Quantidade, Data_Venda)

INSERT INTO vendas VALUES (1001, 10, 101, 1, '2024-03-10');
INSERT INTO vendas VALUES (1002, 11, 102, 2, '2024-03-12');
INSERT INTO vendas VALUES (1003, 10, 103, 5, '2024-03-15');
INSERT INTO vendas VALUES (1004, 12, 101, 1, '2024-03-20');
INSERT INTO vendas VALUES (1005, 13, 105, 1, '2024-03-22');
INSERT INTO vendas VALUES (1006, 10, 104, 1, '2024-03-25');


-- QUESTÕES 4, A e B 

-- PRODUTO MAIS CARO DA CATEGORIA 3
SELECT MAX(preco_unitario) AS preco_mais_caro
FROM produtos
WHERE fk_categoria = 3;

-- PRODUTO MAIS BARATO DA CATEGORIA 2 
SELECT MIN(preco_unitario) AS preco_mais_barato
FROM produtos
WHERE fk_categoria = 2;

-- QUANTIDADE DE PRODUTOS DIFERENTES NAS CATEGORIAS
SELECT fk_categoria, COUNT(id_produto) AS total_produtos
FROM produtos
GROUP BY fk_categoria;

-- VALOR MÁXIMO DE UMA VENDA EM SÃO PAULO

SELECT MAX(p.preco_unitario) AS valor_max_sp
FROM vendas v
JOIN produtos p ON v.fk_produto = p.id_produto
WHERE v.fk_cliente IN (10, 12);

-- TOTAL DE ITENS VENDIDOS PARA O PRODUTO 101

SELECT SUM(quantidade) AS total_itens_vendidos
FROM vendas
WHERE fk_produto = 101;

-- Maior valor de produto vendido no período de 15/03/2024 a 25/03/2024

SELECT MAX(p.preco_unitario) AS maior_valor_periodo
FROM vendas v
JOIN produtos p ON v.fk_produto = p.id_produto
WHERE v.data_venda BETWEEN '2024-03-15' AND '2024-03-25';

-- resposta da questão 5, Porquê este comando da errado (INSERT INTO vendas VALUES (2000, 99, 101, 1, '2024-04-01');)
-- RESPOSTA: Pois não é possível encontrar um cliente com o id_cliente 99, pois ele não existe.



-- COMANDO PARA MOSTRAR AS TABELAS E SUAS INFORMAÇÕES
SELECT * FROM categorias;
SELECT * FROM produtos;
SELECT * FROM clientes;
SELECT * FROM vendas;
