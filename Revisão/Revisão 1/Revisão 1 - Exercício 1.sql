create table empresa (
	codemp integer not null auto_increment,
    nome varchar(200),
    primary key (codemp)
);

create table trecho (
	origem varchar(200) not null,
    destino varchar(200) not null,
    distancia integer not null,
    primary key (origem, destino)
);

create table voo (
	codvoo integer not null auto_increment,
    codemp integer not null,
    primary key (codvoo),
    foreign key (codemp) references empresa (codemp)
);

create table aviao (
	codaviao integer not null auto_increment,
    codemp integer not null,
    tipo varchar(100) not null,
    capacidade integer not null,
    primary key (codaviao),
    foreign key (codemp) references empresa (codemp)
);

create table rota (
	codrota integer not null auto_increment,
    origem varchar(200) not null,
    destino varchar(200) not null,
    codvoo integer not null,
    h_saida datetime not null,
    h_chegada datetime not null,
    primary key (codrota),
    foreign key (origem, destino) references trecho (origem, destino),
    foreign key (codvoo) references voo (codvoo)
);

create table viagem (
	codrota integer not null,
    data_voo date not null, 
    codaviao integer not null,
    h_saida_real datetime not null,
    h_chegada_real datetime not null,
    primary key (codrota),
    foreign key (codrota) references rota (codrota),
    foreign key (codaviao) references aviao (codaviao)
);