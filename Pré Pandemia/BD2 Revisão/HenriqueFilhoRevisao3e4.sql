/*Questão 1*/
select nome, cpf, endereco, telefone from participante order by nome ASC;

/*Questão 2*/
select nome, cidade, rua, cep from localizacao where cidade='Rio de Janeiro' or cidade='Niterói' order by cidade ASC;

/*Questão 3*/
insert into localizacao(nome, rua, cidade, cep, capacidade) 
values ('Anhanguera Niterói', 'Avenida Visconde do Rio Branco', 'Niterói', '24020270', 100);

/*Questão 4*/
select nome, capacidade from localizacao where capacidade < 1000 and cidade='Niterói' order by capacidade desc;

/*Questão 5*/
select nome, profissao, formacao from palestrante where formacao='Superior' or formacao='Pós-Graduação';

/*Questão 6*/
select nome, profissao, email from palestrante where email is not null;

/*Questão 7*/
select nome, formacao, telefone, email from palestrante
where (formacao='Superior' or formacao='Pós-Graduação')
and (email is not null or telefone is not null);

/*Questão 8*/
select nome, cpf, email from participante where nome like 'João%';

/*Questão 9*/
select nome, cpf, email from participante 
where (nome like 'C%' or nome like 'M%')
and nome like '%o';

/*Questão 10*/
select distinct cidade from localizacao;

/*Questão 11*/
select titulo, descricao, data_hora, duracao_total from palestra
where valor between 149.90 and 200.0 order by valor asc;