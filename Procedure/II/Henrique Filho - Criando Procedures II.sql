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


/* d. Crie um procedimento que passe o nome de um funcionário, se seu título por parâmetros.
Recupere em uma variável seu código. Inclua o registro na tabela titles.*/


/* e. Crie um procedimento que passe o nome de um funcionário por parâmetro. Recupere em
uma variável seu código e inclua o registro na tabela salaries. */


/* f. Altere os procedimentos dos exercícios anteriores para verificar se os registros retornados
para as variáveis são válidos ou não. Caso sejam válidos as inclusões podem ocorrer
normalmente. Se não forem válidos, o banco de dados deve retornar uma mensagem de erro. */


-- g. Crie um procedimento que altere os salários de funcionários que tenham o título de desenvolvedor em 10% do valor;


-- h. Crie um procedimento para alterar o salário de todos os funcionários em 5% de acréscimo;


-- i. Crie um procedimento que altere todos os títulos de quem é Desenvolvedor para Engenheiro;


-- j. Crie um procedimento para despedir (excluir) todos os funcionários que tenha mais de 55 anos;


-- k. Crie um procedimento para alterar o salário de um determinado funcionário.


-- l. Em todos os exercícios devem ser realizadas verificações de informações válidas;