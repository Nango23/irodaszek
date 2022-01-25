/*Irodaiszékekhez tartozó ezsközök listája és ára*/
create or replace view irodaiszek_view as
  Select i.irodaiszek_id,h.hattamla_neve,h.ar as hattamla_ar,u.ules_neve,u.ar as ules_ar,t.talp_neve,t.ar as talp_ar from irodaiszek i 
  inner join hattamla h on h.hattamla_id = i.hattamla_id
  inner join ules u on u.ules_id = i.ules_id
  inner join talp t on t.talp_id = i.talp_id;
/
/*Ügyfelekhez tartozó rendelt irodaiszékek*/
create or replace view rendelesek_view as
  Select i.irodaiszek_id,u.kereszt_nev,u.email,i.ar from rendeles_irodaiszek ri 
  inner join irodaiszek i on i.irodaiszek_id = ri.irodaiszek_id_e
  inner join rendeles r on r.rendeles_id = ri.rendeles_id_e
  inner join ugyfel u on u.ugyfel_id = r.ugyfel_id;
/
/*Ügyfelekhez tartozó rendelések össz ára*/
create or replace view rendelesek_view as
  Select u.ugyfel_id, sum(i.ar) as rendelesek_ossz_ara from rendeles_irodaiszek ri 
  inner join irodaiszek i on i.irodaiszek_id = ri.irodaiszek_id_e
  inner join rendeles r on r.rendeles_id = ri.rendeles_id_e
  inner join ugyfel u on u.ugyfel_id = r.ugyfel_id
  group by r.rendeles_id,u.ugyfel_id;
/

