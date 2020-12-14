-- a. Crie um procedimento para incluir novos empregados;
call incluiEmpregado('1960-08-18', 'Henrique', 'Almeida', 'M', '1999-08-31');

/* b. Crie um procedimento que passe por parâmetros os dados para a inclusão de um novo 
funcionário. Crie variável para controlar o auto incremento do seu campo primário. Inclua
no banco de dados um novo registro; */
call incluiFuncionario('1999-08-31', 'Henrique', 'Filho', 'M', '2020-12-07');

/* c. Crie um procedimento que passe por parâmetro o nome do departamento e do funcionário.
Crie variáveis que receba o código deste funcionário e deste departamento. Inclua um novo
registro na tabela dept_emp;*/
call getDepFun('Development', 'Georgi', 'Noriega');

/* d. Crie um procedimento que passe o nome de um funcionário, se seu título por parâmetros.
Recupere em uma variável seu código. Inclua o registro na tabela titles.*/
call funTitle('Georgi', 'Noriega', 'Staff');

/* e. Crie um procedimento que passe o nome de um funcionário por parâmetro. Recupere em
uma variável seu código e inclua o registro na tabela salaries. */
call insertSalaries('Georgi', 'Noriega');

-- g. Crie um procedimento que altere os salários de funcionários que tenham o título de desenvolvedor em 10% do valor;
call diminuiSalarioDezPct();

-- h. Crie um procedimento para alterar o salário de todos os funcionários em 5% de acréscimo;
call aumentaSalarioCincoPct();

-- i. Crie um procedimento que altere todos os títulos de quem é Desenvolvedor para Engenheiro;
call desenvolvedorEngenheiro();

-- j. Crie um procedimento para despedir (excluir) todos os funcionários que tenha mais de 55 anos;
call deleteEmpMais55();

-- k. Crie um procedimento para alterar o salário de um determinado funcionário.
call alteraSalario(10095, 1045);