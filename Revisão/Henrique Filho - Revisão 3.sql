SELECT * FROM evento INNER JOIN palestra ON evento.palestra_fk = palestra.id 
INNER JOIN localizacao ON palestra.local_fk = localizacao.id 
WHERE cidade = 'Niterói';

select * from palestrante where nome like 'M%' order by nome desc;

select * from localizacao where capacidade >= 500 and capacidade <= 1000;

select * from localizacao where (capacidade >= 500 and capacidade <= 1000) and cidade = 'Rio de Janeiro';

select * from localizacao where (capacidade < 500 and capacidade > 1000) or (cidade = 'Rio de Janeiro' or cidade = 'São Gonçalo');

select * from palestrante where (formacao = 'Superior' or profissao = 'TI') and email like '%@apple.com';

delete from participante where endereco like 'Rua Maria%' or endereco like 'Rua Alice%';

update localizacao set capacidade = capacidade * 1.3 where cidade = 'Niterói';