PROMPT Creating FUNKCIONALITAS...
CREATE TABLE funkcionalitas(
funkcio_id                 NUMBER        NOT NULL PRIMARY KEY
,funkcio_neve              VARCHAR2(40)  NOT NULL
,ar                        NUMBER        NOT NULL    
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);

COMMENT ON TABLE  funkcionalitas IS 'Az irodaiszékek funkcionalitását írja le/ergonomikusságát.';
COMMENT ON COLUMN funkcionalitas.funkcio_neve IS 'Az adott funkcionalitás neve';
COMMENT ON COLUMN funkcionalitas.ar IS 'Az adott funkcionalitás ára';
COMMENT ON COLUMN funkcionalitas.mod_user IS 'A rekordot létrehozó user';
COMMENT ON COLUMN funkcionalitas.created_on IS 'Rekord lérehozásának dátuma';
COMMENT ON COLUMN funkcionalitas.last_mod IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN funkcionalitas.DML_FLAG IS 'Utolsó végrehajtott mûvelet';
COMMENT ON COLUMN funkcionalitas.VERSION IS 'Verzió';

PROMPT Done.
