-- a. Crie um procedimento para incluir novos empregados;
DELIMITER $$
create procedure incluiEmpregado(birthDate date, firstName varchar(14), lastName varchar(16), personGender enum('M','F'), hireDate date)
BEGIN
	declare qtdEmployees int;

	select count(*) + 1
    into qtdEmployees
    from employees;
    
    insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
    values (qtdEmployees, birthDate, firstName, lastName, personGender, hireDate);
END $$

/* b. Crie um procedimento que passe por parâmetros os dados para a inclusão de um novo 
funcionário. Crie variável para controlar o auto incremento do seu campo primário. Inclua
no banco de dados um novo registro; */
DELIMITER $$
create procedure incluiFuncionario(birthDate date, firstName varchar(14), lastName varchar(16), personGender enum('M','F'), hireDate date)
BEGIN
	declare qtdEmployees int;

	select count(*) + 1
    into qtdEmployees
    from employees;
    
    insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
    values (qtdEmployees, birthDate, firstName, lastName, personGender, hireDate);
END $$

/* c. Crie um procedimento que passe por parâmetro o nome do departamento e do funcionário.
Crie variáveis que receba o código deste funcionário e deste departamento. Inclua um novo
registro na tabela dept_emp;*/
DELIMITER $$
create procedure getDepFun(departamento varchar(50), funFirstName varchar(50), funLastName varchar(50))
begin
	declare depCode char(4);
    declare empCode int;
    
    select d.dept_no 
    into depCode
    from departments d where d.dept_name = departamento;

	select e.emp_no
    into empCode
    from employees e 
    where e.first_name = funFirstName
    and e.last_name = funLastName;
    
    insert into dept_emp (emp_no, dept_no, from_date, to_date) values (empCode, depCode, curdate(), '2050-12-31');
END $$

/* d. Crie um procedimento que passe o nome de um funcionário, se seu título por parâmetros.
Recupere em uma variável seu código. Inclua o registro na tabela titles.*/
DELIMITER $$
create procedure funTitle(funFirstName varchar(50), funLastName varchar(50), titulo varchar(50))
begin
    declare empCode int;

	select e.emp_no
    into empCode
    from employees e 
    where e.first_name = funFirstName
    and e.last_name = funLastName;
    
    insert into titles (emp_no, title, from_date, to_date) values (empCode, titulo, curdate(), '2050-12-31');
END $$

/* e. Crie um procedimento que passe o nome de um funcionário por parâmetro. Recupere em
uma variável seu código e inclua o registro na tabela salaries. */
DELIMITER $$
create procedure insertSalaries(funFirstName varchar(50), funLastName varchar(50))
begin
    declare empCode int;

	select e.emp_no
    into empCode
    from employees e 
    where e.first_name = funFirstName
    and e.last_name = funLastName;
    
    insert into salaries (emp_no, salary, from_date, to_date) values (empCode, 50000, curdate(), '2050-12-31');
END $$

/* f. Altere os procedimentos dos exercícios anteriores para verificar se os registros retornados
para as variáveis são válidos ou não. Caso sejam válidos as inclusões podem ocorrer
normalmente. Se não forem válidos, o banco de dados deve retornar uma mensagem de erro. */

-- a
DELIMITER $$
create procedure incluiEmpregado(birthDate date, firstName varchar(14), lastName varchar(16), personGender enum('M','F'), hireDate date)
BEGIN
	declare qtdEmployees int;
    
    if((year(birthDate) < 2020) and (firstName != '') and (lastName != '') and ((personGender = 'M') or (personGender = 'F')) and (year(hireDate) < 2020)) then
		select count(*) + 1
		into qtdEmployees
		from employees;
		
		insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
		values (qtdEmployees, birthDate, firstName, lastName, personGender, hireDate);
	else
		select 'Dados inválidos!';
	end if;
END $$

-- b
DELIMITER $$
create procedure incluiFuncionario(birthDate date, firstName varchar(14), lastName varchar(16), personGender enum('M','F'), hireDate date)
BEGIN
	declare qtdEmployees int;
    
    if((year(birthDate) < 2020) and (firstName != '') and (lastName != '') and ((personGender = 'M') or (personGender = 'F')) and (year(hireDate) < 2020)) then
		select count(*) + 1
		into qtdEmployees
		from employees;
		
		insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
		values (qtdEmployees, birthDate, firstName, lastName, personGender, hireDate);
	else
		select 'Dados inválidos!';
	end if;
    
END $$

-- c
DELIMITER $$
create procedure getDepFun(departamento varchar(50), funFirstName varchar(50), funLastName varchar(50))
begin
	declare depCode char(4);
    declare empCode int;
    
    if((departamento != '') and (funFirstName != '') and (funLastName != '')) then
		select d.dept_no 
		into depCode
		from departments d where d.dept_name = departamento;

		select e.emp_no
		into empCode
		from employees e 
		where e.first_name = funFirstName
		and e.last_name = funLastName;
		
		insert into dept_emp (emp_no, dept_no, from_date, to_date) values (empCode, depCode, curdate(), '2050-12-31');
    else
		select 'Dados inválidos';
    end if;
END $$

-- d
DELIMITER $$
create procedure funTitle(funFirstName varchar(50), funLastName varchar(50), titulo varchar(50))
begin
    declare empCode int;

	if((funFirstName != '') and (funLastName != '') and (titulo != '')) then
		select e.emp_no
		into empCode
		from employees e 
		where e.first_name = funFirstName
		and e.last_name = funLastName;
		
		insert into titles (emp_no, title, from_date, to_date) values (empCode, titulo, curdate(), '2050-12-31');
    else
		select 'Dados inválidos!';
    end if;
END $$

-- e
DELIMITER $$
create procedure insertSalaries(funFirstName varchar(50), funLastName varchar(50))
begin
    declare empCode int;

	if((funFirstName != '') and (funLastName != '')) then
		select e.emp_no
		into empCode
		from employees e 
		where e.first_name = funFirstName
		and e.last_name = funLastName;
		
		insert into salaries (emp_no, salary, from_date, to_date) values (empCode, 50000, curdate(), '2050-12-31');
    else
		select 'Dados inválidos';
    end if;
END $$

-- g. Crie um procedimento que altere os salários de funcionários que tenham o título de desenvolvedor em 10% do valor;
DELIMITER $$
create procedure diminuiSalarioDezPct()
begin
    update salaries s
		inner join titles t
		on t.emp_no = s.emp_no
    set s.salary = s.salary - (s.salary * 0.1) 
    where t.title = 'Staff';
END $$

-- h. Crie um procedimento para alterar o salário de todos os funcionários em 5% de acréscimo;
DELIMITER $$
create procedure aumentaSalarioCincoPct()
begin
   update salaries set salary = salary + (salary * 0.05) where salary > 0;
END $$

-- i. Crie um procedimento que altere todos os títulos de quem é Desenvolvedor para Engenheiro;
DELIMITER $$
create procedure desenvolvedorEngenheiro()
begin
   update titles set title = 'Engineer' where title = 'Staff';
END $$

-- j. Crie um procedimento para despedir (excluir) todos os funcionários que tenha mais de 55 anos;
DELIMITER $$
create procedure deleteEmpMais55()
begin
   delete from employees where Year(birth_date) < 1965;
END $$

-- k. Crie um procedimento para alterar o salário de um determinado funcionário.
DELIMITER $$
create procedure alteraSalario(empCode int, newSalary int)
begin
	if(newSalary < 1045) then
		select 'Salário inválido pois é menor que o salário mínimo';
	else
		update salaries set salary = newSalary where emp_no = empCode;
   end if;
END $$