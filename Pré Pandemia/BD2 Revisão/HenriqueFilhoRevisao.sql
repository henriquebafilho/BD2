/*evento*/
insert into evento
(palestra_fk, palestrante_fk, duracao)
values
(2, 2, 180);

update evento
set duracao = 120
where duracao > 120;

update evento
set duracao = 180
where palestrante_fk = 2;

insert into evento
(palestra_fk, palestrante_fk, duracao)
values
(2, 1, 53);

delete from evento
where palestra_fk = 2 and
palestrante_fk = 1;

/*inscricao*/
insert into inscricao
(participante_fk, palestra_fk, forma_pagamento)
values
(2, 2, 1);

update inscricao
set forma_pagamento = 2
where participante_fk = 2;

insert into inscricao
(participante_fk, palestra_fk, forma_pagamento)
values
(3, 1, 3);

update inscricao
set palestra_fk = 3 
where participante_fk = 3;

delete from inscricao 
where participante_fk = 3;

/*localizacao*/
insert into localizacao
(id, nome, rua, cidade, cep, ponto_referencia, capacidade)
values
(null,'Maracanã', 'Avenida Maracanã', 'Rio de Janeiro', '20271130', 'Metrô Maracanã', 78838);

insert into localizacao
(id, nome, rua, cidade, cep, ponto_referencia, capacidade)
values
(null,'Kinoplex Tijuca', 'Avenida Maracanã', 'Rio de Janeiro', '88889999', 'Em frente ao Rio Maracanã', 200);

update localizacao
set capacidade = 100000
where id = 2;

insert into localizacao
(id, nome, rua, cidade, cep, ponto_referencia, capacidade)
values
(null,'Casa muito engraçada', 'Rua dos Bobos nº 0', 'Belo Horizonte', '00000000', 'Também não tem ponto de referência', 0);

delete from localizacao
where id = 4;

/*palestra*/
insert into palestra 
(id, data_hora, titulo, local_fk, descricao, duracao_total, valor)
values
(null, '2020-08-31', 'Filme do Pelé pt.2', 2, 'Pelé tenta se redmir após seu filme ser taxado com chato', 120, 50.0);

insert into palestra 
(id, data_hora, titulo, local_fk, descricao, duracao_total, valor)
values
(null, '2020-09-11', 'Parasita 2', 3, 'Personagens do filme Parasita agora declaram guerra aos EUA', 124, 35.0);

update palestra 
set valor = 10.0
where valor >= 30.0;

delete from palestra
where duracao_total > 120;

update palestra
set duracao_total = 90
where id = 2;

/*palestrante*/
insert into palestrante
(id, nome, cpf, profissao, formacao, email, telefone)
values
(null, 'Pelé', '01987654321', 'Ex-jogador de futebol', 'Formado em ganhar Copa do Mundo', 'pele@brasil.com', '40028922'); 

insert into palestrante
(id, nome, cpf, profissao, formacao, email, telefone)
values
(null, 'Mauricio', '17117117117', 'Coach Quantico', 'Formado em fisica quantica', 'mauricio@coach.com', '25691711'); 

update palestrante
set telefone = '10101010'
where nome = 'Pelé';

delete from palestrante
where id = 3;

insert into palestrante
(id, nome, cpf, profissao, formacao, email, telefone)
values
(null, 'Galvão Bueno', '12365478901', 'Narrador', 'Comunicação', 'galvao@bueno.com', '55554444'); 

/*participante*/
insert into participante
(id, nome, cpf, endereco, email, telefone)
values
(null, 'Neymar', '12345678910', 'Vila Belmiro (Santos-SP)', 'neymar@gmail.com', '22531177');

insert into participante
(id, nome, cpf, endereco, email, telefone)
values
(null, 'Ronaldinho Gaucho', '10101010101', 'Cadeia no Paraguai', 'ronaldinho@dibre.com', '10101010');

insert into participante
(id, nome, cpf, endereco, email, telefone)
values
(null, 'Luiza', '99999999999', 'Canada', 'luiza@canada.com', '96691221');

update participante
set endereco = 'Ja esta no Brasil'
where id = 4;

delete from participante
where nome = 'Luiza';