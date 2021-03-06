/*Audit szint? triggerek l?trehoz?sa*/
create or replace trigger ules_trg
  BEFORE INSERT OR UPDATE ON ules
  FOR EACH ROW
BEGIN
  IF inserting
   THEN
    IF :new.ules_id IS NULL
     THEN
      :new.ules_id := ules_seq.nextval;
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
CREATE OR REPLACE TRIGGER ules_audit_trg
  AFTER INSERT OR UPDATE OR DELETE ON ules
  FOR EACH ROW
DECLARE
  v_mod_user ules_audit.mod_user%TYPE;
  v_mod_time ules_audit.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO ules_audit
      (ules_id
      ,ules_neve
      ,ar
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:old.ules_id
      ,:old.ules_neve
      ,:old.ar
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO ules_audit
      (ules_id
      ,ules_neve
      ,ar
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:new.ules_id
      ,:new.ules_neve
      ,:new.ar
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
