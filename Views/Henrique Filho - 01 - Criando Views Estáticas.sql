-- a. Crie e exiba uma View Estática com seus dados: nome, CPF, endereço, cidades, estado, pais, cep, e-mail e telefone.
create view minhaView
as
select 
'Henrique' Nome,
'123.456.789-01' CPF,
'Avenida Acacia, nº 22' Endereço,
'Rio de Janeiro' Cidade,
'Rio de Janeiro' Estado,
'Brasil' País, 
'56423-964' CEP,
'henrique.filho@uniriotec.br' Email,
'(21) 4002-8922' Telefone; 

-- b. Crie e exiba uma View Estática com dados de um veículo que mais gosta: modelo, ano, serie, montadora, valor.
create view carroView
as
select 
'Fit' Modelo,
'2021' Ano,
'Honda' Montadora,
'Cinza' Cor,
'R$85.400,00' Preço; 

-- c. Crie e exiba uma View Estática com os dados de um computador dos seus sonhos: memória, armazenamento, vídeo, processador, som e etc.
create view pcView
as
select
'Inspiron 15 Série 3000' Modelo,
'8 GB' Memória,
'Windows 10 Home' Sistema,
'2 TB' Disco_Rigido,
'Intel Core i7' Processador;