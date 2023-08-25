-- Aula 24/08 - Views

create view relatorio_funcionarios_vw as
select f.numfun codigo, f.nomfun nome, c.vlrsal salario
from funcionario f 
inner join cargo c on f.codcar = c.codcar 
where c.vlrsal > 800
order by nome;


-- Consultando a view
select * from relatorio_funcionarios_vw;


-- 1) Selecione os dados de empréstimo de cada usuário.
-- Liste todas as colunas da tabela emprestimo e todas as colunas da tabela usuário.
-- Coloque em ordem de nome de usuário e data de empréstimo

create view relatorio_emprestimo_vw as
select e.codemp, e.codusu codusuemp, e.codliv, u.*
from emprestimo e
inner join usuario u on e.codusu = u.codusu 
order by u.nomusu, e.datemp;

select * from relatorio_emprestimo_vw;

insert into emprestimo values(1, 1001, 1, current_timestamp);


-- 2) Buscar os dados dos fornecedores de Porto Alegre

create or replace view relatorio_fornecedores_vw as
select * from fornecedor 
where nomcid = 'Porto Alegre' and codfor > 1;

select * from relatorio_fornecedores_vw;


-- 4) Buscar o nome e a cidade dos fornecedores que 
-- realizaram embarques em quantidades maiores que 500

create view relatorio_embarques_vw as
select f.nomfor, f.nomcid
from fornecedor f
inner join embarque e on e.codfor = f.codfor
where e.qtdemb > 100;

select * from relatorio_embarques_vw;

-- Excluindo uma view
drop view relatorio_funcionarios_vw;











