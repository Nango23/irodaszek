PROMPT Installing DB...
PROMPT Creating user CHAIR_MANAGER...

----------------------------------
-- 1. Create user, add grants   --
----------------------------------
declare
  cursor cur is
    select 'alter system kill session ''' || sid || ',' || serial# || '''' as command
      from v$session
     where username = 'CHAIR_MANAGER';
begin
  for c in cur loop
    EXECUTE IMMEDIATE c.command;
  end loop;
end;
/

DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM dba_users t WHERE t.username='CHAIR_MANAGER';
  IF v_count = 1 THEN 
    EXECUTE IMMEDIATE 'DROP USER chair_manager CASCADE';
  END IF;
END;
/
CREATE USER chair_manager
  IDENTIFIED BY "oracle" 
  DEFAULT TABLESPACE users
  QUOTA UNLIMITED ON users
;

grant CREATE TRIGGER to chair_manager;
GRANT CREATE SESSION TO chair_manager;
GRANT CREATE TABLE TO chair_manager;
GRANT CREATE VIEW TO chair_manager;
GRANT CREATE SEQUENCE TO chair_manager;
GRANT CREATE PROCEDURE TO chair_manager;
grant create type to chair_manager;

ALTER SESSION SET CURRENT_SCHEMA=chair_manager;

PROMPT Done.

-- Esetleg instlall logolás

PROMPT Installing sequences...
-- Install sequences
@./table/sequences.sql

PROMPT Installing tables...
-- Install tables
@./table/ugyfel/ugyfel.sql
@./table/irodai_szek/funkcionalitas.sql
@./table/irodai_szek/hattamla.sql
@./table/irodai_szek/talp.sql
@./table/irodai_szek/ules.sql
@./table/irodai_szek/irodaiszek.sql
@./table/irodai_szek/rendeles.sql
@./table/irodai_szek/funkcio_irodaiszek.sql
@./table/irodai_szek/rendeles_irodaiszek.sql
@./table/audit/Audit.sql

-- Install types

-- Packes
PROMPT Installing views...
-- Views
@./view/views.sql
PROMPT Installing triggers...
-- Triggers
PROMPT Installing funkcio_irodaiszek_trg...
@./triggers/funkcio_irodaiszek_trg.trg
PROMPT Installing funkcionalitas_trg...
@./triggers/funkcionalitas_trg.trg
PROMPT Installing hattamla_trg...
@./triggers/hattamla_trg.trg
PROMPT Installing irodaiszek_trg...
@./triggers/irodaiszek_trg.trg
PROMPT Installing rendeles_irodaiszek_trg...
@./triggers/rendeles_irodaiszek_trg.trg
PROMPT Installing rendeles_trg...
@./triggers/rendeles_trg.trg
PROMPT Installing talp_trg...
@./triggers/talp_trg.trg
PROMPT Installing ugyfel_trg...
@./triggers/ugyfel_trg.trg
PROMPT Installing ules_trg...
@./triggers/ules_trg.trg

PROMPT Installing inserts...
--inserts
@./table/inserts.sql

-- Recompile schema
/*BEGIN
  dbms_utility.compile_schema(schema => 'chair_manager');
END;
/*/

-- FK
-- Tabla data
PROMPT Done.
