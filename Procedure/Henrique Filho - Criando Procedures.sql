-- a. Crie um procedimento para retornar o salário mais alto de cada um dos departamentos.
DELIMITER $$
create procedure maiorSalarioPorDep()
begin
	select d.dept_name, MAX(s.salary) as maiorSalario from salaries s
	inner join dept_emp de
	on de.emp_no = s.emp_no
		inner join departments d
		on d.dept_no = de.dept_no
		group by d.dept_name;
END $$

-- b. Crie um procedimento que retorne o salário mais alto da empresa.
DELIMITER $$
create procedure maiorSalario()
begin
	select max(salary) from salaries;
END $$

-- c. Crie um procedimento que retorne o nome, sobrenome, idade, salário e departamento do funcionário mais velho da empresa.
DELIMITER $$
create procedure funcionarioMaisVelho()
begin
	select e.first_name, e.last_name, min(e.birth_date), s.salary, d.dept_name from employees e
			inner join salaries s
			on e.emp_no = s.emp_no
				inner join dept_emp de
				on de.emp_no = s.emp_no
					inner join departments d
					on d.dept_no = de.dept_no;
END $$

-- d. Crie um procedimento que retorne o nome, sobrenome, idade, salário e departamento do funcionário mais novo da empresa,
DELIMITER $$
create procedure funcionarioMaisNovo()
begin
	select e.first_name, e.last_name, max(e.birth_date), s.salary, d.dept_name from employees e
			inner join salaries s
			on e.emp_no = s.emp_no
				inner join dept_emp de
				on de.emp_no = s.emp_no
					inner join departments d
					on d.dept_no = de.dept_no;
END $$

-- e. Crie um procedimento que mostre todos os departamentos e seus gerentes;
DELIMITER $$
create procedure gerentesDepartamentos()
begin
	select d.dept_name, e.first_name, e.last_name from titles t
	inner join dept_emp de
	on t.emp_no = de.emp_no
		inner join departments d
		on de.dept_no = d.dept_no
			inner join employees e
			on e.emp_no = t.emp_no
			where t.title = 'Manager';
END $$

-- f. Crie um procedimento que filtre todos os funcionários de acordo com seu sexo;
DELIMITER $$
create procedure filtraPorSexo(sexo varchar(1))
begin
	select first_name, last_name, gender from employees 
	where gender = sexo;
END $$

-- g. Crie um procedimento que conte a quantidade de funcionários masculinos e femininos e os retorne;
DELIMITER $$
create procedure qtdSexo()
begin
	select count(emp_no), gender from employees group by gender;
END $$

-- h. Crie um procedimento que exiba e retorne o título com a maior quantidade de funcionários;
DELIMITER $$
create procedure tituloComMaisFuncionarios()
begin
	select t.title, count(e.emp_no) as quantidade from titles t 
	inner join employees e
	on e.emp_no = t.emp_no
	group by t.title
	order by quantidade desc limit 1;
END $$

-- i. Crie um procedimento que retorne todos os funcionários de um determinado título;
DELIMITER $$
create procedure funcionariosTitles(departamento varchar(50))
begin
	select e.first_name, e.last_name, t.title as sexo from employees e
    inner join titles t
    on t.emp_no = e.emp_no
	where t.title = departamento;
END $$

-- j. Crie um procedimento que filtre funcionários por título e departamento;
DELIMITER $$
create procedure funcionariosTitlesEDep()
begin
select e.first_name, e.last_name, t.title, d.dept_name from employees e
inner join titles t
on t.emp_no = e.emp_no
	inner join dept_emp de
    on de.emp_no = t.emp_no
		inner join departments d
        on d.dept_no = de.dept_no
        order by t.title, d.dept_name;
END $$
