PROMPT Creating talp...

CREATE TABLE talp(
talp_id                    NUMBER        NOT NULL PRIMARY KEY
,talp_neve                 VARCHAR2(300) NOT NULL
,ar                        NUMBER        NOT NULL
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   NUMBER
);

COMMENT ON TABLE talp IS 'Létezõ összes irdoaiszékhez illeszhetõ talpak listája.';
COMMENT ON COLUMN talp.talp_neve IS 'Talp neve';
COMMENT ON COLUMN talp.ar IS 'Talp ára Ft-ban';
COMMENT ON COLUMN talp.mod_user IS 'A rekordot létrehozó user';
COMMENT ON COLUMN talp.created_on IS 'Rekord lérehozásának dátuma';
COMMENT ON COLUMN talp.last_mod IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN talp.DML_FLAG IS 'Utolsó végrehajtott mûvelet';
COMMENT ON COLUMN talp.VERSION IS 'Verzió';

PROMPT Done.
