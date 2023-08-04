-- criando as tabelas

create table cliente (
	codcli numeric(3) not null
	constraint cliente_pk primary key,
	nomcli varchar(40),
	endcli varchar(80), 
	telcli varchar(15),
	stscli varchar(5)
	constraint cli_stscli_ck check (stscli in ('bom', 'médio', 'ruim')),
	limcrecli numeric(10,2)
);

comment on table cliente is 'Tabela de clientes';
comment on column cliente.stscli is 'Status do cliente: bom, médio e ruim';

create table categoria (
	codcat numeric(3)
	constraint categoria_pk primary key, 
	nomcat varchar(30)
);

create table produto (
	codpro numeric(5)
	constraint produto_pk primary key,
	nompro varchar(40),
	prepro numeric(10,2),
	codcat numeric(3)
	constraint pro_codcat_fk references categoria(codcat)
);

create table pedido (
	numped integer
	constraint pedido_pk primary key,
	datped date,
	codcli numeric(3),
	constraint ped_codcli_fk
	foreign key (codcli) references cliente(codcli)
);

create table item_pedido (
	numitmped integer,
	numped integer,
	constraint item_pedido_pk primary key (numitmped, numped),
	codpro numeric(5)
	constraint itm_codpro_fk references produto(codpro),
	constraint itm_numped_fk foreign key (numped)
	references pedido (numped)
);