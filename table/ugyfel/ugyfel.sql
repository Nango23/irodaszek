PROMPT Creating talp...
create sequence ugyfel_seq start with 1;

CREATE TABLE ugyfel(
ugyfel_id                  NUMBER       NOT NULL PRIMARY KEY
,vezetek_nev               varchar2(30) NOT NULL
,kereszt_nev               varchar2(30) NOT NULL
,email                     varchar2(30) NOT NULL
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   NUMBER
);

COMMENT ON TABLE ugyfel IS 'Ügyfelek listája.';
COMMENT ON COLUMN ugyfel.email IS 'Ügyfél email címe.';

PROMPT Done.

PROMPT Loading tables...
ALTER SESSION SET CURRENT_SCHEMA=chair_manager;

/*prompt Loading talp...

insert into ugyfel (ugyfel_id, email, last_modified, created)
values (1, 'janos@gmail.com', SYSDATE, SYSDATE);
insert into ugyfel (ugyfel_id, email, last_modified, created)
values (2, 'adam@gmail.com', SYSDATE, SYSDATE);
insert into ugyfel (ugyfel_id, email, last_modified, created)
values (3, 'eva@gmail.com', SYSDATE, SYSDATE);
insert into ugyfel (ugyfel_id, email, last_modified, created)
values (4, 'andris@gmail.com', SYSDATE, SYSDATE);
insert into ugyfel (ugyfel_id, email, last_modified, created)
values (5, 'tamas@gmail.com', SYSDATE, SYSDATE);
insert into ugyfel (ugyfel_id, email, last_modified, created)
values (6, 'zalan@gmail.com', SYSDATE, SYSDATE);

prompt Done.
*/
