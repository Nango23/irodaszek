ALTER SESSION SET CURRENT_SCHEMA=chair_manager;

prompt inserting into_ talp...

insert into talp (talp_neve, ar)
values ('Fix talp', 5000);
insert into talp (talp_neve, ar)
values ('Gurul�s talp', 8000);
insert into talp (talp_neve, ar)
values ('Gurul�s talp f�kkel', 10000);
insert into talp (talp_neve, ar)
values ('Csap�gyas gorul�s talp f�kkel', 15000);
insert into talp (talp_neve, ar)
values ('L�gy anyaggal bevont csap�gyas gurul�s talp f�kkel', 18000);
insert into talp (talp_neve, ar)
values ('L�gy anyaggal bevont gurul�s talp', 10000);
insert into talp (talp_neve, ar)
values ('L�gy anyaggal bevont gurul�s talp f�kkel', 13000);

commit;

prompt inserting into_ ules...

insert into ules (ules_neve, ar)
values ('BASIC habszivacsos �l�s', 1000);
insert into ules (ules_neve, ar)
values ('Mem�rihabos �l�s', 2000);
insert into ules (ules_neve, ar)
values ('ELASTIC 20%-al forma tart�bb habszivacsos �l�s', 5000);
insert into ules (ules_neve, ar)
values ('Hideghab szivacsos �l�s', 2000);
insert into ules (ules_neve, ar)
values ('L�g�tereszt�, izzad�st g�tl� habszivacsos �l�s', 8000);
insert into ules (ules_neve, ar)
values ('ZDO 43 40%-al s�r�bb/tart�sabb habszivacsos �l�s', 10000);
insert into ules (ules_neve, ar)
values ('BLO 50 60%-al s�r�bb/tart�sabb habszivacsos �l�s', 15000);
insert into ules (ules_neve, ar)
values ('ORG 78 100%-al s�r�bb/tart�sabb habszivacsos �l�s', 20000);
insert into ules (ules_neve, ar)
values ('KFE 60 60%-al s�r�bb/tart�sabb habszivacsos �l�s, gerincf�jdalmakra', 25000);

commit;

prompt inserting into_ hattamla...

insert into hattamla (hattamla_neve, ar)
values ('Gamer', 7000);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-1 (60 cm, S forma)', 10000);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-2 (70 cm, S forma)', 12500);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-1 (60 cm, S forma) fejt�ml�val',14000);
insert into hattamla (hattamla_neve, ar)
values ('Ergonomikus-2 (70 cm, S forma) fejt�ml�val', 16000);
insert into hattamla (hattamla_neve, ar)
values ('Teljes der�k �s h�t ergonomia (k�t oldal� der�k t�masz, �s S forma a h�tnak)', 22000);
insert into hattamla (hattamla_neve, ar)
values ('Teljes der�k �s h�t ergonomia fejt�ml�val (k�t oldal� der�k t�masz, �s S forma a h�tnak)', 27500);

commit;

prompt inserting into_ funkcionalitas...

insert into funkcionalitas (funkcio_neve, ar)
values ('�ll�that� �l�sm�lys�g', 5000);
insert into funkcionalitas (funkcio_neve, ar)
values ('�ll�that� karfa', 3000);
insert into funkcionalitas (funkcio_neve, ar)
values ('D�nthet� �l�s', 6000);
insert into funkcionalitas (funkcio_neve, ar)
values ('D�nthet� h�tt�mla', 5000);

commit;
prompt inserting into_ ugyfel...

insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Kebles','Anna','keblemre@gmail.com');
insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Horv�th','Csaba','hotvath.csaba@gmail.com');
insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Kiss','Tam�s','kiss.tamas@gmail.com');
insert into ugyfel (vezetek_nev, kereszt_nev, email)
values ('Kov�cs','J�nos','kovacs.janos@gmail.com');

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


