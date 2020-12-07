-- a. Crie uma view que exiba todos os países com expectativa de vida maior que 77 anos. Mostrando a expectativa e o nome do país;
select * from paises;

-- b. Crie uma view que mostre todos os países que possuem falantes língua chinesa e japonesa, mostre o país, a porcentagem e a língua;
select * from paisesChinesJapones;

-- c. Crie uma view para mostrar as cidades paulistas e cariocas com menos de 100000 habitantes.
select * from cidadesSPRJ;

-- d. Crie uma view que exiba o nome do país e sua cidade CAPITAL (nome do país e todos os campos de cidade);
select * from paisesCapital;

-- e. Crie uma view que mostre a língua OFICIAL de cada um dos países e exiba a porcentagem de falantes;
select * from linguaOficial;

-- f. Crie uma view que mostre a quantidade de países falantes de cada uma das línguas.
 select * from linguas;
 
-- g. Crie uma view que mostre a quantidade de países em cada um dos regimes governamentais.
select * from governos;

-- h. Crie uma view que mostre a quantidade da população mundial;
select * from populacaoMundial;

-- i. Crie uma view que mostre cada um dos países e seu tamanho territorial;
select * from tamanhoTerritorial;

-- j. Crie uma view que mostre a soma do tamanho territorial e a quantidade de falantes de cada idioma;
select * from somaTerritorial;

-- quantidade de falantes de cada idioma
select * from linguasPorPais;

-- k. Crie uma view parecida com a anterior, porém, exiba somente a que população menor que 10 mil;
select * from linguasPorPaisMenorQueDezMil;
