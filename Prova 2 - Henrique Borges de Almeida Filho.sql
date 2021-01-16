-- 1
DELIMITER $$
create procedure empresaQtdAcoes(empresa varchar(50))
begin
	select e.compania, q.idempresa from empresas e 
    inner join qtdeacoes q 
    on e.id = q.id
		where e.compania = empresa;
END $$

call empresaQtdAcoes('Abatz');

-- 2
delimiter $$
create function getIDVendedor
	(nomeV varchar(50), nacionalidadeV varchar(50), emailV varchar(50), dtnascimentoV varchar(50))
returns int
deterministic
begin
	declare idV int;
	
	insert into vendedor (nome, nacionalidade, email, dtnascimento) values
    (nomeV, nacionalidadeV, emailV, dtnascimentoV);
    
    select id into idV
    from vendedor
    where nome = nomeV;
    
    return idV;
end $$

select getIDVendedor('Rickson', 'Paraguay', 'ricksparaguai@gmail.com', '1985-06-19');

-- 3 a
DELIMITER $$
create trigger incrementaAcoes after insert
on operacao
for each row
begin
	UPDATE qtdeacoes
    SET qtde = qtde + 1
    WHERE tipo = 'C';
end
$$

-- 3 b
DELIMITER $$
create trigger decrementaAcoes after insert
on operacao
for each row
begin
	UPDATE qtdeacoes
    SET qtde = qtde - 1
    WHERE tipo = 'V';
end
$$

-- 4
DELIMITER $$
create procedure insereOperacao(idvendedor_op int, idempresa_op int, qtde_op int, tipo_op varchar(1))
begin
	insert into operacao (idvendedor, idempresa, qtde, tipo) values (idvendedor_op, idempresa_op, qtde_op, tipo_op);
END $$

call insereOperacao(2, 2, 9, 's');

-- 5
DELIMITER $$
create procedure maiorVendas(empresa varchar(50))
begin
	select v.nome, max(o.qtde) from vendedor v 
	inner join empresas e 
	on e.id = v.id
		inner join operacao o
		on e.id = o.id
        where e.compania = empresa;
END $$

call maiorVendas('Plajo');

-- 6
create view qtdAcoesEmpresas
as
select e.id, e.compania, q.qtde from empresas e
inner join qtdeacoes q 
on q.id = e.id
group by compania;

select * from qtdAcoesEmpresas;

-- 7
delimiter $$
create function getDataNascimento
	(nomeVendedor varchar(50))
returns date
deterministic
begin
	declare dataNasc date;
    
    select dtnascimento into dataNasc
    from vendedor
    where nome = nomeVendedor;
    
    return dataNasc;
end $$

select getDataNascimento('Louis Simmons');

-- 8
DELIMITER $$
create procedure insereVendedor(name_v varchar(50), nacionality varchar(50), email_v varchar(50))
begin
	insert into vendedor (nome, nacionalidade, email, dtnascimento) values (name_v, nacionality, email_v, CURDATE());
END $$

call insereVendedor('Henrique', 'Brasil', 'ricko@gmail.com');

-- 9
DELIMITER $$
create procedure getNacionalidade(pais varchar(50))
begin
	select * from vendedor where nacionalidade = pais;
END $$

call getNacionalidade('Portugal');