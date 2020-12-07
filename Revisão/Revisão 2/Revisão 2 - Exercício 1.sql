insert into empresa values (1, 'Gol');
insert into empresa values (2, 'Latam');
insert into empresa values (3, 'Lamia');
insert into empresa values (4, 'Air France');
insert into empresa values (5, 'Quatar Airways');

insert into voo values (1, 5);
insert into voo values (2, 4);
insert into voo values (3, 3);
insert into voo values (4, 2);
insert into voo values (5, 1);

insert into trecho values ('Rio de Janeiro', 'São Paulo', 350);
insert into trecho values ('São Paulo', 'Rio de Janeiro', 350);
insert into trecho values ('Oiapoque', 'Chuí', 1456);
insert into trecho values ('Juiz de Fora', 'Paris', 9064);
insert into trecho values ('Helsinque', 'Chicago', 7126);

insert into aviao values (1, 2, 'Boeing', 500);
insert into aviao values (2, 5, 'Jatinho', 30);
insert into aviao values (3, 3, 'Boeing', 400);
insert into aviao values (4, 1, 'Jatinho', 50);
insert into aviao values (5, 4, 'Boeing', 350);

insert into rota values (1, 'Helsinque', 'Chicago', 2, '2020-05-19 19:25:34', '2020-05-20 03:45:25');
insert into rota values (2, 'Juiz de Fora', 'Paris', 3, '2020-08-31 04:35:56', '2020-09-01 00:25:36');
insert into rota values (3, 'Oiapoque', 'Chuí', 4, '2020-11-21 09:15:46', '2020-11-21 16:02:39');
insert into rota values (4, 'São Paulo', 'Rio de Janeiro', 5, '2020-12-31 23:00:00', '2021-01-01 00:00:00');
insert into rota values (5, 'Rio de Janeiro', 'São Paulo', 1, '2020-07-23 19:25:34', '2020-07-23 20:25:34');

insert into viagem values (2, '2020-08-31', 3, '2020-08-31 04:35:56', '2020-09-01 00:25:36');
insert into viagem values (1, '2020-05-19', 1, '2020-05-19 19:25:34', '2020-05-20 03:45:25');
insert into viagem values (3, '2020-11-21', 2, '2020-11-21 09:15:46', '2020-11-21 16:02:39');
insert into viagem values (5, '2020-07-23', 4, '2020-07-23 19:25:34', '2020-07-23 20:25:34');
insert into viagem values (4, '2020-12-31', 5, '2020-12-31 23:00:00', '2021-01-01 00:00:00');