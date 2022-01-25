PROMPT Creating funkcio_irodaiszek...

CREATE TABLE funkcio_irodaiszek(
funkcio_id                 NUMBER        NOT NULL
,irodaiszek_id             NUMBER        NOT NULL
,audit_id                  NUMBER        NOT NULL      
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);

ALTER TABLE funkcio_irodaiszek
ADD CONSTRAINT fk_funkcio FOREIGN KEY (funkcio_id) REFERENCES funkcionalitas(funkcio_id)
ALTER TABLE funkcio_irodaiszek
ADD CONSTRAINT fk_irodaiszek_2 FOREIGN KEY (irodaiszek_id) REFERENCES irodaiszek(irodaiszek_id)

/*Egy irodaiszékhez több funkció tartozhat.*/
COMMENT ON TABLE funkcio_irodaiszek IS 'Irodaiszékekhez tartozó funkciók';
COMMENT ON COLUMN funkcio_irodaiszek.funkcio_id IS 'Funkció azonosítója';
COMMENT ON COLUMN funkcio_irodaiszek.audit_id IS 'Audit id azonosítója';
COMMENT ON COLUMN funkcio_irodaiszek.irodaiszek_id IS 'Irodaiszék azonosítója';
COMMENT ON COLUMN funkcio_irodaiszek.mod_user IS 'A rekordot létrehozó user';
COMMENT ON COLUMN funkcio_irodaiszek.created_on IS 'Rekord lérehozásának dátuma';
COMMENT ON COLUMN funkcio_irodaiszek.last_mod IS 'Utolsó módosítás dátuma';
COMMENT ON COLUMN funkcio_irodaiszek.DML_FLAG IS 'Utolsó végrehajtott mûvelet';
COMMENT ON COLUMN funkcio_irodaiszek.VERSION IS 'Verzió';

PROMPT Done.
