-- a. Crie uma função para mostrar a média de salários de um determinado título;
delimiter $$
create function mediaSalariosTitulo
	(tituloNome varchar(50))
returns decimal(15.2)
deterministic
begin
	declare media decimal(15.2);

	select (sum(s.salary) / count(t.emp_no)) mediaSalario
    into media
	from salaries s
	join titles t 
	on s.emp_no = t.emp_no
	where t.title = tituloNome;
    
    return media;
end$$

-- b. Crie uma função para retornar a quantidade de funcionários para um determinado título;
delimiter $$
create function qtdFuncionariosTitulo
	(tituloNome varchar(50))
returns int
deterministic
begin
	declare qtd int;

	select count(e.emp_no) funcionariosTitulo
    into qtd
	from employees e 
	join titles t 
	on e.emp_no = t.emp_no
	where t.title = tituloNome;
    
    return qtd;
end$$

-- c. Crie uma função para retornar a quantidade de funcionários de um determinado departamento;


-- d. Crie uma função para retornar o funcionário mais velho de um determinado departamento;


-- e. Crie uma função para retornar o gerente de um determinado departamento;


-- f. Crie uma função para retornar qual é o funcionário que tem o maior salário de um departamento;


-- g. Crie uma função para retornar qual é o funcionário que tem o menor salário por um determinado título;

