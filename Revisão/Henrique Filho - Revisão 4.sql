-- a)
select P.titulo 
from palestra P
where P.local_fk in
	(select L.id 
	from localizacao L 
	where L.cidade = 'Niterói');

-- b)
select A.nome, A.cpf 
from participante A
where A.id in 
	(select B.participante_fk
	from inscricao B
	where B.palestra_fk in
		(select C.local_fk 
		from palestra C
		where C.local_fk in
			(select D.id 
			from localizacao D 
			where D.cidade = 'Niterói')));

-- c)
select cidade, sum(capacidade) 
from localizacao;

-- d)
select cidade, sum(capacidade)
from localizacao
where capacidade < 3000;

-- e)
select P.titulo 
from palestra P
where P.local_fk in
	(select L.id 
	from localizacao L 
	where L.cidade = 'Niterói') and
	P.duracao_total >= 80;