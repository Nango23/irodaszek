/*Audit szint? triggerek l?trehoz?sa*/
create or replace trigger funkcio_irodaiszek_trg
  BEFORE INSERT OR UPDATE ON  funkcio_irodaiszek
  FOR EACH ROW
DECLARE
 v_irodaiszek_n number;
 v_funkcio_n number;
BEGIN
  Select Count(*) into v_irodaiszek_n from irodaiszek i where i.irodaiszek_id = :new.irodaiszek_id;
  Select Count(*) into v_funkcio_n from funkcionalitas f where f.funkcio_id = :new.funkcio_id;

  IF :new.irodaiszek_id is null THEN 
     raise_application_error(-20001,'Az irodaiszek azonositoja kotelezo!');
  END IF;
  
  IF :new.funkcio_id is null THEN 
     raise_application_error(-20001,'A funkcio azonositoja kotelezo!');
  END IF;
  
  IF v_irodaiszek_n = 0 THEN 
     raise_application_error(-20001,'Nincs ilyen irodaiszek az adatbazisban!');
  END IF;
  
  IF v_funkcio_n = 0 THEN 
     raise_application_error(-20001,'Nincs ilyen funkcio az adatbazisban!');
  END IF;
  
  IF inserting
   THEN
     if :new.audit_id is null then
      :new.audit_id := funkcio_irodaiszek_audit_seq.nextval;
     end if;  
   
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
CREATE OR REPLACE TRIGGER funkcio_irodaiszek_audit_trg
  AFTER INSERT OR UPDATE OR DELETE ON funkcio_irodaiszek
  FOR EACH ROW
DECLARE
  v_mod_user funkcio_irodaiszek_audit.mod_user%TYPE;
  v_mod_time funkcio_irodaiszek_audit.last_mod%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO funkcio_irodaiszek_audit
      (funkcio_id
      ,irodaiszek_id
      ,audit_id
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:old.funkcio_id
      ,:old.irodaiszek_id
      ,:old.audit_id
      ,v_mod_user
      ,:old.created_on
      ,v_mod_time
      ,'D'
      ,:old.version + 1);
  ELSE
    INSERT INTO funkcio_irodaiszek_audit
      (funkcio_id
      ,irodaiszek_id
      ,audit_id
      ,mod_user
      ,created_on
      ,last_mod
      ,dml_flag
      ,version)
    VALUES
      (:new.funkcio_id
      ,:new.irodaiszek_id
      ,:new.audit_id
      ,:new.mod_user
      ,:new.created_on
      ,:new.last_mod
      ,:new.dml_flag
      ,:new.version);
  END IF;
END;
/
