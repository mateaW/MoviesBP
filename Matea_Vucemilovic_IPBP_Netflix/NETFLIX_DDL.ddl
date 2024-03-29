-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2023-03-27 15:04:40 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE CLANARINE
  (
    ID_Clanarine       NUMBER NOT NULL ,
    "E-Mail"           VARCHAR2 (30) NOT NULL ,
    Broj_Mobitela      VARCHAR2 (15) NOT NULL ,
    DRZAVE_ID_Drzave   NUMBER NOT NULL ,
    PLANOVI_ID_Plana   NUMBER NOT NULL ,
    KARTICE_ID_Kartice NUMBER NOT NULL
  ) ;
ALTER TABLE CLANARINE ADD CONSTRAINT CLANARINE_PK PRIMARY KEY ( ID_Clanarine ) ;
ALTER TABLE CLANARINE ADD CONSTRAINT "CLANARINE_E-Mail_UN" UNIQUE ( "E-Mail" ) ;
ALTER TABLE CLANARINE ADD CONSTRAINT CLANARINE_Broj_Mobitela_UN UNIQUE ( Broj_Mobitela ) ;


CREATE TABLE DRZAVE
  (
    ID_Drzave NUMBER NOT NULL ,
    Naziv     VARCHAR2 (30) NOT NULL
  ) ;
ALTER TABLE DRZAVE ADD CONSTRAINT DRZAVE_PK PRIMARY KEY ( ID_Drzave ) ;


CREATE TABLE EPIZODE
  (
    ID_Epizode             NUMBER NOT NULL ,
    Naziv                  VARCHAR2 (50) ,
    Trajanje               NUMBER NOT NULL ,
    Opis                   VARCHAR2 (100) ,
    SEZONE_ID_Sezone       NUMBER NOT NULL ,
    REDATELJI_ID_Redatelja NUMBER NOT NULL
  ) ;
ALTER TABLE EPIZODE ADD CONSTRAINT EPIZODE_PK PRIMARY KEY ( ID_Epizode ) ;


CREATE TABLE EPIZODE_KORISNICI
  (
    EPIZODE_ID_Epizode     NUMBER NOT NULL ,
    KORISNICI_ID_Korisnika NUMBER NOT NULL ,
    PRIJEVODI_ID_Prijevoda NUMBER NOT NULL
  ) ;
ALTER TABLE EPIZODE_KORISNICI ADD CONSTRAINT EPIZODE_KORISNICI_PK PRIMARY KEY ( EPIZODE_ID_Epizode, KORISNICI_ID_Korisnika ) ;


CREATE TABLE FILMOVI
  (
    ID_Filma               NUMBER NOT NULL ,
    Naziv                  VARCHAR2 (50) NOT NULL ,
    Godina                 NUMBER (4) NOT NULL ,
    Trajanje               NUMBER NOT NULL ,
    Opis                   VARCHAR2 (100) NOT NULL ,
    DRZAVE_ID_Drzave       NUMBER NOT NULL ,
    REDATELJI_ID_Redatelja NUMBER NOT NULL
  ) ;
ALTER TABLE FILMOVI ADD CONSTRAINT FILMOVI_PK PRIMARY KEY ( ID_Filma ) ;


CREATE TABLE FILMOVI_KORISNICI
  (
    FILMOVI_ID_Filma       NUMBER NOT NULL ,
    KORISNICI_ID_Korisnika NUMBER NOT NULL ,
    PRIJEVODI_ID_Prijevoda NUMBER NOT NULL
  ) ;
ALTER TABLE FILMOVI_KORISNICI ADD CONSTRAINT FILMOVI_KORISNICI_PK PRIMARY KEY ( FILMOVI_ID_Filma, KORISNICI_ID_Korisnika ) ;


CREATE TABLE GLUMCI
  (
    ID_Glumca NUMBER NOT NULL ,
    Ime       VARCHAR2 (30) NOT NULL ,
    Prezime   VARCHAR2 (30)
  ) ;
ALTER TABLE GLUMCI ADD CONSTRAINT GLUMCI_PK PRIMARY KEY ( ID_Glumca ) ;


CREATE TABLE GLUMCI_EPIZODE
  (
    Naziv_Lika         VARCHAR2 (50) ,
    EPIZODE_ID_Epizode NUMBER NOT NULL ,
    GLUMCI_ID_Glumca   NUMBER NOT NULL
  ) ;
ALTER TABLE GLUMCI_EPIZODE ADD CONSTRAINT GLUMCI_EPIZODE_PK PRIMARY KEY ( EPIZODE_ID_Epizode, GLUMCI_ID_Glumca ) ;


CREATE TABLE GLUMCI_FILMOVI
  (
    Naziv_Lika       VARCHAR2 (50) ,
    GLUMCI_ID_Glumca NUMBER NOT NULL ,
    FILMOVI_ID_Filma NUMBER NOT NULL
  ) ;
ALTER TABLE GLUMCI_FILMOVI ADD CONSTRAINT GLUMCI_FILMOVI_PK PRIMARY KEY ( GLUMCI_ID_Glumca, FILMOVI_ID_Filma ) ;


CREATE TABLE KARTICE
  (
    ID_Kartice   NUMBER NOT NULL ,
    Broj_Kartice VARCHAR2 (16) NOT NULL ,
    CCV          VARCHAR2 (3) NOT NULL ,
    Datum_Isteka DATE NOT NULL
  ) ;
ALTER TABLE KARTICE ADD CONSTRAINT KARTICE_PK PRIMARY KEY ( ID_Kartice ) ;
ALTER TABLE KARTICE ADD CONSTRAINT KARTICE_Broj_Kartice_UN UNIQUE ( Broj_Kartice ) ;


CREATE TABLE KORISNICI
  (
    ID_Korisnika           NUMBER NOT NULL ,
    Ime                    VARCHAR2 (10) NOT NULL ,
    CLANARINE_ID_Clanarine NUMBER NOT NULL
  ) ;
ALTER TABLE KORISNICI ADD CONSTRAINT KORISNICI_PK PRIMARY KEY ( ID_Korisnika ) ;


CREATE TABLE PLANOVI
  (
    ID_Plana NUMBER NOT NULL ,
    Naziv    VARCHAR2 (15) NOT NULL ,
    Cijena   VARCHAR2 (5) NOT NULL
  ) ;
ALTER TABLE PLANOVI ADD CONSTRAINT PLANOVI_PK PRIMARY KEY ( ID_Plana ) ;


CREATE TABLE PRIJEVODI
  (
    ID_Prijevoda NUMBER NOT NULL ,
    Naziv        VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE PRIJEVODI ADD CONSTRAINT PRIJEVODI_PK PRIMARY KEY ( ID_Prijevoda ) ;


CREATE TABLE RACUNI
  (
    ID_Racuna        NUMBER NOT NULL ,
    Broj_Racuna      VARCHAR2 (20) NOT NULL ,
    Datum            DATE NOT NULL ,
    PLANOVI_ID_Plana NUMBER NOT NULL
  ) ;
ALTER TABLE RACUNI ADD CONSTRAINT RACUNI_PK PRIMARY KEY ( ID_Racuna ) ;
ALTER TABLE RACUNI ADD CONSTRAINT RACUNI_Broj_Racuna_UN UNIQUE ( Broj_Racuna ) ;


CREATE TABLE REDATELJI
  (
    ID_Redatelja NUMBER NOT NULL ,
    Ime          VARCHAR2 (30) NOT NULL ,
    Prezime      VARCHAR2 (30)
  ) ;
ALTER TABLE REDATELJI ADD CONSTRAINT REDATELJI_PK PRIMARY KEY ( ID_Redatelja ) ;


CREATE TABLE SERIJE
  (
    ID_Serije        NUMBER NOT NULL ,
    Naziv            VARCHAR2 (50) NOT NULL ,
    Godina           NUMBER (4) NOT NULL ,
    Opis             VARCHAR2 (100) NOT NULL ,
    Broj_Sezona      NUMBER (3) NOT NULL ,
    DRZAVE_ID_Drzave NUMBER NOT NULL
  ) ;
ALTER TABLE SERIJE ADD CONSTRAINT SERIJE_PK PRIMARY KEY ( ID_Serije ) ;


CREATE TABLE SEZONE
  (
    ID_Sezone        NUMBER NOT NULL ,
    Naziv            VARCHAR2 (50) ,
    Broj_Epizoda     NUMBER (3) NOT NULL ,
    Opis             VARCHAR2 (100) ,
    Godina           NUMBER (4) NOT NULL ,
    SERIJE_ID_Serije NUMBER NOT NULL
  ) ;
ALTER TABLE SEZONE ADD CONSTRAINT SEZONE_PK PRIMARY KEY ( ID_Sezone ) ;


CREATE TABLE ZANROVI
  (
    ID_Zanra NUMBER NOT NULL ,
    Naziv    VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE ZANROVI ADD CONSTRAINT ZANROVI_PK PRIMARY KEY ( ID_Zanra ) ;


CREATE TABLE ZANROVI_FILMOVI
  (
    ZANROVI_ID_Zanra NUMBER NOT NULL ,
    FILMOVI_ID_Filma NUMBER NOT NULL
  ) ;
ALTER TABLE ZANROVI_FILMOVI ADD CONSTRAINT ZANROVI_FILMOVI_PK PRIMARY KEY ( ZANROVI_ID_Zanra, FILMOVI_ID_Filma ) ;


CREATE TABLE ZANROVI_SERIJE
  (
    ZANROVI_ID_Zanra NUMBER NOT NULL ,
    SERIJE_ID_Serije NUMBER NOT NULL
  ) ;
ALTER TABLE ZANROVI_SERIJE ADD CONSTRAINT ZANROVI_SERIJE_PK PRIMARY KEY ( ZANROVI_ID_Zanra, SERIJE_ID_Serije ) ;


ALTER TABLE CLANARINE ADD CONSTRAINT CLANARINE_DRZAVE_FK FOREIGN KEY ( DRZAVE_ID_Drzave ) REFERENCES DRZAVE ( ID_Drzave ) ;

ALTER TABLE CLANARINE ADD CONSTRAINT CLANARINE_KARTICE_FK FOREIGN KEY ( KARTICE_ID_Kartice ) REFERENCES KARTICE ( ID_Kartice ) ;

ALTER TABLE CLANARINE ADD CONSTRAINT CLANARINE_PLANOVI_FK FOREIGN KEY ( PLANOVI_ID_Plana ) REFERENCES PLANOVI ( ID_Plana ) ;

ALTER TABLE EPIZODE_KORISNICI ADD CONSTRAINT EPIZODE_KORISNICI_EPIZODE_FK FOREIGN KEY ( EPIZODE_ID_Epizode ) REFERENCES EPIZODE ( ID_Epizode ) ;

ALTER TABLE EPIZODE_KORISNICI ADD CONSTRAINT EPIZODE_KORISNICI_KORISNICI_FK FOREIGN KEY ( KORISNICI_ID_Korisnika ) REFERENCES KORISNICI ( ID_Korisnika ) ;

ALTER TABLE EPIZODE_KORISNICI ADD CONSTRAINT EPIZODE_KORISNICI_PRIJEVODI_FK FOREIGN KEY ( PRIJEVODI_ID_Prijevoda ) REFERENCES PRIJEVODI ( ID_Prijevoda ) ;

ALTER TABLE EPIZODE ADD CONSTRAINT EPIZODE_REDATELJI_FK FOREIGN KEY ( REDATELJI_ID_Redatelja ) REFERENCES REDATELJI ( ID_Redatelja ) ;

ALTER TABLE EPIZODE ADD CONSTRAINT EPIZODE_SEZONE_FK FOREIGN KEY ( SEZONE_ID_Sezone ) REFERENCES SEZONE ( ID_Sezone ) ;

ALTER TABLE FILMOVI ADD CONSTRAINT FILMOVI_DRZAVE_FK FOREIGN KEY ( DRZAVE_ID_Drzave ) REFERENCES DRZAVE ( ID_Drzave ) ;

ALTER TABLE FILMOVI_KORISNICI ADD CONSTRAINT FILMOVI_KORISNICI_FILMOVI_FK FOREIGN KEY ( FILMOVI_ID_Filma ) REFERENCES FILMOVI ( ID_Filma ) ;

ALTER TABLE FILMOVI_KORISNICI ADD CONSTRAINT FILMOVI_KORISNICI_KORISNICI_FK FOREIGN KEY ( KORISNICI_ID_Korisnika ) REFERENCES KORISNICI ( ID_Korisnika ) ;

ALTER TABLE FILMOVI_KORISNICI ADD CONSTRAINT FILMOVI_KORISNICI_PRIJEVODI_FK FOREIGN KEY ( PRIJEVODI_ID_Prijevoda ) REFERENCES PRIJEVODI ( ID_Prijevoda ) ;

ALTER TABLE FILMOVI ADD CONSTRAINT FILMOVI_REDATELJI_FK FOREIGN KEY ( REDATELJI_ID_Redatelja ) REFERENCES REDATELJI ( ID_Redatelja ) ;

ALTER TABLE GLUMCI_EPIZODE ADD CONSTRAINT GLUMCI_EPIZODE_EPIZODE_FK FOREIGN KEY ( EPIZODE_ID_Epizode ) REFERENCES EPIZODE ( ID_Epizode ) ;

ALTER TABLE GLUMCI_EPIZODE ADD CONSTRAINT GLUMCI_EPIZODE_GLUMCI_FK FOREIGN KEY ( GLUMCI_ID_Glumca ) REFERENCES GLUMCI ( ID_Glumca ) ;

ALTER TABLE GLUMCI_FILMOVI ADD CONSTRAINT GLUMCI_FILMOVI_FILMOVI_FK FOREIGN KEY ( FILMOVI_ID_Filma ) REFERENCES FILMOVI ( ID_Filma ) ;

ALTER TABLE GLUMCI_FILMOVI ADD CONSTRAINT GLUMCI_FILMOVI_GLUMCI_FK FOREIGN KEY ( GLUMCI_ID_Glumca ) REFERENCES GLUMCI ( ID_Glumca ) ;

ALTER TABLE KORISNICI ADD CONSTRAINT KORISNICI_CLANARINE_FK FOREIGN KEY ( CLANARINE_ID_Clanarine ) REFERENCES CLANARINE ( ID_Clanarine ) ;

ALTER TABLE RACUNI ADD CONSTRAINT RACUNI_PLANOVI_FK FOREIGN KEY ( PLANOVI_ID_Plana ) REFERENCES PLANOVI ( ID_Plana ) ;

ALTER TABLE SERIJE ADD CONSTRAINT SERIJE_DRZAVE_FK FOREIGN KEY ( DRZAVE_ID_Drzave ) REFERENCES DRZAVE ( ID_Drzave ) ;

ALTER TABLE SEZONE ADD CONSTRAINT SEZONE_SERIJE_FK FOREIGN KEY ( SERIJE_ID_Serije ) REFERENCES SERIJE ( ID_Serije ) ;

ALTER TABLE ZANROVI_FILMOVI ADD CONSTRAINT ZANROVI_FILMOVI_FILMOVI_FK FOREIGN KEY ( FILMOVI_ID_Filma ) REFERENCES FILMOVI ( ID_Filma ) ;

ALTER TABLE ZANROVI_FILMOVI ADD CONSTRAINT ZANROVI_FILMOVI_ZANROVI_FK FOREIGN KEY ( ZANROVI_ID_Zanra ) REFERENCES ZANROVI ( ID_Zanra ) ;

ALTER TABLE ZANROVI_SERIJE ADD CONSTRAINT ZANROVI_SERIJE_SERIJE_FK FOREIGN KEY ( SERIJE_ID_Serije ) REFERENCES SERIJE ( ID_Serije ) ;

ALTER TABLE ZANROVI_SERIJE ADD CONSTRAINT ZANROVI_SERIJE_ZANROVI_FK FOREIGN KEY ( ZANROVI_ID_Zanra ) REFERENCES ZANROVI ( ID_Zanra ) ;

CREATE SEQUENCE CLANARINA_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER CLANARINA_TRG BEFORE
  INSERT ON CLANARINE FOR EACH ROW WHEN (NEW.ID_Clanarine IS NULL) BEGIN :NEW.ID_Clanarine := CLANARINA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE DRZAVA_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER DRZAVA_TRG BEFORE
  INSERT ON DRZAVE FOR EACH ROW WHEN (NEW.ID_Drzave IS NULL) BEGIN :NEW.ID_Drzave := DRZAVA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE EPIZODA_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER EPIZODA_TRG BEFORE
  INSERT ON EPIZODE FOR EACH ROW WHEN (NEW.ID_Epizode IS NULL) BEGIN :NEW.ID_Epizode := EPIZODA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE FILM_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER FILM_TRG BEFORE
  INSERT ON FILMOVI FOR EACH ROW WHEN (NEW.ID_Filma IS NULL) BEGIN :NEW.ID_Filma := FILM_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE GLUMAC_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER GLUMAC_TRG BEFORE
  INSERT ON GLUMCI FOR EACH ROW WHEN (NEW.ID_Glumca IS NULL) BEGIN :NEW.ID_Glumca := GLUMAC_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE KARTICA_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER KARTICA_TRG BEFORE
  INSERT ON KARTICE FOR EACH ROW WHEN (NEW.ID_Kartice IS NULL) BEGIN :NEW.ID_Kartice := KARTICA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE KORISNIK_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER KORISNIK_TRG BEFORE
  INSERT ON KORISNICI FOR EACH ROW WHEN (NEW.ID_Korisnika IS NULL) BEGIN :NEW.ID_Korisnika := KORISNIK_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE PLAN_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER PLAN_TRG BEFORE
  INSERT ON PLANOVI FOR EACH ROW WHEN (NEW.ID_Plana IS NULL) BEGIN :NEW.ID_Plana := PLAN_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE PRIJEVOD_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER PRIJEVOD_TRG BEFORE
  INSERT ON PRIJEVODI FOR EACH ROW WHEN (NEW.ID_Prijevoda IS NULL) BEGIN :NEW.ID_Prijevoda := PRIJEVOD_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE RACUN_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER RACUN_TRG BEFORE
  INSERT ON RACUNI FOR EACH ROW WHEN (NEW.ID_Racuna IS NULL) BEGIN :NEW.ID_Racuna := RACUN_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE REDATELJ_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER REDATELJ_TRG BEFORE
  INSERT ON REDATELJI FOR EACH ROW WHEN (NEW.ID_Redatelja IS NULL) BEGIN :NEW.ID_Redatelja := REDATELJ_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE SERIJA_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER SERIJA_TRG BEFORE
  INSERT ON SERIJE FOR EACH ROW WHEN (NEW.ID_Serije IS NULL) BEGIN :NEW.ID_Serije := SERIJA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE SEZONA_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER SEZONA_TRG BEFORE
  INSERT ON SEZONE FOR EACH ROW WHEN (NEW.ID_Sezone IS NULL) BEGIN :NEW.ID_Sezone := SEZONA_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE ZANR_SEQ START WITH 1 MINVALUE 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER ZANR_TRG BEFORE
  INSERT ON ZANROVI FOR EACH ROW WHEN (NEW.ID_Zanra IS NULL) BEGIN :NEW.ID_Zanra := ZANR_SEQ.NEXTVAL;
END;
/


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             49
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          14
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         14
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
