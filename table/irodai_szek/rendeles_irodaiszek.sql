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

COMMENT ON TABLE rendeles_irodaiszek IS 'Rendel�sekhez tartoz� irodai sz�kek';
COMMENT ON COLUMN rendeles_irodaiszek.rendeles_id_e IS 'Rendel�s azonos�t�ja';
COMMENT ON COLUMN rendeles_irodaiszek.irodaiszek_id_e IS 'Irodaisz�k azonos�t�ja';
COMMENT ON COLUMN rendeles_irodaiszek.audit_id IS 'Audit id azonos�t�ja';
COMMENT ON COLUMN rendeles_irodaiszek.mod_user IS 'A rekordot l�trehoz� user';
COMMENT ON COLUMN rendeles_irodaiszek.created_on IS 'Rekord l�rehoz�s�nak d�tuma';
COMMENT ON COLUMN rendeles_irodaiszek.last_mod IS 'Utols� m�dos�t�s d�tuma';
COMMENT ON COLUMN rendeles_irodaiszek.DML_FLAG IS 'Utols� v�grehajtott m�velet';
COMMENT ON COLUMN rendeles_irodaiszek.VERSION IS 'Verzi�';

PROMPT Done.
