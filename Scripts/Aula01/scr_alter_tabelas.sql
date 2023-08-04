-- Comandos DDL

-- Converter a chave primária composta da tabela Item_Pedido para uma chave simples

-- Passo 1) adicionar a coluna nova
alter table item_pedido 
	add numitm serial;
	
-- Passo 2) excluir a atual chave primária
alter table item_pedido
	drop constraint item_pedido_pk;
	
-- Passo 3) adicionar a nova chave primária
alter table item_pedido 
	add constraint item_pedido_pk primary key(numitm);
	

-- Converter a coluna DATPED de date para timestamp
alter table pedido 
	alter datped type timestamp;


-- Adicionar a coluna PREPRO (preço) na tabela Item_Pedido
alter table item_pedido 
	add prepro numeric(10,2);


-- Excluir a coluna limite de crédito do Cliente
alter table cliente 
	drop limcrecli;


-- Criar uma cópia da tabela cliente
create table cliente_copia
as select * from cliente;