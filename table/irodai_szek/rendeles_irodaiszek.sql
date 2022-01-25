PROMPT Creating rendeles_irodaiszek...

CREATE TABLE rendeles_irodaiszek(
rendeles_id_e               NUMBER        NOT NULL 
,irodaiszek_id_e             NUMBER        NOT NULL
,audit_id                  NUMBER        NOT NULL
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   NUMBER
);

ALTER TABLE rendeles_irodaiszek
ADD CONSTRAINT fk_rendeles_1 FOREIGN KEY (rendeles_id_e) REFERENCES rendeles(rendeles_id);
ALTER TABLE rendeles_irodaiszek
ADD CONSTRAINT fk_irodaiszek_1 FOREIGN KEY (irodaiszek_id_e) REFERENCES irodaiszek(irodaiszek_id);

COMMENT ON TABLE rendeles_irodaiszek IS 'Rendelésekhez tartozó irodai székek';
COMMENT ON COLUMN rendeles_irodaiszek.rendeles_id_e IS 'Rendelés azonosítója';
COMMENT ON COLUMN rendeles_irodaiszek.irodaiszek_id_e IS 'Irodaiszék azonosítója';
COMMENT ON COLUMN rendeles_irodaiszek.audit_id IS 'Audit id azonosítója';
COMMENT ON COLUMN rendeles_irodaiszek.mod_user IS 'A rekordot létrehozó user';
COMMENT ON COLUMN rendeles_irodaiszek.created_on IS 'Rekord lérehozásának dátuma';
COMMENT ON COLUMN rendeles_irodaiszek.last_mod IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN rendeles_irodaiszek.DML_FLAG IS 'Utolsó végrehajtott mûvelet';
COMMENT ON COLUMN rendeles_irodaiszek.VERSION IS 'Verzió';

PROMPT Done.
