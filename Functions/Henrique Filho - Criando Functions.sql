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
end $$

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
end $$

-- c. Crie uma função para retornar a quantidade de funcionários de um determinado departamento;
delimiter $$
create function qtdFuncionariosDepartamento
	(departamentoNome varchar(50))
returns int
deterministic
begin
	declare qtd int;

	select count(d.dept_no) funcionariosDep
    into qtd
	from employees e 
	join dept_emp de
	on de.emp_no = e.emp_no
		join departments d
        on d.dept_no = de.dept_no
		and d.dept_name = departamentoNome;
    
    return qtd;
end $$

-- d. Crie uma função para retornar o funcionário mais velho de um determinado departamento;
delimiter $$
create function funcionarioMaisVelhoDep
	(departamento varchar(50))
returns varchar(100)
deterministic
begin
	declare funcionario varchar(100);

	select concat(e.first_name, ' ', e.last_name)
    into funcionario
    from employees e 
    join dept_emp de 
    on de.emp_no = e.emp_no
		join departments d
        on d.dept_no = de.dept_no
        and d.dept_name = departamento
        order by e.birth_date asc limit 1;

	return funcionario;
end $$

-- e. Crie uma função para retornar o gerente de um determinado departamento;
delimiter $$
create function gerenteDepartamento
	(departamento varchar(50))
returns varchar(100)
deterministic
begin
	declare gerente varchar(50);
    
    select CONCAT(e.first_name, ' ', e.last_name) into gerente
    from departments d
    join dept_manager dm
		on d.dept_no = dm.dept_no
			join employees e
			on dm.emp_no = e.emp_no
			and d.dept_name = departamento
			order by dm.from_date asc limit 1;
    
    return gerente;
end $$

-- f. Crie uma função para retornar qual é o funcionário que tem o maior salário de um departamento;
delimiter $$
create function maiorSalaraioDep
	(departamento varchar(50))
returns varchar(100)
deterministic
begin
	declare funcionario varchar(50);
    
    select CONCAT(e.first_name, ' ', e.last_name) into funcionario
    from departments d
    join dept_emp de
	on d.dept_no = de.dept_no
		join employees e
		on de.emp_no = e.emp_no
			join salaries s
            on s.emp_no = e.emp_no
				where d.dept_name = departamento
				order by s.salary desc limit 1;
    
    return funcionario;
end $$

-- g. Crie uma função para retornar qual é o funcionário que tem o menor salário por um determinado título;
delimiter $$
create function menorSalaraioTitle
	(titulo varchar(50))
returns varchar(100)
deterministic
begin
	declare funcionario varchar(50);
    
    select CONCAT(e.first_name, ' ', e.last_name) into funcionario
    from titles t
		join employees e
		on t.emp_no = e.emp_no
			join salaries s
            on s.emp_no = e.emp_no
				and t.title = titulo
				order by s.salary asc limit 1;
    
    return funcionario;
end $$
