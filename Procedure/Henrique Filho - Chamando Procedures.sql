-- a. Crie um procedimento para retornar o salário mais alto de cada um dos departamentos.
call maiorSalarioPorDep();

-- b. Crie um procedimento que retorne o salário mais alto da empresa.
call maiorSalario();

-- c. Crie um procedimento que retorne o nome, sobrenome, idade, salário e departamento do funcionário mais velho da empresa.
call funcionarioMaisVelho();

-- d. Crie um procedimento que retorne o nome, sobrenome, idade, salário e departamento do funcionário mais novo da empresa,
call funcionarioMaisNovo();

-- e. Crie um procedimento que mostre todos os departamentos e seus gerentes;
call gerentesDepartamentos();

-- f. Crie um procedimento que filtre todos os funcionários de acordo com seu sexo;
-- feminino
call filtraPorSexo('F');
-- masculino
call filtraPorSexo('M');

-- g. Crie um procedimento que conte a quantidade de funcionários masculinos e femininos e os retorne;
-- masculino
call qtdSexo();

-- h. Crie um procedimento que exiba e retorne o título com a maior quantidade de funcionários;
call tituloComMaisFuncionarios();

-- i. Crie um procedimento que retorne todos os funcionários de um determinado título;
call funcionariosTitles('Senior Engineer');
call funcionariosTitles('Staff');
call funcionariosTitles('Engineer');
call funcionariosTitles('Senior Staff');
call funcionariosTitles('Assistant Engineer');
call funcionariosTitles('Technique Leader');
call funcionariosTitles('Manager');

-- j. Crie um procedimento que filtre funcionários por título e departamento;
call funcionariosTitlesEDep();
