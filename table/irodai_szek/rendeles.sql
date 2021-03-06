PROMPT Creating rendeles...
CREATE TABLE rendeles(
rendeles_id                NUMBER       NOT NULL PRIMARY KEY
,ugyfel_id                 NUMBER        NOT NULL
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   NUMBER
);

--ALTER TABLE rendeles
--ADD CONSTRAINT fk_rendeles FOREIGN KEY (ugyfel_id) REFERENCES ugyfel(ugyfel_id);

COMMENT ON TABLE rendeles IS 'Az ?gyf?l ?lltal ?sszekonfigur?lt rendeles?k p?ld?nyai.';
COMMENT ON COLUMN rendeles.ugyfel_id IS '?gyf?l azonos?t?ja';
COMMENT ON COLUMN rendeles.mod_user IS 'A rekordot l?trehoz? user';
COMMENT ON COLUMN rendeles.created_on IS 'Rekord l?rehoz?s?nak d?tuma';
COMMENT ON COLUMN rendeles.last_mod IS 'Utols? m?dos?t?s d?tuma';
COMMENT ON COLUMN rendeles.DML_FLAG IS 'Utols? v?grehajtott m?velet';
COMMENT ON COLUMN rendeles.VERSION IS 'Verzi?';



PROMPT Done.
