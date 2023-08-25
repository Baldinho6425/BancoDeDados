-- DCL - Create user

-- Criando um novo usuário
create user maick with login createdb password 'strogonoff';

select md5('strogonoff');

-- Algoritmos de ciframento: assimétricos e simétricos
-- Simétricos ele tem uma chave: 3DES
-- Assimétricos são por troca de chave (chave pública e chave privada)
-- Algoritmos de resumo criptográfico (hash)
-- md5, md6, sha1, sha2, sha256, ....


-- Concendendo premissão de select na tabela
-- aluno para o usuário maick

grant select on aluno to maick;


-- Criando um grupo chamado estudante
-- o grupo tem permissão de consultar as 
-- tabelas histórico e disciplina e esta 
-- incluido nesse grupo, o usuário maick


-- 1) Criar o grupo
create group estudante;

-- 2) Conceder as permissões
grant select on historico, disciplina
to estudante;

-- 3) Colocar o usuário no grupo
grant estudante to maick;
