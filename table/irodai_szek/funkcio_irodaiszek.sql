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

/*Egy irodaisz�khez t�bb funkci� tartozhat.*/
COMMENT ON TABLE funkcio_irodaiszek IS 'Irodaisz�kekhez tartoz� funkci�k';
COMMENT ON COLUMN funkcio_irodaiszek.funkcio_id IS 'Funkci� azonos�t�ja';
COMMENT ON COLUMN funkcio_irodaiszek.audit_id IS 'Audit id azonos�t�ja';
COMMENT ON COLUMN funkcio_irodaiszek.irodaiszek_id IS 'Irodaisz�k azonos�t�ja';
COMMENT ON COLUMN funkcio_irodaiszek.mod_user IS 'A rekordot l�trehoz� user';
COMMENT ON COLUMN funkcio_irodaiszek.created_on IS 'Rekord l�rehoz�s�nak d�tuma';
COMMENT ON COLUMN funkcio_irodaiszek.last_mod IS 'Utols� m�dos�t�s d�tuma';
COMMENT ON COLUMN funkcio_irodaiszek.DML_FLAG IS 'Utols� v�grehajtott m�velet';
COMMENT ON COLUMN funkcio_irodaiszek.VERSION IS 'Verzi�';

PROMPT Done.
