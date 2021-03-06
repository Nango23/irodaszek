PROMPT Creating irodaiszek...
CREATE TABLE irodaiszek(
irodaiszek_id              NUMBER        NOT NULL PRIMARY KEY
,hattamla_id               NUMBER        NOT NULL
,talp_id                   NUMBER        NOT NULL
,ules_id                   NUMBER        NOT NULL
,ar                        NUMBER        NOT NULL
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   NUMBER
);

ALTER TABLE irodaiszek
ADD CONSTRAINT fk_hattamla FOREIGN KEY (hattamla_id) REFERENCES hattamla(hattamla_id);
ALTER TABLE irodaiszek
ADD CONSTRAINT fk_talp FOREIGN KEY (talp_id) REFERENCES talp(talp_id)
ALTER TABLE irodaiszek
ADD CONSTRAINT fk_ules FOREIGN KEY (ules_id) REFERENCES ules(ules_id)

/*T?telezz?k fel, hogy v?gtelensz?m? var?ci? lehets?ges, ?gy csak akkor ?rdemes egy adott 
konfigur?ci?ra rekordot l?trehozni ha az ?gyf?l m?g nem hozott l?tre ilyen fajta vari?nst/p?ld?nyt*/
COMMENT ON TABLE irodaiszek IS 'Az ?gyf?l ?lltal ?sszekonfigur?lt ?sszes irodaisz?k ?sszes?t? t?bl?zata';
COMMENT ON COLUMN irodaiszek.hattamla_id IS 'Hattamla azonosit?';
COMMENT ON COLUMN irodaiszek.talp_id IS 'Talp azonosit?';
COMMENT ON COLUMN irodaiszek.ules_id IS '?l?r?sz azonosito';
COMMENT ON COLUMN irodaiszek.mod_user IS 'A rekordot l?trehoz? user';
COMMENT ON COLUMN irodaiszek.created_on IS 'Rekord l?rehoz?s?nak d?tuma';
COMMENT ON COLUMN irodaiszek.last_mod IS 'Utols? m?dos?t?s d?tuma';
COMMENT ON COLUMN irodaiszek.DML_FLAG IS 'Utols? v?grehajtott m?velet';
COMMENT ON COLUMN irodaiszek.VERSION IS 'Verzi?';

PROMPT Done.
