ALTER SESSION SET CURRENT_SCHEMA=chair_manager;

prompt inserting into_ talp...

insert into talp (talp_neve, ar)
values ('Fix talp', 5000);
insert into talp (talp_neve, ar)
values ('Gurulós talp', 8000);
insert into talp (talp_neve, ar)
values ('Gurulós talp fékkel', 10000);
insert into talp (talp_neve, ar)
values ('Csapágyas gorulós talp fékkel', 15000);
insert into talp (talp_neve, ar)
values ('Lágy anyaggal bevont csapágyas gurulós talp fékkel', 18000);
insert into talp (talp_neve, ar)
values ('Lágy anyaggal bevont gurulós talp', 10000);
insert into talp (talp_neve, ar)
values ('Lágy anyaggal bevont gurulós talp fékkel', 13000);

commit;

prompt inserting into_ ules...

insert into ules (ules_neve, ar)
values ('BASIC habszivacsos ülés', 1000);
insert into ules (ules_neve, ar)
values ('Memórihabos ülés', 2000);
insert into ules (ules_neve, ar)
values ('ELASTIC 20%-al forma tartóbb habszivacsos ülés', 5000);
insert into ules (ules_neve, ar)
values ('Hideghab szivacsos ülés', 2000);
insert into ules (ules_neve, ar)
values ('Légáteresztõ, izzadást gátló habszivacsos ülés', 8000);
insert into ules (ules_neve, ar)
values ('ZDO 43 40%-al sûrûbb/tartósabb habszivacsos ülés', 10000);
insert into ules (ules_neve, ar)
values ('BLO 50 60%-al sûrûbb/tartósabb habszivacsos ülés', 15000);
insert into ules (ules_neve, ar)
values ('ORG 78 100%-al sûrûbb/tartósabb habszivacsos ülés', 20000);
insert into ules (ules_neve, ar)
values ('KFE 60 60%-al sûrûbb/tartósabb habszivacsos ülés, gerincfájdalmakra', 25000);

commit;

prompt inserting into_ hattamla...

insert into hattamla (hattamla_neve, ar)
values ('Gamer', 7000);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-1 (60 cm, S forma)', 10000);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-2 (70 cm, S forma)', 12500);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-1 (60 cm, S forma) fejtámlával',14000);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-2 (70 cm, S forma) fejtámlával', 16000);
insert into hattamla (hattamla_neve, ar)
values ('Teljes derék és hát ergonomia (két oldalú derék támasz, és S forma a hátnak)', 22000);
insert into hattamla (hattamla_neve, ar)
values ('Teljes derék és hát ergonomia fejtámlával (két oldalú derék támasz, és S forma a hátnak)', 27500);

commit;

prompt inserting into_ funkcionalitas...

insert into funkcionalitas (funkcio_neve, ar)
values ('Állítható ülésmélység', 5000);
insert into funkcionalitas (funkcio_neve, ar)
values ('Állítható karfa', 3000);
insert into funkcionalitas (funkcio_neve, ar)
values ('Dönthetõ ülés', 6000);
insert into funkcionalitas (funkcio_neve, ar)
values ('Dönthetõ háttámla', 5000);

commit;
prompt inserting into_ ugyfel...

insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Kebles','Anna','keblemre@gmail.com');
insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Horváth','Csaba','hotvath.csaba@gmail.com');
insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Kiss','Tamás','kiss.tamas@gmail.com');
insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Kovács','János','kovacs.janos@gmail.com');

commit;
prompt inserting into_ irodaiszek...

insert into irodaiszek 
(irodaiszek_id, hattamla_id,talp_id,ules_id)
values 
(1,1,1,1);
insert into irodaiszek 
(irodaiszek_id, hattamla_id,talp_id,ules_id)
values 
(2,1,1,2);
insert into irodaiszek 
(irodaiszek_id, hattamla_id,talp_id,ules_id)
values 
(3,1,1,3);
insert into irodaiszek 
(irodaiszek_id, hattamla_id,talp_id,ules_id)
values 
(4,1,1,4);

prompt inserting into_ rendeles...

insert into rendeles (rendeles_id, ugyfel_id)
values (1, 1);
insert into rendeles (rendeles_id, ugyfel_id)
values (2, 4);
insert into rendeles (rendeles_id, ugyfel_id)
values (3, 2);
insert into rendeles (rendeles_id, ugyfel_id)
values (4, 3);

prompt inserting into_ funkcio_irodaiszek...

insert into funkcio_irodaiszek (funkcio_id, irodaiszek_id)
values (1, 1);
insert into funkcio_irodaiszek (funkcio_id, irodaiszek_id)
values (2, 2);
insert into funkcio_irodaiszek (funkcio_id, irodaiszek_id)
values (3, 3);
insert into funkcio_irodaiszek (funkcio_id, irodaiszek_id)
values (3, 4);

prompt inserting into_ rendeles_irodaiszek...

insert into rendeles_irodaiszek (rendeles_id_e, irodaiszek_id_e)
values (1, 1);
insert into rendeles_irodaiszek (rendeles_id_e, irodaiszek_id_e)
values (1, 2);
insert into rendeles_irodaiszek (rendeles_id_e, irodaiszek_id_e)
values (2, 3);
insert into rendeles_irodaiszek (rendeles_id_e, irodaiszek_id_e)
values (3, 2);
insert into rendeles_irodaiszek (rendeles_id_e, irodaiszek_id_e)
values (4, 4);


