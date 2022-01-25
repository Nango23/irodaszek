/*Audit szintû triggerek létrehozása*/
create or replace trigger irodaiszek_trg
  BEFORE INSERT OR UPDATE ON irodaiszek
  FOR EACH ROW
DECLARE
 v_hattamla_n number;
 v_ules_n number;
 v_talp_n number;
BEGIN
  Select Count(*) into v_hattamla_n from hattamla h where h.hattamla_id = :new.hattamla_id;
  Select Count(*) into v_ules_n from ules u where u.ules_id = :new.ules_id;
  Select Count(*) into v_talp_n from talp t where t.talp_id = :new.talp_id;

  IF :new.hattamla_id is null THEN 
     raise_application_error(-20001,'Az hattamla azonositoja kotelezo!');
  END IF;
  
  IF :new.ules_id is null THEN 
     raise_application_error(-20001,'Az ules azonositoja kotelezo!');
  END IF;
  
  IF :new.talp_id is null THEN 
     raise_application_error(-20001,'Az talp azonositoja kotelezo!');
  END IF;
  
  IF v_hattamla_n = 0 THEN 
     raise_application_error(-20001,'Nincs ilyen hattamla az adatbazisban!');
  END IF;
  
  IF v_ules_n = 0 THEN 
     raise_application_error(-20001,'Nincs ilyen ules az adatbazisban!');
  END IF;
  
  IF v_talp_n = 0 THEN 
     raise_application_error(-20001,'Nincs ilyen talp az adatbazisban!');
  END IF;

  IF inserting
   THEN

    IF :new.irodaiszek_id IS NULL
     THEN
      :new.irodaiszek_id := irodaiszek_seq.nextval;
    END IF;
  
    :new.created_on := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D'
     THEN
      :new.dml_flag := 'U';
    END IF;
  
    :new.version := :old.version + 1;
  END IF;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
end funkcionalitas_trg;
/
CREATE OR REPLACE TRIGGER irodaiszek_audit_trg
  AFTER INSERT OR UPDATE OR DELETE ON irodaiszek
  FOR EACH ROW
DECLARE
  v_mod_user irodaiszek_audit.mod_user%TYPE;
  v_mod_time irodaiszek_audit.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO irodaiszek_audit
      (irodaiszek_id
      ,hattamla_id
      ,talp_id
      ,ules_id
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:old.irodaiszek_id
      ,:old.hattamla_id
      ,:old.talp_id
      ,:old.ules_id
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO irodaiszek_audit
      (irodaiszek_id
      ,hattamla_id
      ,talp_id
      ,ules_id
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:new.irodaiszek_id
      ,:new.hattamla_id
      ,:new.talp_id
      ,:new.ules_id
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
