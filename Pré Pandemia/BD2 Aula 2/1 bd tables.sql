create table LOCALIZACAO (
id integer,
nome VARCHAR(120) NOT NULL,
rua VARCHAR(80) NOT NULL,
cidade varchar(80),
cep VARCHAR(9),
ponto_referencia VARCHAR(255),
capacidade integer NOT NULL,
primary key(id)
) ENGINE = innodb;

create table PALESTRA(
id integer,
data_hora datetime not null,
titulo varchar(80) not null,
local_fk integer,
descricao varchar(255),
duracao_total integer,
valor float not null,
primary key(id)
) ENGINE = innodb;

create table EVENTO(
palestra_fk integer,
palestrante_fk integer,
duracao integer not null
) ENGINE = innodb;

create table PALESTRANTE(
id integer,
nome varchar(120) not null,
cpf varchar(11),
profissao varchar(80) not null,
formacao varchar(80),
email varchar(80),
telefone varchar(15),
primary key(id)
) ENGINE = innodb;

create table INSCRICAO(
participante_fk integer,
palestra_fk integer,
forma_pagamento integer not null
) ENGINE = innodb;

create table PARTICIPANTE(
id integer,
nome varchar(120) not null,
cpf varchar(11),
endereco varchar(120) not null,
email varchar(80) not null,
telefone varchar(15),
primary key(id)
) ENGINE = innodb;

alter table palestra
add foreign key (local_fk)
references localizacao(id);

alter table evento
add foreign key (palestra_fk)
references palestra(id);

alter table evento
add foreign key (palestrante_fk)
references palestrante(id);

alter table inscricao
add foreign key (participante_fk)
references participante(id);

alter table inscricao
add foreign key (palestra_fk)
references palestra(id);