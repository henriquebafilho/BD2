create table cliente (
	cod_cliente integer not null auto_increment,
    nome varchar(200) not null,
    endereco varchar(400) not null,
    cidade varchar (100) not null,
    cep varchar(8) not null,
    uf varchar(2) not null,
    telefone varchar(15) not null,
    primary key(cod_cliente)
);

create table vendedor (
	vendedor_id integer not null auto_increment,
    nome varchar(200) not null,
    salario float not null,
    faixa_comissao float not null,
    primary key (vendedor_id)
);

create table produto (
	produto_cod integer not null auto_increment,
    unidade varchar(50) not null,
    descricao varchar(400),
    valor_unitario float not null,
    primary key (produto_cod)
);

create table pedido (
	numero_ped integer not null auto_increment,
    cliente_id integer not null,
    vendedor_id integer not null,
    prazo_entrega integer not null,
    primary key (numero_ped),
    foreign key (cliente_id) references cliente (cod_cliente),
    foreign key (vendedor_id) references vendedor (vendedor_id)
);

create table item_pedido (
	numero_ped integer not null,
    produto_cod integer not null,
    quantidade integer not null,
    primary key (numero_ped, produto_cod),
    foreign key (numero_ped) references pedido (numero_ped),
    foreign key (produto_cod) references produto (produto_cod)
);

