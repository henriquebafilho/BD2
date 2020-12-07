/*a. Crie uma nova tabela para o banco de dados mercado com o nome de "log".
i. Coloque os campos Id (auto incremento), operação, tabela, data e hora; */
create table log(
	id int primary key auto_increment,
    operacao varchar(30),
    tabela varchar(30),
    dataHora datetime
);

/*ii. Crie gatilhos nas tabelas de “produto” e “itensvenda” para cada uma das
operações de insert/update/delete. */
DELIMITER $$

-- itensvenda insert
create trigger itensvenda_after_insert after insert
on itensvenda
for each row
begin
	insert into log(operacao, tabela, dataHora) values ('insert', 'itensvenda', now());
end$$

-- itensvenda update
create trigger itensvenda_after_update after update
on itensvenda
for each row
begin
	insert into log(operacao, tabela, dataHora) values ('update', 'itensvenda', now());
end$$

-- itensvenda delete
create trigger itensvenda_after_delete after delete
on itensvenda
for each row
begin
	insert into log(operacao, tabela, dataHora) values ('delete', 'itensvenda', now());
end$$

-- produtos insert
create trigger produtos_after_insert after insert
on produtos
for each row
begin
	insert into log(operacao, tabela, dataHora) values ('insert', 'produtos', now());
end$$

-- produtos update
create trigger produtos_after_update after update
on produtos
for each row
begin
	insert into log(operacao, tabela, dataHora) values ('update', 'produtos', now());
end$$

-- produtos delete
create trigger produtos_after_delete after delete
on produtos
for each row
begin
	insert into log(operacao, tabela, dataHora) values ('delete', 'produtos', now());
end$$

-- iv. Inclua, exclua e altere registros das demais tabelas do banco de dados;
-- produtos
insert into produtos values (004, 'Leite', 3);
update produtos set Estoque = 5 where referencia = 003;
delete from produtos where Descricao = 'Arroz';

-- itensvenda
insert into itensvenda values (3, 003, 3);
update itensvenda set Quantidade = 10 where Quantidade = 3;
delete from itensvenda where Quantidade = 5;

-- v. Execute um SELECT na tabela de LOG e verifique o resultado;
select * from log;