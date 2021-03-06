PROMPT Creating Hattamla...
CREATE TABLE hattamla(
hattamla_id                NUMBER        NOT NULL PRIMARY KEY
,hattamla_neve             VARCHAR2(300) NOT NULL
,ar                        NUMBER        NOT NULL     
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);

COMMENT ON TABLE hattamla IS 'L?tez? ?sszes irdoaisz?khez illeszhet? h?tt?ml?k list?ja.';
COMMENT ON COLUMN hattamla.hattamla_neve IS 'H?tt?mla neve';
COMMENT ON COLUMN hattamla.ar IS 'H?tt?mla ?ra';
COMMENT ON COLUMN hattamla.mod_user IS 'A rekordot l?trehoz? user';
COMMENT ON COLUMN hattamla.created_on IS 'Rekord l?rehoz?s?nak d?tuma';
COMMENT ON COLUMN hattamla.last_mod IS 'Utols? m?dos?t?s d?tuma';
COMMENT ON COLUMN hattamla.DML_FLAG IS 'Utols? v?grehajtott m?velet';
COMMENT ON COLUMN hattamla.VERSION IS 'Verzi?';
PROMPT Done.
