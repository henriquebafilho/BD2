-- a. Crie uma função para mostrar a média de salários de um determinado título;
select mediaSalariosTitulo('Engineer');

-- b. Crie uma função para retornar a quantidade de funcionários para um determinado título;
select qtdFuncionariosTitulo('Assistant Engineer');

-- c. Crie uma função para retornar a quantidade de funcionários de um determinado departamento;
select qtdFuncionariosDepartamento('Customer Service');

-- d. Crie uma função para retornar o funcionário mais velho de um determinado departamento;
select funcionarioMaisVelhoDep('Customer Service');

-- e. Crie uma função para retornar o gerente de um determinado departamento;
select gerenteDepartamento('Development');

-- f. Crie uma função para retornar qual é o funcionário que tem o maior salário de um departamento;
select maiorSalaraioDep('Development');

-- g. Crie uma função para retornar qual é o funcionário que tem o menor salário por um determinado título;
select menorSalaraioTitle('Engineer');
