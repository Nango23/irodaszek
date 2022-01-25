/*Audit szintû triggerek létrehozása*/
create or replace trigger ugyfel_trg
  BEFORE INSERT OR UPDATE ON ugyfel
  FOR EACH ROW
DECLARE 
  v_is_valid_email boolean;
  e_email EXCEPTION;
  PRAGMA exception_init( e_email, -20001 );
BEGIN
  v_is_valid_email := REGEXP_LIKE (:new.email,
                   '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');
                   
  IF (NOT v_is_valid_email) THEN 
     raise_application_error(-20001,'Helytelen formatum: email, Pelda: valami@valami.com');
  END IF;

  IF inserting
   THEN
    IF :new.ugyfel_id IS NULL
     THEN
      :new.ugyfel_id := ugyfel_seq.nextval;
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
CREATE OR REPLACE TRIGGER ugyfel_audit_trg
  AFTER INSERT OR UPDATE OR DELETE ON ugyfel
  FOR EACH ROW
DECLARE
  v_mod_user ugyfel_audit.mod_user%TYPE;
  v_mod_time ugyfel_audit.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO ugyfel_audit
      (ugyfel_id
      ,vezetek_nev
      ,kereszt_nev
      ,email
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:old.ugyfel_id
      ,:old.vezetek_nev
      ,:old.kereszt_nev
      ,:old.email
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO ugyfel_audit
      (ugyfel_id
      ,vezetek_nev
      ,kereszt_nev
      ,email
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:new.ugyfel_id
      ,:new.vezetek_nev
      ,:new.kereszt_nev
      ,:new.email
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
