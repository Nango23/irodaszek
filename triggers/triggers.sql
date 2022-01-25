/**/
CREATE OR REPLACE TRIGGER vacc_type_trg
  BEFORE INSERT OR UPDATE ON vacc_type
  FOR EACH ROW
BEGIN
  IF inserting /*Ha beszúrás*/
  THEN
    IF :new.id IS NULL /*nem értelmezhetõ a :new delete-kor*/
    THEN
      :new.id := vacc_type_seq.nextval;
    END IF;
  
    :new.created_on := SYSDATE;
    :new.dml_flag   := 'I';
    :new.version    := 1;
  ELSE
    IF nvl(:new.dml_flag, 'U') <> 'D' /*Ha :new.dml_flag null akkor 'U'-t ad vissza-> nvl()*/
    THEN
      :new.dml_flag := 'U';
    END IF;
  
    :new.version := :old.version + 1;
  END IF;

  :new.last_mod := SYSDATE;
  :new.mod_user := sys_context('USERENV', 'OS_USER');
END;
/
