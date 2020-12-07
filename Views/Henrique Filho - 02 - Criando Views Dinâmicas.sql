-- a. Crie uma view que exiba todos os países com expectativa de vida maior que 77 anos. Mostrando a expectativa e o nome do país;
create view paises
as
select LifeExpectancy, Name from country
where LifeExpectancy > 77;

-- b. Crie uma view que mostre todos os países que possuem falantes língua chinesa e japonesa, mostre o país, a porcentagem e a língua;
create view paisesChinesJapones
as
select c.Name, cl.Percentage, cl.Language 
from country c 
inner join countrylanguage cl
on c.code = cl.CountryCode
where cl.Language = 'Japanese'
or cl.Language = 'Chinese';

-- c. Crie uma view para mostrar as cidades paulistas e cariocas com menos de 100000 habitantes.
create view cidadesSPRJ
as
select * from city 
where (District = 'SÃ£o Paulo' 
or District = 'Rio de Janeiro') 
and Population < 100000;

-- d. Crie uma view que exiba o nome do país e sua cidade CAPITAL (nome do país e todos os campos de cidade);
create view paisesCapital
as
select p.Name, c.ID, c.Name as cidade, c.CountryCode, c.District, c.Population from city c
inner join country p
on p.Code = c.CountryCode
where c.id = p.Capital;

-- e. Crie uma view que mostre a língua OFICIAL de cada um dos países e exiba a porcentagem de falantes;
create view linguaOficial
as
select c.Name, cl.Language, cl.Percentage from country c
inner join countrylanguage cl
on c.code = cl.CountryCode
where cl.IsOfficial = 'T';

-- f. Crie uma view que mostre a quantidade de países falantes de cada uma das línguas.
 create view linguas
as
select Language, count(Language) as Quantidade 
from countrylanguage
group by language;
 
-- g. Crie uma view que mostre a quantidade de países em cada um dos regimes governamentais.
create view governos
as
select GovernmentForm, count(GovernmentForm) as Quantidade 
from country
group by GovernmentForm;

-- h. Crie uma view que mostre a quantidade da população mundial;
create view populacaoMundial
as
select sum(population) from country;

-- i. Crie uma view que mostre cada um dos países e seu tamanho territorial;
create view tamanhoTerritorial
as
select Name, SurfaceArea from country;

-- j. Crie uma view que mostre a soma do tamanho territorial
create view somaTerritorial
as
select sum(SurfaceArea) from country;

-- quantidade de falantes de cada idioma
create view linguasPorPais
as
select cl.language, sum(c.population) from country c 
inner join countrylanguage cl
on c.Code = cl.CountryCode
group by cl.Language;

-- k. Crie uma view parecida com a anterior, porém, exiba somente a que população menor que 10 mil;
create view linguasPorPaisMenorQueDezMil
as
select cl.language, sum(c.population) from country c 
inner join countrylanguage cl
on c.Code = cl.CountryCode
where c.population < 10000
group by cl.Language;

