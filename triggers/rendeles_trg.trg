/*Audit szintû triggerek létrehozása*/
create or replace trigger rendeles_trg
  BEFORE INSERT OR UPDATE ON rendeles
  FOR EACH ROW
DECLARE 
  v_ugyfel NUMBER;
BEGIN
  Select count(*) into v_ugyfel from ugyfel u where u.ugyfel_id = :new.ugyfel_id;

  IF :new.ugyfel_id is null THEN 
     raise_application_error(-20001,'Az ugyfel azonositoja kotelezo!');
  END IF;
  
  IF v_ugyfel = 0 THEN 
     raise_application_error(-20001,'Nincs ilyen ugyfel az adatbazisban!');
  END IF;
  
  IF inserting
   THEN
    IF :new.rendeles_id IS NULL
     THEN
      :new.rendeles_id := rendeles_seq.nextval;
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
CREATE OR REPLACE TRIGGER rendeles_audit_trg
  AFTER INSERT OR UPDATE OR DELETE ON rendeles
  FOR EACH ROW
DECLARE
  v_mod_user rendeles_audit.mod_user%TYPE;
  v_mod_time rendeles_audit.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO rendeles_audit
      (rendeles_id
      ,ugyfel_id
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:old.rendeles_id
      ,:old.ugyfel_id
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO rendeles_audit
      (rendeles_id
      ,ugyfel_id
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:new.rendeles_id
      ,:new.ugyfel_id
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
