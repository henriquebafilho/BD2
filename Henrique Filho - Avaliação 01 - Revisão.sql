-- a. Recupere os dados das CIDADES (city) que tenham o país (country) como 'Brazil'.
SELECT c.city_id, c.city, c.country_id, c.last_update
FROM city c, country p
WHERE c.country_id = p.country_id
AND p.country = 'Brazil';

-- b. Recupere os dados dos clientes de fora do do Brazil.
select c.customer_id, c.store_id, c.first_name, c.last_name, c.email, c.address_id, c.active, c.create_date, c.last_update
from customer c
	inner join address a
    on a.address_id = c.address_id
		inner join city b
        on b.city_id = a.city_id
			inner join country p
            on (p.country_id = b.country_id and country != 'Brazil');

-- c. Recupere os dados dos filmes mais antigos (ano).
select * 
from film
where release_year <= 2006;

-- d. Recupere os dados de um filme (film) da categoria (category) 'Sport'.
select min(f.film_id), f.title, f.description, f.release_year, f.language_id, f.original_language_id,
f.rental_duration, f.rental_rate, f.length, f.replacement_cost, f.rating, f.special_features, f.last_update
from film f
	inner join film_category fc
    on f.film_id = fc.film_id
		inner join category c
        on (fc.category_id = c.category_id and c.name = 'Sports');
        
-- e. Recupere a quantidade de filmes (film) que possuam avaliação (rating) 'G' e que tenha taxa de aluguel (rental_rate) maior que 2 e menor que 4.
select count(*) from film
where rating = 'G' 
and rental_rate between 2 and 4; 

-- f. Recupere as cidades (city) ordenadas pelo nome (name) no qual o país (country) seja Argentina.
select c.city from city c 
inner join country p 
on p.country_id = c.country_id and p.country = 'Argentina'
order by c.city;

-- g. Recupere o nome do país (country) e a quantidade de cidades (city) que cada um possui.
select p.country, count(c.city) as qtdCidades from country p
inner join city c 
on c.country_id = p.country_id
group by p.country;

-- h. Retorne o nome completo do ator (actor - first_name e last_name) e a quantidade de filmes (film) que o mesmo atuou. Dica: Use a função concat ('String 1', 'String 2', 'String 3').
select concat(a.first_name, " ", a.last_name) as ator, count(f.film_id) as qtdFilmes from actor a
inner join film_actor fa
on fa.actor_id = a.actor_id
	inner join film f
    on f.film_id = fa.film_id
    group by a.first_name;

-- i. Recupere os nomes das categorias (category) e a quantidade de filmes da categoria, no qual a quantidade de filmes seja maior de 65.
select c.name, count(f.film_id) as qtdFilme from category c
inner join film_category fc 
on c.category_id = fc.category_id
	inner join film f 
    on f.film_id = fc.film_id
    group by c.name
    having qtdFilme > 65;

-- j. Recupere o nome do filme (filme), categoria (category) e atores (actor – nome completo) e ordene pelo título do filme. Dica: Use a função concat('String 1', 'String 2', 'String 3').
select f.title, c.name as Categoria, concat(a.first_name, " ", a.last_name) as Nome from film f
inner join film_actor fa
on fa.film_id = f.film_id
	inner join film_category fc
    on fc.film_id = fa.film_id
		inner join category c 
        on fc.category_id = c.category_id
			inner join actor a
            on a.actor_id = fa.actor_id
            order by f.title;
