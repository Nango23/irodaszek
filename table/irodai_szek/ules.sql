PROMPT Creating ules...

CREATE TABLE ules(
ules_id                    NUMBER        NOT NULL PRIMARY KEY
,ules_neve                 VARCHAR2(300) NOT NULL
,ar                        number        NOT NULL
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   NUMBER
);

COMMENT ON TABLE ules IS 'Létezõ összes irdoaiszékhez illeszhetõ ülés listája.';
COMMENT ON COLUMN ules.ules_neve IS 'Ülés neve';
COMMENT ON COLUMN ules.ar IS 'Ülés ára Ft-ban';
COMMENT ON COLUMN ules.mod_user IS 'A rekordot létrehozó user';
COMMENT ON COLUMN ules.created_on IS 'Rekord lérehozásának dátuma';
COMMENT ON COLUMN ules.last_mod IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN ules.DML_FLAG IS 'Utolsó végrehajtott mûvelet';
COMMENT ON COLUMN ules.VERSION IS 'Verzió';

PROMPT Done.

