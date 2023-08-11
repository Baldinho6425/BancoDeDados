-- DML: insert, Update, Delete e Select
-- Exemplos de insert

select * from peca;

-- Ex1
insert into cargo 
values('c8', 'programador', 20000.99);

-- Ex2
insert into cargo 
values('c9', 'DBA', 1500*10)

-- Ex3
insert into disciplina 
values(
	(select max(coddis) + 1 from disciplina), 'Disciplina Genérica', 80
);

-- Ex4
insert into emprestimo 
values(
	(select max(codemp) + 1 from emprestimo), 1001, 1, '01/04/2023' 
);

-- Ex5
insert into usuario(codusu, nomusu)
values(999, 'Fulano da Silva');


-- Exemplos de update 

-- Ex6
-- Aumentar em 10% o salário do programador
update cargo set vlrsal = vlrsal * 1.10
where descar = 'programador';

-- Ex7
-- Remover a letra C da coluna codcar de todos os cargos
update cargo set
	codcar = trim(substr(codcar, 2, 1));

alter table funcionario 
	drop constraint fun_codcar_fk;

update funcionario set 
	codcar = trim(substr(codcar, 2, 1));

update cargo set 
	codcar = trim(substr(codcar, 2, 1));

alter table funcionario 
	add constraint fun_codcar_fk foreign key(codcar) references cargo(codcar);


-- Exemplo de comando delete

-- Ex8
-- Excluir histórico/notas de alunos cuja nota seja menor que 6
delete from historico
where vlrnot < 6;

-- Ex9
-- Excluir embarques com qtdemb > 100
delete from embarque 
where qtdemb > 1000;

-- Ex10
-- Excluir itens da tabela stock cujos códigos sejam mútiplos de 3
delete from stock 
where mod(item_id, 3) = 0;

-- Ex11
-- Excluir todos os empréstimos 
delete from emprestimo
where 0 = 0;

-- Ex12 
-- Limpar todos os valores da coluna corpec da tabela peça
update peca set corpec = null;

-- Ex13
-- Remover a coluna endalu da tabela aluno
alter table aluno drop endalu;

-- Ex14
-- Relatório de usuários com empréstimos
select u.codusu, u.nomusu, e.datemp
from usuario u
inner join emprestimo e on u.codusu = e.codusu
order by u.nomusu;

-- Ex15
-- Relatório de alunos e a média de suas notas
select a.codalu, a.nomalu, avg(h.vlrnot) media
from aluno a 
inner join historico h on a.codalu = h.codalu
group by a.codalu, a.nomalu 
order by media desc;

-- Ex16
-- Relatório do usuário, reserva, livro e biblioteca da reserva
select u.codusu, u.nomusu, r.datres, l.titliv, b.nombib
from usuario u 
inner join reserva r on u.codusu = r.codusu 
inner join livro l on r.codliv = l.codliv 
inner join biblioteca b on l.codbib = b.codbib
order by u.nomusu, datres desc;

-- Ex17
-- Relatório dos funcionários com cargo, salário e o departamento

select f.numfun, f.nomfun, c.descar, c.vlrsal, d.desdep
from funcionario f 
left join cargo c on f.codcar = c.codcar
inner join departamento d on f.coddep = d.coddep 
--where c.vlrsal > 500
order by c.vlrsal desc;