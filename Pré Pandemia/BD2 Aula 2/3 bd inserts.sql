use `database`;

insert into localizacao
(id, nome, rua, cidade, cep, ponto_referencia, capacidade)
values
(null,'Teatro Municipal', 'Praça Floriano', 'Rio de Janeiro', '20031050', 'Cinelândia', 2300);

insert into participante
(id, nome, cpf, endereco, email, telefone)
values
(null, 'Serginho Malandro', '12345678910', 'SBT São Paulo', 'serginhomalandro@gmail.com', '25696969');

insert into palestrante
(id, nome, cpf, profissao, formacao, email, telefone)
values
(null, 'Silvio Santos', '01987654321', 'Apresentador', 'Superior Completo', 'silviosantos@sbt.com.br', '40028922'); 

insert into palestra 
(id, data_hora, titulo, local_fk, descricao, duracao_total, valor)
values
(null, '2020-03-21', 'O Cara da Telesena', 1, 'Como Silvio Santos ficou rico', 120, 100.0);

insert into evento
(palestra_fk, palestrante_fk, duracao)
values
(1, 1, 120);

insert into inscricao
(participante_fk, palestra_fk, forma_pagamento)
values
(1, 1, 1);