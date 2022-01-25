PROMPT Creating audits tables...

CREATE TABLE funkcionalitas_audit(
funkcio_id                 varchar2(40)
,funkcio_neve              varchar2(200)    
,ar                        NUMBER
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE funkcio_irodaiszek_audit(
funkcio_id                 NUMBER       
,irodaiszek_id             NUMBER 
,audit_id                  NUMBER
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE hattamla_audit(
hattamla_id                NUMBER       
,hattamla_neve             VARCHAR2(300)
,ar                        NUMBER          
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE irodaiszek_audit(
irodaiszek_id              NUMBER        
,hattamla_id               NUMBER        
,talp_id                   NUMBER        
,ules_id                   NUMBER   
,ar                        NUMBER    
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE rendeles_audit(
rendeles_id                NUMBER        
,ugyfel_id                 NUMBER          
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE ugyfel_audit(
ugyfel_id                  NUMBER   
,vezetek_nev               varchar2(30)
,kereszt_nev               varchar2(30)
,email                     varchar2(30)
,ossz_ar                   NUMBER     
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE rendeles_irodaiszek_audit(
rendeles_id_e              NUMBER        
,irodaiszek_id_e           NUMBER       
,audit_id                  number 
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE talp_audit(
talp_id                    NUMBER        
,talp_neve                 VARCHAR2(300)
,ar                        NUMBER    
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/
CREATE TABLE ules_audit(
ules_id                    NUMBER       
,ules_neve                 VARCHAR2(300)
,ar                        NUMBER     
,mod_user                  varchar2(300)
,created_on                timestamp
,last_mod                  timestamp
,DML_FLAG                  varchar2(1)
,VERSION                   number
);
/

PROMPT Creating audits done...

