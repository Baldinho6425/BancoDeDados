-- CRIAÇÃO DAS TABELAS
CREATE TABLE NACIONALIDADE (
	CODNAC SERIAL NOT NULL 
	CONSTRAINT NACIONALIDADE_PK PRIMARY KEY,
	DESNAC VARCHAR(50));

CREATE TABLE ALUNO (
	CODALU INT8 NOT NULL CONSTRAINT ALUNO_PK PRIMARY KEY,
	NOMALU VARCHAR(50) NOT NULL,
	ENDALU VARCHAR(100),
	CODNAC INT2 CONSTRAINT ALU_CODNAC_FK REFERENCES NACIONALIDADE(CODNAC));

CREATE TABLE DISCIPLINA (
	CODDIS INT4 NOT NULL CONSTRAINT DISCIPLINA_PK PRIMARY KEY,
	NOMDIS VARCHAR(80) NOT NULL,
	CHADIS INT2 DEFAULT 1 NOT NULL);

CREATE TABLE HISTORICO (
	CODALU INT8 NOT NULL,
	CODDIS INT4 NOT NULL,
	VLRNOT DECIMAL(12,2) DEFAULT 0 NOT NULL,
	CONSTRAINT HISTORICO_PK PRIMARY KEY(CODALU, CODDIS),
	CONSTRAINT HIS_CODALU_FK FOREIGN KEY(CODALU) REFERENCES ALUNO(CODALU),
	CONSTRAINT HIS_CODDIS_FK FOREIGN KEY(CODDIS) REFERENCES DISCIPLINA(CODDIS));

-- CRIAÇÃO DOS ÍNDICES

CREATE INDEX NAC_DESNAC_SK ON NACIONALIDADE(DESNAC);
CREATE INDEX ALU_NOMALU_SK ON ALUNO(NOMALU);
CREATE INDEX DIS_NOMDIS_SK ON DISCIPLINA(NOMDIS);

-- INSERTS NA TABELA NACIONALIDADE

INSERT INTO NACIONALIDADE VALUES(default,'Brasileira');
INSERT INTO NACIONALIDADE VALUES(default,'Coreana');
INSERT INTO NACIONALIDADE VALUES(default,'Americana');

-- INSERTS NA TABELA ALUNO

INSERT INTO ALUNO VALUES(1,'Pedro da Silva','Rua Caçanjurê, 15',1);
INSERT INTO ALUNO VALUES(2,'Fulano Coimbra','Rua Abx, 210',2);
INSERT INTO ALUNO VALUES(3,'Beltrano Santos','Rua Vila Rica, 500',1);
INSERT INTO ALUNO VALUES(4,'Ciclano Almeida','Rua Cyz, 178, Ap. 12',3);
	
-- INSERTS NA TABELA DISCIPLINA
 
INSERT INTO DISCIPLINA VALUES(1,'Administração',30);
INSERT INTO DISCIPLINA VALUES(2,'Algoritmos',45);
INSERT INTO DISCIPLINA VALUES(3,'Banco de Dados',60);
INSERT INTO DISCIPLINA VALUES(4,'Computação Móvel',90);
INSERT INTO DISCIPLINA VALUES(5,'TCC',150);
INSERT INTO DISCIPLINA VALUES(6,'Linguagens Comerciais II',60);

-- INSERTS NA TABELA HISTORICO

INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(1,1,6.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(1,2,7.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(1,3,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(1,4,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(2,1,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(2,2,7.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(2,3,5.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(2,4,4.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(3,1,5.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(3,2,5.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(3,3,5.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(3,4,6.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(4,1,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(4,2,9.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(4,3,9.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(4,4,9.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(5,1,10.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(5,2,10.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(5,3,3.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(5,4,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(6,1,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(6,2,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(6,3,8.0);
INSERT INTO HISTORICO(CODDIS, CODALU, VLRNOT) VALUES(6,4,7.0);

set datestyle = 'iso, dmy';

-- CRIAÇÃO DAS TABELAS
CREATE TABLE BIBLIOTECA (
	CODBIB INT4 NOT NULL CONSTRAINT BIBLIOTECA_PK PRIMARY KEY,
	NOMBIB VARCHAR(60) NOT NULL,
	CIDBIB VARCHAR(80));

CREATE TABLE USUARIO (
	CODUSU INT8 NOT NULL CONSTRAINT USUARIO_PK PRIMARY KEY,
	NOMUSU VARCHAR(80) NOT NULL,
	ENDUSU VARCHAR(100),
	CEPUSU VARCHAR(9));

CREATE TABLE LIVRO (
	CODLIV INT8 NOT NULL CONSTRAINT LIVRO_PK PRIMARY KEY,
	TITLIV VARCHAR(100) NOT NULL,
	CODBIB INT4 NOT NULL CONSTRAINT LIV_CODBIB_FK REFERENCES BIBLIOTECA(CODBIB));

CREATE TABLE EMPRESTIMO (
	CODEMP INT8 NOT NULL CONSTRAINT EMPRESTIMO_PK PRIMARY KEY,
	CODLIV INT8 NOT NULL CONSTRAINT EMP_CODLIV_FK REFERENCES LIVRO(CODLIV),
	CODUSU INT8 NOT NULL CONSTRAINT EMP_CODUSU_FK REFERENCES USUARIO(CODUSU),
	DATEMP TIMESTAMP NOT NULL);

CREATE TABLE RESERVA (
	CODRES INT8 NOT NULL CONSTRAINT RESERVA_PK PRIMARY KEY,
	CODLIV INT8 NOT NULL CONSTRAINT RES_CODLIV_FK REFERENCES LIVRO(CODLIV),
	CODUSU INT8 NOT NULL CONSTRAINT RES_CODUSU_FK REFERENCES USUARIO(CODUSU),
	DATRES TIMESTAMP NOT NULL);

-- INSERT DE DADOS NA TABELA BIBLIOTECA
INSERT INTO BIBLIOTECA VALUES(01,'Biblioteca Central','São Miguel do Oeste');
INSERT INTO BIBLIOTECA VALUES(02,'Bib. Setorial 01','Maravilha');
INSERT INTO BIBLIOTECA VALUES(03,'Bib. Setorial 02','Pinhalzinho');
INSERT INTO BIBLIOTECA VALUES(04,'Bib. Setorial 03','São José do Cedro');	

-- INSERT DE DADOS NA TABELA USUARIO
 
INSERT INTO USUARIO VALUES(01,'Pedro da Silva','Rua Ab',890);
INSERT INTO USUARIO VALUES(02,'Renata de Souza','Rua Cal',980);
INSERT INTO USUARIO VALUES(03,'Casemiro Alves','Rua Ypr',765);
INSERT INTO USUARIO VALUES(04,'Aristides da Cunha','Rua Hbc',546);	   
INSERT INTO USUARIO VALUES(05,'Rafael dos Santos','Rua Ab',890);   
INSERT INTO USUARIO VALUES(06,'Jonny English','Rua Rtf',809);

-- INSERT DE DADOS NA TABELA LIVRO
 
INSERT INTO LIVRO VALUES(1001,'LIVRO 01',1);
INSERT INTO LIVRO VALUES(1002,'LIVRO 02',1);	   
INSERT INTO LIVRO VALUES(1003,'LIVRO 03',2);	   
INSERT INTO LIVRO VALUES(1004,'LIVRO 04',3);	   
INSERT INTO LIVRO VALUES(1005,'LIVRO 05',3);	   
INSERT INTO LIVRO VALUES(1006,'LIVRO 06',4);

-- INSERT DE DADOS NA TABELA EMPRESTIMO
 
INSERT INTO EMPRESTIMO VALUES(20002,1001,01,'13/01/2008');	   
INSERT INTO EMPRESTIMO VALUES(20005,1002,02,'13/01/2008');	   
INSERT INTO EMPRESTIMO VALUES(20006,1004,01,'14/01/2008');	   
INSERT INTO EMPRESTIMO VALUES(20007,1005,06,'14/01/2008');	   
INSERT INTO EMPRESTIMO VALUES(20008,1001,05,'02/02/2008');	   
INSERT INTO EMPRESTIMO VALUES(20010,1006,06,'05/02/2008');	   
INSERT INTO EMPRESTIMO VALUES(20001,1005,04,'12/01/2008');	   
INSERT INTO EMPRESTIMO VALUES(20009,1003,03,'04/02/2008');
INSERT INTO EMPRESTIMO VALUES(20011,1002,01,'04/03/2008');


-- INSERT DE DADOS NA TABELA RESERVA
 
INSERT INTO RESERVA VALUES(30001,1002,02,'11/01/2008');	   
INSERT INTO RESERVA VALUES(30002,1002,03,'13/01/2008');	   
INSERT INTO RESERVA VALUES(30003,1002,05,'23/01/2008');	   
INSERT INTO RESERVA VALUES(30004,1003,04,'01/02/2008');	   
INSERT INTO RESERVA VALUES(30005,1004,03,'01/02/2008');	   
INSERT INTO RESERVA VALUES(30006,1001,01,'02/02/2008');	   
INSERT INTO RESERVA VALUES(30007,1005,01,'03/02/2008');	   
INSERT INTO RESERVA VALUES(30008,1006,06,'04/02/2008');	   
INSERT INTO RESERVA VALUES(30009,1006,02,'07/02/2008');	   
INSERT INTO RESERVA VALUES(30010,1005,04,'07/02/2008');

set datestyle = 'iso, dmy';

-- CRIAÇÃO DAS TABELAS
CREATE TABLE CARGO (
	CODCAR VARCHAR(3) NOT NULL CONSTRAINT CARGO_PK PRIMARY KEY,
	DESCAR VARCHAR(50) NOT NULL,
	VLRSAL DECIMAL(12,2) NOT NULL);

CREATE TABLE DEPARTAMENTO (
	CODDEP VARCHAR(3) NOT NULL CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY,
	DESDEP VARCHAR(50) NOT NULL,
	RAMTEL VARCHAR(15));

CREATE TABLE FUNCIONARIO (
	NUMFUN INT8 NOT NULL CONSTRAINT FUNCIONARIO_PK PRIMARY KEY,
	NOMFUN VARCHAR(80) NOT NULL,
	DATADM TIMESTAMP NOT NULL,
	SEXFUN CHAR(1) NOT NULL CONSTRAINT FUN_SEXFUN_CK CHECK (SEXFUN IN ('F','M')),
	CODCAR VARCHAR(3) NOT NULL CONSTRAINT FUN_CODCAR_FK REFERENCES CARGO(CODCAR),
	CODDEP VARCHAR(3) NOT NULL CONSTRAINT FUN_CODDEP_FK REFERENCES DEPARTAMENTO(CODDEP));

CREATE INDEX CARGO_DESCAR_SK ON CARGO(DESCAR);
CREATE INDEX DEPTO_DESDEP_SK ON DEPARTAMENTO(DESDEP);
CREATE INDEX FUN_NOMFUN_SK ON FUNCIONARIO(NOMFUN);

-- INSERTS NA TABELA CARGO

INSERT INTO CARGO VALUES('C1','Aux. Vendas',350);
INSERT INTO CARGO VALUES('C3','Vendedor',800);
INSERT INTO CARGO VALUES('C7','Diretor',2500);
INSERT INTO CARGO VALUES('C2','Vigia',4000);
INSERT INTO CARGO VALUES('C5','Gerente',1000);
INSERT INTO CARGO VALUES('C4', 'Aux. Cobrança',250);

-- INSERTS NA TABELA DEPARTAMENTO

INSERT INTO DEPARTAMENTO VALUES('D1','Assist. Técnica',2246);
INSERT INTO DEPARTAMENTO VALUES('D2','Estoque',2589);
INSERT INTO DEPARTAMENTO VALUES('D3','Administração',2772);
INSERT INTO DEPARTAMENTO VALUES('D4','Segurança',1810);
INSERT INTO DEPARTAMENTO VALUES('D5','Vendas',2599);
INSERT INTO DEPARTAMENTO VALUES('D6','Cobrança',2688);
	
-- INSERTS NA TABELA FUNCIONARIO
 
INSERT INTO FUNCIONARIO VALUES(101,'Renato da Silva','10/08/2003','M','C3','D5');
INSERT INTO FUNCIONARIO VALUES(104,'Carlos Pereira','02/03/2004','M','C4','D6');
INSERT INTO FUNCIONARIO VALUES(134,'Pedro Sérgio Doto','23/05/2003','M','C5','D1');
INSERT INTO FUNCIONARIO VALUES(121,'Antônio Machado','01/12/2001','M','C3','D5');
INSERT INTO FUNCIONARIO VALUES(195,'Larissa Silva','15/01/2007','F','C1','D5');
INSERT INTO FUNCIONARIO VALUES(139,'Rejane da Cunha','12/01/2005','F','C4','D6');   
INSERT INTO FUNCIONARIO VALUES(123,'Marcos Vinicios da Penha','29/06/2003','M','C7','D6');
INSERT INTO FUNCIONARIO VALUES(148,'Cláudia de Souza','06/01/2008','F','C4','D3');
INSERT INTO FUNCIONARIO VALUES(115,'João Alves','15/10/2003','M','C3','D5');	   
INSERT INTO FUNCIONARIO VALUES(22,'Marcos Coimbra','10/02/2000','M','C2','D4');

-- CRIAÇÃO DAS TABELAS
CREATE TABLE FORNECEDOR (
	CODFOR INT4 NOT NULL CONSTRAINT FORNECEDOR_PK PRIMARY KEY,
	NOMFOR VARCHAR(80) NOT NULL,
	NOMCID VARCHAR(60));

CREATE TABLE PECA (
	CODPEC INT4 NOT NULL CONSTRAINT PECA_PK PRIMARY KEY,
	NOMPEC VARCHAR(50) NOT NULL,
	PESPEC 	 DECIMAL(6,2),
	CORPEC 	 VARCHAR(20));

CREATE TABLE EMBARQUE (
	CODFOR INT4 NOT NULL,
	CODPEC INT4 NOT NULL,
	QTDEMB INT4 DEFAULT 0 NOT NULL,
	CONSTRAINT EMBARQUE_PK PRIMARY KEY(CODFOR, CODPEC),
	CONSTRAINT EMB_CODFOR_FK FOREIGN KEY(CODFOR) REFERENCES FORNECEDOR(CODFOR),
	CONSTRAINT EMB_CODPEC_FK FOREIGN KEY(CODPEC) REFERENCES PECA(CODPEC));

CREATE INDEX FOR_NOMFOR_SK ON FORNECEDOR(CODFOR);
CREATE INDEX PEC_NOMPEC_SK ON PECA(NOMPEC);

-- INSERTS NA TABELA FORNECEDOR

INSERT INTO FORNECEDOR VALUES(1,'Ceval S.A.','Porto Alegre');
INSERT INTO FORNECEDOR VALUES(2,'Seara','Canoas');
INSERT INTO FORNECEDOR VALUES(3,'Aurora','Curitiba');

-- INSERTS NA TABELA PECA

INSERT INTO PECA VALUES(1,'A',6.5,'Preta');
INSERT INTO PECA VALUES(2,'B',4.2,'Vermelha');
INSERT INTO PECA VALUES(3,'C',2.5,'Cinza');
	
-- INSERTS NA TABELA EMBARQUE
 
INSERT INTO EMBARQUE VALUES(1,1,50);
INSERT INTO EMBARQUE VALUES(1,2,150);
INSERT INTO EMBARQUE VALUES(2,1,15);
INSERT INTO EMBARQUE VALUES(2,2,45);

CREATE TABLE CLIENTE (
	CODCLI SERIAL NOT NULL PRIMARY KEY,
	LOGCLI VARCHAR(20) NOT NULL,
	PWDCLI VARCHAR(20) NOT NULL
);

CREATE TABLE PRODUTO (
	CODPRO SERIAL NOT NULL PRIMARY KEY,
	NOMPRO VARCHAR(40) NOT NULL,
	QTDPRO DECIMAL(12,2),
	VLRPRO DECIMAL(12,2)
);

CREATE TABLE PEDIDO (
	CODPED SERIAL NOT NULL PRIMARY KEY,
	DATPED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CODCLI INTEGER NOT NULL REFERENCES CLIENTE(CODCLI)
);

CREATE TABLE PEDIDO_ITEM (
	CODPEDITE SERIAL NOT NULL PRIMARY KEY,
	CODPED INTEGER NOT NULL REFERENCES PEDIDO(CODPED),
	CODPRO INTEGER NOT NULL REFERENCES PRODUTO(CODPRO),
	QTDITM DECIMAL(12,2),
	VLRITM DECIMAL(12,2)	
);

-- CRIAÇÃO DAS TABELAS
CREATE TABLE S (
	A INT2 NOT NULL,
	B VARCHAR(1) NOT NULL,
	C VARCHAR(1) NOT NULL,
	D INT2 NOT NULL);

CREATE TABLE R (
	A INT2 NOT NULL,
	B VARCHAR(1) NOT NULL,
	C VARCHAR(1) NOT NULL,
	D INT2 NOT NULL);

-- INSERTS NA TABELA S

INSERT INTO S VALUES(3,'g','e',3 );
INSERT INTO S VALUES(5,'a','j',7 );
INSERT INTO S VALUES(1,'d','n',21);
INSERT INTO S VALUES(7,'d','e',2);
INSERT INTO S VALUES(9,'e','b',34);
INSERT INTO S VALUES(2,'e','c',7);
INSERT INTO S VALUES(1,'a','j',2);
INSERT INTO S VALUES(1,'f','e',34);
INSERT INTO S VALUES(2,'b','a' ,22);

-- INSERTS NA TABELA R

INSERT INTO R VALUES(3,'a','d',3);
INSERT INTO R VALUES(4,'b','f',7);
INSERT INTO R VALUES(1,'b','j',21);
INSERT INTO R VALUES(2,'f','c',2);
INSERT INTO R VALUES(3,'j','d',34);
INSERT INTO R VALUES(2,'a','c',7);
INSERT INTO R VALUES(1,'a','j',2);
INSERT INTO R VALUES(1,'f','e',34);
INSERT INTO R VALUES(2,'b','a',22);

set datestyle = 'iso, mdy';

-- CRIAÇÃO DAS TABELAS

create table customer
(
    customer_id                     serial,
    title                           char(4),
    fname                           varchar(32),
    lname                           varchar(32) not null,
    addressline                     varchar(64),
    town                            varchar(32),
    zipcode                         char(10) not null,
    phone                           varchar(16),
    CONSTRAINT                      customer_pk PRIMARY KEY(customer_id)
);

create table orderinfo
(
    orderinfo_id                    serial,
    customer_id                     integer not null,
    date_placed                     date not null,
    date_shipped                    date,
    shipping                        numeric(7,2) ,
    CONSTRAINT                      orderinfo_pk PRIMARY KEY(orderinfo_id),
    CONSTRAINT orderinfo_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

create table item
(
    item_id                         serial,
    description                     varchar(64) not null,
    cost_price                      numeric(7,2),
    sell_price                      numeric(7,2),
    CONSTRAINT                      item_pk PRIMARY KEY(item_id)
);
 

create table orderline
(
    orderinfo_id                    integer not null,
    item_id                         integer not null,
    quantity                        integer not null,
    CONSTRAINT                      orderline_pk PRIMARY KEY(orderinfo_id, item_id),
    CONSTRAINT orderline_orderinfo_id_fk FOREIGN KEY(orderinfo_id) REFERENCES orderinfo(orderinfo_id),
    CONSTRAINT orderline_item_id_fk FOREIGN KEY(item_id) REFERENCES item(item_id)
);

create table stock
(
    item_id                         integer not null,
    quantity                        integer  not null,
    CONSTRAINT                      stock_pk PRIMARY KEY(item_id),
    CONSTRAINT stock_item_id_fk FOREIGN KEY(item_id) REFERENCES item(item_id)
);

create table barcode
(
    barcode_ean                     char(13) not null,
    item_id                         integer not null,
    CONSTRAINT                      barcode_pk PRIMARY KEY(barcode_ean),
    CONSTRAINT barcode_item_id_fk FOREIGN KEY(item_id) REFERENCES item(item_id)
);



-- Customers


insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Miss','Jenny','Stones','27 Rowan Avenue','Hightown','NT2 1AQ','023 9876');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Andrew','Stones','52 The Willows','Lowtown','LT5 7RA','876 3527');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Miss','Alex','Matthew','4 The Street','Nicetown','NT2 2TX','010 4567');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Adrian','Matthew','The Barn','Yuleville','YV67 2WR','487 3871');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Simon','Cozens','7 Shady Lane','Oakenham','OA3 6QW','514 5926');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Neil','Matthew','5 Pasture Lane','Nicetown','NT3 7RT','267 1232');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Richard','Stones','34 Holly Way','Bingham','BG4 2WE','342 5982');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mrs','Ann','Stones','34 Holly Way','Bingham','BG4 2WE','342 5982');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mrs','Christine','Hickman','36 Queen Street','Histon','HT3 5EM','342 5432');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Mike','Howard','86 Dysart Street','Tibsville','TB3 7FG','505 5482');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Dave','Jones','54 Vale Rise','Bingham','BG3 8GD','342 8264');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Richard','Neill','42 Thatched Way','Winnersby','WB3 6GQ','505 6482');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mrs','Laura','Hardy','73 Margarita Way','Oxbridge','OX2 3HX','821 2335');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','Bill','O''Neill','2 Beamer Street','Welltown','WT3 8GM','435 1234');
insert into customer(title, fname, lname, addressline, town, zipcode, phone) values('Mr','David','Hudson','4 The Square','Milltown','MT2 6RT','961 4526');

-- Items

insert into item(description, cost_price, sell_price) values('Wood Puzzle', 15.23, 21.95);
insert into item(description, cost_price, sell_price) values('Rubik Cube', 7.45, 11.49);
insert into item(description, cost_price, sell_price) values('Linux CD', 1.99, 2.49);
insert into item(description, cost_price, sell_price) values('Tissues', 2.11, 3.99);
insert into item(description, cost_price, sell_price) values('Picture Frame', 7.54, 9.95);
insert into item(description, cost_price, sell_price) values('Fan Small', 9.23, 15.75);
insert into item(description, cost_price, sell_price) values('Fan Large', 13.36, 19.95);
insert into item(description, cost_price, sell_price) values('Toothbrush', 0.75, 1.45);
insert into item(description, cost_price, sell_price) values('Roman Coin', 2.34, 2.45);
insert into item(description, cost_price, sell_price) values('Carrier Bag', 0.01, 0.0);
insert into item(description, cost_price, sell_price) values('Speakers', 19.73, 25.32);

-- Barcodes

insert into barcode(barcode_ean, item_id) values('6241527836173', 1);
insert into barcode(barcode_ean, item_id) values('6241574635234', 2);
insert into barcode(barcode_ean, item_id) values('6264537836173', 3);
insert into barcode(barcode_ean, item_id) values('6241527746363', 3);
insert into barcode(barcode_ean, item_id) values('7465743843764', 4);
insert into barcode(barcode_ean, item_id) values('3453458677628', 5);
insert into barcode(barcode_ean, item_id) values('6434564564544', 6);
insert into barcode(barcode_ean, item_id) values('8476736836876', 7);
insert into barcode(barcode_ean, item_id) values('6241234586487', 8);
insert into barcode(barcode_ean, item_id) values('9473625532534', 8);
insert into barcode(barcode_ean, item_id) values('9473627464543', 8);
insert into barcode(barcode_ean, item_id) values('4587263646878', 9);
insert into barcode(barcode_ean, item_id) values('9879879837489', 11);
insert into barcode(barcode_ean, item_id) values('2239872376872', 11);

-- Stock

insert into stock(item_id, quantity) values(1,12);
insert into stock(item_id, quantity) values(2,2);
insert into stock(item_id, quantity) values(4,8);
insert into stock(item_id, quantity) values(5,3);
insert into stock(item_id, quantity) values(7,8);
insert into stock(item_id, quantity) values(8,18);
insert into stock(item_id, quantity) values(10,1);

-- Order info

insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(3,'03-13-2004','03-17-2004', 2.99);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(8,'06-23-2004','06-24-2004', 0.00);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(15,'09-02-2004','09-12-2004', 3.99);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(13,'09-03-2004','09-10-2004', 2.99);
insert into orderinfo(customer_id, date_placed, date_shipped, shipping) values(8,'07-21-2004','07-24-2004', 0.00);

-- Order line

insert into orderline(orderinfo_id, item_id, quantity) values(1, 4, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(1, 7, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(1, 9, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 1, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 10, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 7, 2);
insert into orderline(orderinfo_id, item_id, quantity) values(2, 4, 2);
insert into orderline(orderinfo_id, item_id, quantity) values(3, 2, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(3, 1, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(4, 5, 2);
insert into orderline(orderinfo_id, item_id, quantity) values(5, 1, 1);
insert into orderline(orderinfo_id, item_id, quantity) values(5, 3, 1);