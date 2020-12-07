-- a)
select c.first_name, c.last_name, a.first_name, a.last_name
from customer c
left join actor a
on c.first_name = a.first_name
and c.last_name = a.last_name;

-- b)
select c.first_name, c.last_name, a.first_name, a.last_name
from customer c
right join actor a
on c.first_name = a.first_name
and c.last_name = a.last_name;

-- c)
select c.first_name, c.last_name, a.first_name, a.last_name
from costumer c
inner join actor a
on c.last_name = a.last_name;

-- d)
select c.city, c.country_id
from city c
left join pais p
on c.country_id = p.country_id;

-- e)
select f.title, f.description, f.release_year, f.language_id
from film f
left join language l
on f.language_id = l.language_id;

-- f)
select s.first_name, s.last_name, a.address, a.district, a.postal_code, c.city
from staff s
inner join address a 
on s.address_int = a.address_id
inner join city c
on a.city_id = c.city_id;