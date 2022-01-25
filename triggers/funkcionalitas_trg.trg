/*Audit szintû triggerek létrehozása*/
create or replace trigger funkcionalitas_trg
  BEFORE INSERT OR UPDATE ON funkcionalitas
  FOR EACH ROW
BEGIN
  IF inserting
   THEN
    IF :new.funkcio_id IS NULL
     THEN
      :new.funkcio_id := funkcionalitas_seq.nextval;
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
CREATE OR REPLACE TRIGGER funkcionalitas_audit_trg
  AFTER INSERT OR UPDATE OR DELETE ON funkcionalitas
  FOR EACH ROW
DECLARE
  v_mod_user funkcionalitas_audit.mod_user%TYPE;
  v_mod_time funkcionalitas_audit.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO funkcionalitas_audit
      (funkcio_id
      ,funkcio_neve
      ,ar
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:old.funkcio_id
      ,:old.funkcio_neve
      ,:old.ar
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO funkcionalitas_audit
      (funkcio_id
      ,funkcio_neve
      ,ar
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:new.funkcio_id
      ,:new.funkcio_neve
      ,:new.ar
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
